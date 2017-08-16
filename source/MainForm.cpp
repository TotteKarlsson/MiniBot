#include <vcl.h>
#pragma hdrstop
#include "MainForm.h"
#include "TMemoLogger.h"
#include "TSplashForm.h"
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
#include "frames/TABProcessSequencerFrame.h"
#include "frames/TXYZPositionsFrame.h"
#include "frames/TXYZUnitFrame.h"
#include "frames/TSequencerButtonsFrame.h"
#include "UIUtilities.h"
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
#pragma resource "*.dfm"
TMain *Main;

extern string           gLogFileLocation;
extern string           gLogFileName;
extern string           gAppDataFolder;
extern TSplashForm*  	gSplashForm;
extern bool             gAppIsStartingUp;
extern string 			gApplicationRegistryRoot;

using namespace mtk;

//---------------------------------------------------------------------------
__fastcall TMain::TMain(TComponent* Owner)
:
	TRegistryForm(gApplicationRegistryRoot, "MainForm", Owner),
	mLogFileReader(joinPath(gAppDataFolder, gLogFileName), &logMsg),
    mInitBotThread(),
    mIniFile(joinPath(gAppDataFolder, "ArrayBot.ini"), true, true),
    mLogLevel(lAny),
    mAB(mIniFile, gAppDataFolder),
    mProcessSequencer(mAB, mArrayCamClient, gAppDataFolder),
	mABProcessSequencerFrame(NULL),
    mSequencerButtons1(NULL),
    mSequencerButtons2(NULL)
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

void TMain::enableDisableUI(bool e)
{
	MainPC->Visible = e;
	enableDisablePanel(MiddlePanel, e);
}

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

void __fastcall TMain::reInitBotAExecute(TObject *Sender)
{
	mAB.initialize();

    if(mXYZUnitFrame1)
    {
		mXYZUnitFrame1->assignUnit(&mAB.getCoverSlipUnit());
    }

    if(mXYZUnitFrame2)
    {
		mXYZUnitFrame2->assignUnit(&mAB.getWhiskerUnit());
    }

    //ArrayBotJoyStick stuff.....
    ReInitBotBtn->Action = ShutDownA;
}

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

                if(mSequencerButtons2)
                {
                	mSequencerButtons2->update();
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
//        SequencesPanel1->Parent = mFrontPage;
        if(mSequencerButtons1)
        {
        	mSequencerButtons1->update();
        }

        if(mSequencerButtons2)
        {
        	mSequencerButtons2->update();
        }
    }
    else if(MainPC->TabIndex == pcMotors)
    {
		//Disable joystick
	 	mAB.disableJoyStick();

        //Disable motor status timers
        mXYZUnitFrame1->enable();
        mXYZUnitFrame2->enable();
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
        mXYZUnitFrame2->disable();
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


