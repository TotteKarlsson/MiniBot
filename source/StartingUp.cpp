#include <vcl.h>
#pragma hdrstop
#include "MainForm.h"
#include "TMemoLogger.h"
#include "TSplashForm.h"
#include "TXYZUnitFrame.h"
#include "TXYZPositionsFrame.h"
#include "arraybot/apt/atAPTMotor.h"
#include "TSequencerButtonsFrame.h"
#include "frames/TABProcessSequencerFrame.h"
#include "UIUtilities.h"
#include "mtkVCLUtils.h"


//---------------------------------------------------------------------------
extern TSplashForm*  	gSplashForm;
extern bool             gAppIsStartingUp;
extern string           gAppDataFolder;


//---------------------------------------------------------------------------
void __fastcall TMain::FormCreate(TObject *Sender)
{
	this->ReadRegistry();
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
	WaitForHandleTimer->Enabled = true;
}

//---------------------------------------------------------------------------
void __fastcall TMain::FormShow(TObject *Sender)
{

}

void TMain::setupProperties()
{
	//Setup UI properties
    mProperties.setSection("UI");
	mProperties.setIniFile(&mIniFile);

	mProperties.add((BaseProperty*)  &mLogLevel.setup( 	                    		"LOG_LEVEL",    	                lAny));
}

void __fastcall	TMain::setupUIFrames()
{
    //Create MoveSequencer frame
    mABProcessSequencerFrame = new TABProcessSequencerFrame(mProcessSequencer, gAppDataFolder, mMoveSequencesPage);
    mABProcessSequencerFrame->Parent = mMoveSequencesPage;
    mABProcessSequencerFrame->Align = alClient;
    mABProcessSequencerFrame->init();

    //The sequencer buttons frame holds shortcut buttons for preprogrammed sequences
    mSequencerButtons1 = new TSequencerButtonsFrame(mProcessSequencer, "Cutting", MiddlePanel);
    mSequencerButtons1->Parent = CategoryPanel1;
    mSequencerButtons1->Align = alClient;
    CategoryPanel1->Caption = vclstr(mSequencerButtons1->getCategory());

    mSequencerButtons2 = new TSequencerButtonsFrame(mProcessSequencer, "Setup", MiddlePanel);
    mSequencerButtons2->Parent = CategoryPanel2;
    mSequencerButtons2->Align = alClient;
    CategoryPanel2->Caption = vclstr(mSequencerButtons2->getCategory());

    //Create frames showing motor positions
    TXYZPositionsFrame* f1 = new TXYZPositionsFrame(this, mAB.getCoverSlipUnit());
    f1->Parent = this->mRightPanel;
    f1->Align = alTop;

    TXYZPositionsFrame* f2 = new TXYZPositionsFrame(this, mAB.getWhiskerUnit());
    f2->Parent = this->mRightPanel;
    f2->Align = alTop;

	//Setup JoyStick;

    //Over ride joysticks button events  (cycle speeds and XY motions)
    mAB.getJoyStick().setButtonEvents(5,  NULL, onJSButton5Click);
    mAB.getJoyStick().setButtonEvents(6,  NULL, onJSButton6Click);

    //!Button 14 emergency stop
    mAB.getJoyStick().setButtonEvents(14, NULL, onJSButton14Click);

    //JoyStick Settings CB
    JoyStickSettings& js = mAB.getJoyStickSettings();
    JoyStickSetting* jss = js.getFirst();
    while(jss)
    {
        JoyStickSettingsCB->Items->AddObject(jss->getLabel().c_str(), (TObject*) jss);
        jss = js.getNext();
    }

    JoyStickSettingsCB->ItemIndex = 0;
    JoyStickSettingsCB->OnChange(NULL);
    mJSSpeedMediumBtn->Click();
    //mJSCSBtn->Click();
	mAB.enableJoyStick();

    //XY velocity parameters
    mMaxXYJogVelocityJoystick->setValue(mAB.getJoyStick().getX1Axis().getMaxVelocity());
    mXYJogAccelerationJoystick->setValue(mAB.getJoyStick().getX1Axis().getAcceleration());

    if(mAB.getCoverSlipUnit().getZMotor())
    {
        mMaxZJogVelocityJoystick->setValue(mAB.getCoverSlipUnit().getZMotor()->getVelocity());
        mZJogAccelerationJoystick->setValue(mAB.getCoverSlipUnit().getZMotor()->getAcceleration());
    }

    //Lift Settings CB
    PairedMoves& pms = mAB.getLiftMoves();
    PairedMove* pm = pms.getFirst();
    while(pm)
    {
        string key = pm->mLabel;
        LiftCB1->Items->AddObject(pm->mLabel.c_str(), (TObject*) pm);
        LiftCB2->Items->AddObject(pm->mLabel.c_str(), (TObject*) pm);
        pm = pms.getNext();
    }

    LiftCB2->ItemIndex = 0;
    LiftCB2->OnChange(NULL);

	//Create and setup XYZ unit frames
    mXYZUnitFrame1 = new TXYZUnitFrame(this);
    mXYZUnitFrame1->assignUnit(&mAB.getCoverSlipUnit());
    mXYZUnitFrame1->Parent = ScrollBox1;
    mXYZUnitFrame1->Left = 10;

    mXYZUnitFrame2 = new TXYZUnitFrame(this);
    mXYZUnitFrame2->assignUnit(&mAB.getWhiskerUnit());
    mXYZUnitFrame2->Parent = ScrollBox1;
    mXYZUnitFrame2->Left = 10;
    mXYZUnitFrame2->Top = mXYZUnitFrame1->Top + mXYZUnitFrame1->Height;
}

void __fastcall	TMain::onFinishedInitBot()
{
	Log(lInfo) << "Synching ArrayBot UI";
    ReInitBotBtn->Action = ShutDownA;

    //Setup the wiggler
    mTheWiggler.setAmplitude(mWigglerAmplitudeE->getValue());
    mTheWiggler.setMaxVelocity(mWigglerVelocityE->getValue());
    mTheWiggler.setMaxAcceleration(mWigglerAccelerationE->getValue());
    mTheWiggler.assignMotors(mAB.getWhiskerUnit().getXMotor(), mAB.getWhiskerUnit().getYMotor());

}

