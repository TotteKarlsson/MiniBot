#include <vcl.h>
#pragma hdrstop
#include "MainForm.h"
#include "TMemoLogger.h"
#include "forms/TSplashForm.h"
#include "mtkStringList.h"
#include "core/atUtilities.h"
#include "arraybot/apt/atAPTMotor.h"
#include "arraybot/apt/atTCubeDCServo.h"
#include "mtkVCLUtils.h"
#include "mtkLogger.h"
#include <bitset>
#include "mtkMathUtils.h"
#include "core/atExceptions.h"
#include "sound/atSounds.h"
#include "core/atCore.h"
#include "TABProcessSequencerFrame.h"
#include "frames/TXYZPositionsFrame.h"
#include "frames/TXYZUnitFrame.h"
#include "frames/TSequencerButtonsFrame.h"
#include "UIUtilities.h"
#include "arraybot/apt/atAbsoluteMove.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "TIntegerLabeledEdit"
#pragma link "TFloatLabeledEdit"
#pragma link "TSTDStringLabeledEdit"
#pragma link "mtkFloatLabel"
#pragma link "TAboutArrayBotFrame"
#pragma link "TAboutArrayBot_2Frame"
#pragma link "TPropertyCheckBox"
#pragma link "cspin"
#pragma link "TSoundsFrame"
#pragma link "TApplicationSoundsFrame"
#pragma link "TMotorPositionFrame"
#pragma resource "*.dfm"
TMain *Main;

extern string           gLogFileLocation;
extern string           gLogFileName;
extern string           gAppDataFolder;
extern TSplashForm*  	gSplashForm;
extern bool             gAppIsStartingUp;
extern string 			gApplicationRegistryRoot;
extern string 			gAppName;

using namespace mtk;
string gFillBoatProcessName = "Fill Boat";

//---------------------------------------------------------------------------
__fastcall TMain::TMain(TComponent* Owner)
:
	TRegistryForm(gApplicationRegistryRoot, "MainForm", Owner),
	mLogFileReader(joinPath(gAppDataFolder, gLogFileName), &logMsg),
    mInitBotThread(),
    mIniFile(joinPath(gAppDataFolder, gAppName + ".ini"), true, true),
    mLogLevel(lAny),
    mAB(mIniFile, gAppDataFolder),
    mProcessSequencer(mAB, mArrayCamClient, gAppDataFolder),
	mABProcessSequencerFrame(NULL),
    mSequencerButtons1(NULL)
{
    //Init the CoreLibDLL -> give intra messages their ID's
	initABCoreLib();

	TMemoLogger::mMemoIsEnabled = false;
   	mLogFileReader.start(true);

    setupProperties();
    mProperties.read();

	//Load motors in a thread
    mInitBotThread.assingBot(&mAB);
    mInitBotThread.onFinishedInit = this->onFinishedInitBot;

    //We will setup UI frames after the bot is initialized
	mInitBotThread.start();

	WaitForDeviceInitTimer->Enabled = true;
}

//---------------------------------------------------------------------------
void TMain::enableDisableUI(bool e)
{
	MainPC->Visible = e;
	enableDisablePanel(MiddlePanel, e);
}

//---------------------------------------------------------------------------
void __fastcall TMain::WndProc(TMessage& Message)
{
    if (Message.Msg == getABCoreMessageID("MOTOR_WARNING_MESSAGE") && getABCoreMessageID("MOTOR_WARNING_MESSAGE") != 0)
    {
    	MotorMessageData* msg = reinterpret_cast<MotorMessageData*>(Message.WParam);
       	APTMotor* mtr = mAB.getMotorWithSerial(msg->mSerial);

        if(!mtr)
        {
        	//real bad....
        }

		//Handle the warning..
        if(msg->mCurrentPosition >= msg->mPositionLimits.getValue().getMax())
        {
            if(mtr)
            {
            	if(mtr->getLastCommand() != mcStopHard)
                {
            		mtr->stop();
	                //playABSound(absMotorWarning);
    	            Log(lInfo) << "Stopped motor: "<<mtr->getName();
                }
            }
        }

        if(mtr->isInDangerZone())
        {
        	//playABSound(absMotorWarning);
        }

        //Message is now consumed.. delete it
        delete msg;
    }
    else
    {
        TForm::WndProc(Message);
    }
}

