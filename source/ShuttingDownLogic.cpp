#include <vcl.h>
#pragma hdrstop
#include "MainForm.h"
#include "dslLogger.h"
#include "dslVCLUtils.h"
#include "arraybot/apt/atAPTMotor.h"
#include "forms/TSplashForm.h"
#include "TXYZUnitFrame.h"

using namespace dsl;

static HWND gOtherAppWindow = NULL;
extern TSplashForm*  gSplashForm;


__fastcall TMain::~TMain()
{
//	delete mSequencerButtons;

//    delete mABProcessSequencerFrame;
	mProperties.write();
    mIniFile.save();
}

//---------------------------------------------------------------------------
void __fastcall TMain::ShutDownTimerTimer(TObject *Sender)
{
	ShutDownTimer->Enabled = false;

    if(UIUpdateTimer->Enabled)
    {
        UIUpdateTimer->Enabled = false;
    }

	if(mAB.getJoyStick().isEnabled())
    {
		mAB.getJoyStick().disable();
    }

	if(mAB.isActive())
    {
    	if(!mAB.isShuttingDown())
        {
	        mXYZUnitFrame1->disable();
	    	mAB.shutDown();
        }
        else
        {
        	//Weird..
            mAB.shutDown();
        }
    }

	if(mLogFileReader.isRunning())
	{
		Log(lDebug) << "Shutting down log file reader";
		mLogFileReader.stop();
	}

	Close();
}

void __fastcall TMain::ShutDownAExecute(TObject *Sender)
{
    mAB.getJoyStick().disable();
    mXYZUnitFrame1->disable();

    //The shutdown disconnects all devices
    mAB.shutDown();

	while(mAB.isActive())
    {
    	sleep(100);
    }

    ReInitBotBtn->Action = reInitBotA;
}

//---------------------------------------------------------------------------
void __fastcall TMain::FormCloseQuery(TObject *Sender, bool &CanClose)
{
	Log(lInfo) << "Closing down....";

	//Check if active stuff is going on.. if so call the ShutDown in the
    //Timer fire
	if(	   mAB.getJoyStick().isEnabled()
    	|| mAB.isActive()
        || UIUpdateTimer->Enabled
        || mLogFileReader.isRunning()
      )
    {
  		CanClose = false;
    }
    else
    {
    	CanClose = true;
    }

	if(CanClose == false)
	{
		ShutDownTimer->Enabled = true;
	}
}

//---------------------------------------------------------------------------
void __fastcall TMain::FormClose(TObject *Sender, TCloseAction &Action)
{
	Log(lInfo) << "In FormClose";
}

