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
#pragma link "TAboutArrayBot_2Frame"
#pragma link "TMotorPositionFrame"
#pragma resource "*.dfm"
//---------------------------------------------------------------------------
TMain *Main;

extern string           gLogFileLocation;
extern string           gLogFileName;
extern string           gAppDataFolder;
extern TSplashForm*  	gSplashForm;
extern bool             gAppIsStartingUp;
extern string 			gApplicationRegistryRoot;
extern string 			gAppName;

using namespace mtk;
string gDiveProcessName = "Dive";

void DummyFocus()
{
    Main->DummyBtn->Visible=true;
    Main->DummyBtn->SetFocus();
    Main->DummyBtn->Visible=false;
}

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
void __fastcall TMain::UIUpdateTimerTimer(TObject *Sender)
{
	if(MainPC->TabIndex == pcMain)
    {
    	DummyFocus();
    }
}

//---------------------------------------------------------------------------
void __fastcall TMain::FormKeyPress(TObject *Sender, System::WideChar &Key)
{
    //Get the motor and jog it
    APTMotor* m = mAB.getMotorWithName("COVERSLIP UNIT_Z");
    if(!m)
    {
        Log(lError) << "Failed getting Coverslip UnitZ motor";
    }

    if(Key == 'u' || Key == 'U')
    {
		LiftBtn->Click();
    }
    else if(Key == 'd' || Key == 'D')
    {
	    DiveButton->Click();
    }
}

//---------------------------------------------------------------------------
void __fastcall TMain::FormKeyDown(TObject *Sender, WORD &Key, TShiftState Shift)
{
    //Get the motor and jog it
    APTMotor* m = mAB.getMotorWithName("COVERSLIP UNIT_Z");
    if(!m)
    {
        Log(lError) << "Failed getting Coverslip UnitZ motor";
    }

	if(Key == vkEscape)
    {
    	Close();
    }
    else if(Key == VK_UP && m)
    {
       	m->jogReverse();
    }
    else if(Key == VK_DOWN && m)
    {
       	m->jogForward();
    }

    if(Key == vkDown || Key == vkUp)
    {
	    //Enable checkForNewPositionTimer
        if(!CheckForNewPositionTimer->Enabled)
        {
            sleep(100);
            CheckForNewPositionTimer->Enabled = true;
        }
    }
}

//---------------------------------------------------------------------------
void __fastcall TMain::FormKeyUp(TObject *Sender, WORD &Key, TShiftState Shift)

{
    if(Key == VK_UP || Key == VK_DOWN)
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
}

//---------------------------------------------------------------------------
void __fastcall TMain::WndProc(TMessage& Message)
{
	TForm::WndProc(Message);
	switch (Message.Msg)
    {
    	case WM_GETDLGCODE:
	    	Log(lInfo) << "Got WM_GETDLGCODE";
        break;

		case CM_WANTSPECIALKEY:
        {
	    	Log(lInfo) << "Got WM_WANTSPECIALKEY";
        	APTMotor* m = mAB.getMotorWithName("COVERSLIP UNIT_Z");
            if(!m)
            {
                Log(lError) << "Failed getting Coverslip UnitZ motor";
            }


            switch (reinterpret_cast<TCMWantSpecialKey&>(Message).CharCode)
            {
                case VK_LEFT:
                case VK_RIGHT:
                case VK_UP:
                case VK_DOWN:

                    break;
            }
            Message.Result = 1;
        }
        break;
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
void __fastcall TMain::mClearLogWindowBtnClick(TObject *Sender)
{
	if(infoMemo)
    {
    	infoMemo->Clear();
    }
}

//---------------------------------------------------------------------------
void __fastcall TMain::DiveButtonClick(TObject *Sender)
{
	//Run a sequence
	mProcessSequencer.selectSequence("Dive");
    mProcessSequencer.start();
}

//---------------------------------------------------------------------------
void __fastcall TMain::LiftBtnClick(TObject *Sender)
{
	//Run a sequence
	mProcessSequencer.selectSequence("Lift CS");
    mProcessSequencer.start();
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
    this->SetFocus();
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
        if(mProcessSequencer.getSequences().getCurrentSequenceName() == gDiveProcessName)
        {
        	Log(lInfo) << "Found sequence: \"Fill Boat\"";
            ProcessSequence* s = mProcessSequencer.getSequences().getCurrent();
            if(s && s->getProcessWithName(gDiveProcessName))
            {
            	Process* p = s->getProcessWithName(gDiveProcessName);

                if(p && p->getProcessName() == gDiveProcessName)
                {
                	AbsoluteMove* am = dynamic_cast<AbsoluteMove*>(p);
                    {
                    	if(am)
                        {
                        	if(isEqual(am->getPosition(), m->getPosition(), 3))
                            {
                        		am->setPosition(m->getPosition());
                            }
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
            	Log(lError) << "Failed getting process: " <<gDiveProcessName;
            }
        }
    }
}