//---------------------------------------------------------------------------
void __fastcall TMain::WaitForDeviceInitTimerTimer(TObject *Sender)
{
	if(!mInitBotThread.isRunning()) //Not waiting for devices any more
    {
		WaitForDeviceInitTimer->Enabled = false;

        setupUIFrames();
        enableDisableUI(true);
    }
}

//---------------------------------------------------------------------------
void __fastcall TMain::reInitBotAExecute(TObject *Sender)
{
	mAB.initialize();

    if(mXYZUnitFrame1)
    {
		mXYZUnitFrame1->assignUnit(&mAB.getCoverSlipUnit());
    }

    //ArrayBotJoyStick stuff.....
    ReInitBotBtn->Action = ShutDownA;
}

//---------------------------------------------------------------------------
void __fastcall TMain::stopAllAExecute(TObject *Sender)
{
	mAB.stopAll();
}


//---------------------------------------------------------------------------
void __fastcall TMain::AppInBox(mlxStructMessage &msg)
{
    if(msg.lparam == NULL)
    {
        return;
    }

    try
    {
        ApplicationMessageEnum aMsg = msg.lparam->mMessageEnum;

        switch(aMsg)
        {
            case abSplashWasClosed:
                Log(lDebug2) << "Splash form sent message that it was closed";
                gSplashForm = NULL;
            break;

            case abSequencerUpdate:
                Log(lDebug2) << "Update sequencer shortcuts";
                if(mSequencerButtons1)
                {
                	mSequencerButtons1->update();
                }

            break;
            default:
            break ;
        }
	}
	catch(...)
	{
		Log(lError) << "Received an unhandled windows message!";
	}
}

//---------------------------------------------------------------------------
void __fastcall TMain::MainPCChange(TObject *Sender)
{
	//Check what tab got selected
	if(MainPC->TabIndex == pcMoveSequences && mABProcessSequencerFrame != NULL)
    {
    	//Reload the currently selected sequence
		mABProcessSequencerFrame->mSequencesCBChange(Sender);
    }

    else if(MainPC->TabIndex == pcMain)
    {
        if(mSequencerButtons1)
        {
        	mSequencerButtons1->update();
        }
    }
    else if(MainPC->TabIndex == pcMotors)
    {
		//Disable joystick
	 	mAB.disableJoyStick();

        //Disable motor status timers
        mXYZUnitFrame1->enable();
    }

	else if(MainPC->TabIndex == pcAbout)
    {
		TAboutArrayBotFrame_21->populate();
    }

    if(MainPC->TabIndex != pcMotors)
    {
   	 	mAB.enableJoyStick();

        //Disable motor status timers
        mXYZUnitFrame1->disable();
    }
}

//---------------------------------------------------------------------------
void __fastcall TMain::HomeAllDevicesAExecute(TObject *Sender)
{
	if(MessageDlg("ATTENTION: Make sure all motors have a free path to their home position before executing!", mtWarning, TMsgDlgButtons() << mbOK<<mbCancel, 0) == mrOk)
    {
		mAB.homeAll();
    }
}

//---------------------------------------------------------------------------
void __fastcall TMain::WaitForHandleTimerTimer(TObject *Sender)
{
    if(Application->MainForm->Handle)
    {
        WaitForHandleTimer->Enabled = false;

        //Send a message to main ui to update sequence shortcuts
        if(sendAppMessage(abSequencerUpdate) != true)
        {
            Log(lDebug)<<"Sending sequencer update to UI was unsuccesful";
        }
    }
}

//---------------------------------------------------------------------------
void __fastcall TMain::mClearLogWindowBtnClick(TObject *Sender)
{
	if(infoMemo)
    {
    	infoMemo->Clear();
    }
}

//---------------------------------------------------------------------------
void __fastcall TMain::ArrayBotButton1Click(TObject *Sender)
{
	//Run a sequence
	mProcessSequencer.selectSequence("Drain Boat");
    mProcessSequencer.start();
}

