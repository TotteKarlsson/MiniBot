#include <vcl.h>
#pragma hdrstop
#include <tchar.h>
#include <string>
#include <Vcl.Styles.hpp>
#include <Vcl.Themes.hpp>
#include "mtkLogger.h"
#include "mtkVCLUtils.h"
#include "core/atExceptions.h"
#include "forms/TSplashForm.h"
#include "mtkRestartApplicationUtils.h"
#include "UIUtilities.h"
using namespace mtk;
using namespace std;

//---------------------------------------------------------------------------
USEFORM("MainForm.cpp", Main);
//---------------------------------------------------------------------------
string 				gAppName					= "MiniBot";
string              gLogFileLocation            = joinPath(getSpecialFolder(CSIDL_LOCAL_APPDATA), gAppName);
string              gLogFileName                = "MiniBot.log";
string 		        gApplicationRegistryRoot  	= "\\Software\\Allen Institute\\MiniBot\\0.5.0";
string 		        gAppDataFolder 				= joinPath(getSpecialFolder(CSIDL_LOCAL_APPDATA), gAppName);
HWND                gOtherAppWindow             = NULL;
string              gDefaultAppTheme            = "Iceberg Classico";
string              gAppMutexName     		    = "MiniBotMutex";
string              gRestartMutexName           = "MiniBotRestartMutex";
string              gFullDateTimeFormat         = "%Y-%m-%dT%H:%M:%S";
string              gDateFormat                 = "%Y-%m-%d";
string              gTimeFormat                 = "%H:%M:%S";
bool                gIsDevelopmentRelease       = false;
bool                gAppIsStartingUp            = true;
bool                gHideSplash                 = false;
TSplashForm*        gSplashForm                 = NULL;

int __stdcall FindOtherWindow(HWND hwnd, LPARAM lParam);

//---------------------------------------------------------------------------
int WINAPI _tWinMain(HINSTANCE, HINSTANCE, LPTSTR, int)
{
    //The app mutex is used to check for already running instances
    HANDLE appMutex;

	try
	{
		// Initialize restart code
		// Check if this instance is restarted and
		// wait while previos instance finish
		if (mtk::checkForCommandLineFlag("--Restart"))
		{
            //TODO: Fix this.. not working properly..
            //            MessageDlg("Wait...", mtWarning, TMsgDlgButtons() << mbOK, 0);
			mtk::WaitForPreviousProcessToFinish(gRestartMutexName);
            Sleep(1000);
		}

        //Look at this later... does not work yet
        const char* appMutexName  = gAppMutexName.c_str();
        appMutex = ::CreateMutexA(NULL, FALSE, appMutexName);
        if( ERROR_ALREADY_EXISTS == GetLastError() )
        {
             Log(lInfo) << gAppName << " is already running!";
            // Program already running somewhere
            ::EnumWindows(FindOtherWindow, NULL);

            if(gOtherAppWindow != NULL)
            {
                //Send a custom message to restore window here..
                Log(lInfo) << gAppName << " is already running!";
            }

            return(1); // Exit program
        }

        setupLogging(gLogFileLocation, gLogFileName);

		Application->Initialize();
		Application->MainFormOnTaskBar = true;


        if(!gHideSplash)
        {
	        gSplashForm = new TSplashForm(gLogFileName, Application);
            Application->ShowMainForm = false;
            gSplashForm->TAboutArrayBotFrame1->AppNameLabel->Caption = vclstr(gAppName);
            gSplashForm->Show();
            gSplashForm->Update();
        }
        else
        {
            gSplashForm = NULL;
        }

		Application->Title = "MiniBot - Software for Microtomes";
		TStyleManager::TrySetStyle("Carbon");
		Application->CreateForm(__classid(TMain), &Main);
		Application->ShowMainForm = false;
		Application->Run();
        delete gSplashForm;
	}
	catch (Exception &exception)
	{
		Application->ShowException(&exception);
	}
    catch(const ATException& e)
    {
		Application->ShowException(&Exception(e.what()));
    }
	catch (...)
	{
		try
		{
			throw Exception("Unhandled exception");
		}
		catch (Exception &exception)
		{
			Application->ShowException(&exception);
		}
	}
	return 0;
}

