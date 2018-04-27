#include <vcl.h>
#pragma hdrstop
#include "TMainForm.h"
#include "dslTMemoLogger.h"
#include "forms/TSplashForm.h"
#include "TXYZUnitFrame.h"
#include "TXYZPositionsFrame.h"
#include "arraybot/apt/atAPTMotor.h"
#include "TSequencerButtonsFrame.h"
#include "frames/TABProcessSequencerFrame.h"
#include "UIUtilities.h"
#include "dslVCLUtils.h"
#include "dslLogger.h"

using namespace dsl;
//---------------------------------------------------------------------------
extern TSplashForm*  	gSplashForm;
extern bool             gAppIsStartingUp;
extern string           gAppDataFolder;
extern string           gAppName;

//---------------------------------------------------------------------------
void __fastcall TMainForm::FormCreate(TObject *Sender)
{
	this->readRegistry();
	enableDisableUI(false);

	this->Visible = true;
	setupWindowTitle();

	TMemoLogger::mMemoIsEnabled = true;
    if(gSplashForm)
    {
		gSplashForm->mMainAppIsRunning = true;

        while(gSplashForm->isOnShowTime() == true || mInitBotThread.isAlive())
        {
            Application->ProcessMessages();
            //In order to show whats going on on the splash screen
            if(gSplashForm->Visible == false)
            {
                break;
            }
        }
		gSplashForm->Close();
    }

	gLogger.setLogLevel(mLogLevel);

	if(mLogLevel == lInfo)
	{
		LogLevelCB->ItemIndex = 0;
	}
	else if(mLogLevel == lAny)
	{
		LogLevelCB->ItemIndex = 1;
	}

	//Try to connect to the arraycam app server..

	TMemoLogger::mMemoIsEnabled = true;
    UIUpdateTimer->Enabled = true;

    //Init pagecontrols
	MainPC->TabIndex = 0;
	gAppIsStartingUp = false;
    this->SetFocus();
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::FormShow(TObject *Sender)
{}

void TMainForm::setupProperties()
{
	//Setup UI properties
    mProperties.setSection("UI");
	mProperties.setIniFile(&mIniFile);
	mProperties.add((BaseProperty*)  &mLogLevel.setup( 	                    		"LOG_LEVEL",    	                lAny));
}

void __fastcall	TMainForm::setupUIFrames()
{
    //Create MoveSequencer frame
    mABProcessSequencerFrame = new TABProcessSequencerFrame(mProcessSequencer, gAppDataFolder, mMoveSequencesPage);

    mABProcessSequencerFrame->Parent = mMoveSequencesPage;
    mABProcessSequencerFrame->Align = alClient;
    mABProcessSequencerFrame->init();

	//Create and setup XYZ unit frames
    mXYZUnitFrame1 = new TXYZUnitFrame(this);
    mXYZUnitFrame1->assignUnit(&mAB.getCoverSlipUnit());
    mXYZUnitFrame1->Parent = ScrollBox1;
    mXYZUnitFrame1->Left = 10;

    TAboutArrayBotFrame_21->AppNameLabel->Caption = vclstr(gAppName);
}

void __fastcall	TMainForm::onFinishedInitBot()
{
	Log(lInfo) << "Synching ArrayBot UI";
    ReInitBotBtn->Action = ShutDownA;

    //Get the motor and jog it
    APTMotor* m = mAB.getMotorWithName("COVERSLIP UNIT_Z");
    if(!m)
    {
    	Log(lError) << "Failed getting Coverslip UnitZ motor";
        return;
    }
    MotorPositionFrame1->assignMotor(m);
}