//---------------------------------------------------------------------------
void __fastcall TMain::ArrayBotButton2Click(TObject *Sender)
{
	//Run a sequence
	mProcessSequencer.selectSequence("Fill Boat");
    mProcessSequencer.start();
}

//---------------------------------------------------------------------------
void __fastcall TMain::JogEditEdit(TObject *Sender, WORD &Key, TShiftState Shift)
{
	if(Key != vkReturn)
    {
    	return;
    }

    TFloatLabeledEdit* e = dynamic_cast<TFloatLabeledEdit*>(Sender);

    //Get the motor and jog it
    APTMotor* m = mAB.getMotorWithName("COVERSLIP UNIT_Z");
    if(!m)
    {
    	Log(lError) << "Failed getting Coverslip UnitZ motor";
        return;
    }

    if(e == JogStepE)
    {
 		m->setJogStep(e->getValue());
    }
    else if(e == JogVelocityE)
    {
 		m->setJogVelocity(e->getValue());
    }
    else if(e == JogAccelerationE)
    {
 		m->setJogAcceleration(e->getValue());
    }
}

//---------------------------------------------------------------------------
void __fastcall TMain::JogMotorMouseUp(TObject *Sender, TMouseButton Button,
          TShiftState Shift, int X, int Y)
{
   //Get the motor and jog it
    APTMotor* m = mAB.getMotorWithName("COVERSLIP UNIT_Z");
    if(!m)
    {
    	Log(lError) << "Failed getting Coverslip UnitZ motor";
        return;
    }

	if(m->getJogMoveMode() == jmContinuous)
    {
    	m->stop();
    }
}

//---------------------------------------------------------------------------
void __fastcall TMain::JogMotorMouseDown(TObject *Sender, TMouseButton Button,
          TShiftState Shift, int X, int Y)
{
	TArrayBotButton* btn = dynamic_cast<TArrayBotButton*>(Sender);
    if(!btn)
    {
    	Log(lError) << "Failed to cast button";
    	return;
    }

    //Get the motor and jog it
    APTMotor* m = mAB.getMotorWithName("COVERSLIP UNIT_Z");
    if(!m)
    {
    	Log(lError) << "Failed getting Coverslip UnitZ motor";
        return;
    }

    if(btn == FillMoreBtn)
    {
        m->jogReverse();
    }
    else if(btn == FillLessBtn)
    {
        //Get the motor and jog it
    	m->jogForward();
    }


    //Enable checkForNewPositionTimer
    if(!CheckForNewPositionTimer->Enabled)
    {
    	sleep(100);
	    CheckForNewPositionTimer->Enabled = true;
    }
}

//---------------------------------------------------------------------------
void __fastcall TMain::CheckForNewPositionTimerTimer(TObject *Sender)
{
	//wait for ab to be inactive
    APTMotor* m = mAB.getMotorWithName("COVERSLIP UNIT_Z");
    if(m && !m->isActive() && !m->isMotorCommandPending())
    {
		CheckForNewPositionTimer->Enabled = false;

		//Get the fill sequence
        if(mProcessSequencer.getSequences().getCurrentSequenceName() == gFillBoatProcessName)
        {
        	Log(lInfo) << "Found sequence: \"Fill Boat\"";
            ProcessSequence* s = mProcessSequencer.getSequences().getCurrent();
            if(s && s->getProcessWithName(gFillBoatProcessName))
            {
            	Process* p = s->getProcessWithName(gFillBoatProcessName);

                if(p && p->getProcessName() == gFillBoatProcessName)
                {
                	AbsoluteMove* am = dynamic_cast<AbsoluteMove*>(p);
                    {
                    	if(am)
                        {
                        	am->setPosition(m->getPosition());
                        }
                        else
                        {
		                    Log(lError) << "Failed to cast to an AbsoluteMove process..";
                        }
                    }
                }
                else
                {
                    Log(lError) << "Failed getting process with name: GotoZ";
                }

            }
            else
            {
            	Log(lError) << "Failed getting process: " <<gFillBoatProcessName;
            }
        }
    }
}


