#ifndef MainFormH
#define MainFormH
#include "abApplicationMessages.h"
#include "arraycam/atArrayCamClient.h"
#include "arraybot/atArrayBot.h"
#include "abUIDataStructures.h"
#include "InitArrayBotThread.h"
#include "mtkIniFileProperties.h"
#include "mtkLogFileReader.h"
#include "TRegistryForm.h"
#include "TSTDStringLabeledEdit.h"
#include <System.Actions.hpp>
#include <System.Classes.hpp>
#include <Vcl.ActnList.hpp>
#include <Vcl.AppEvnts.hpp>
#include <Vcl.Buttons.hpp>
#include <Vcl.ComCtrls.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.Mask.hpp>
#include <Vcl.Menus.hpp>
#include <Vcl.StdActns.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.ToolWin.hpp>
#include "TFloatLabeledEdit.h"
#include "TIntegerLabeledEdit.h"
#include "TIntLabel.h"
#include "TPropertyCheckBox.h"
#include "TArrayBotBtn.h"
#include "TAboutArrayBot_2Frame.h"
#include "TMotorPositionFrame.h"
//---------------------------------------------------------------------------

using Poco::Timestamp;
using mtk::IniFileProperties;
class TABProcessSequencerFrame;
class TRibbonLifterFrame;
class TXYZUnitFrame;
class TSequencerButtonsFrame;

//---------------------------------------------------------------------------
class TMain : public TRegistryForm
{
    __published:	// IDE-managed Components
        TActionList *ActionList1;
        TAction *checkForDevices;
        TAction *addDevicesToListBox;
        TTimer *ShutDownTimer;
        TAction *identifyCurrent;
        TAction *homeDevice;
        TAction *jogForward;
        TAction *jogBackwards;
        TAction *moveForward;
        TAction *moveBackward;
        TAction *stopAllA;
        TApplicationEvents *ApplicationEvents1;
	TAction *reInitBotA;
        TAction *ShutDownA;
	TFileExit *FileExit1;
	TPageControl *MainPC;
	TTabSheet *mFrontPage;
	TTabSheet *TabSheet1;
	TScrollBox *ScrollBox1;
	TTabSheet *TabSheet2;
	TTabSheet *TabSheet5;
	TPanel *BottomPanel;
	TMemo *infoMemo;
	TToolBar *ToolBar1;
	TBitBtn *mClearLogWindowBtn;
	TTimer *UIUpdateTimer;

	TComboBox *LogLevelCB;
	TTabSheet *mMoveSequencesPage;
	TTimer *WaitForDeviceInitTimer;
	TPanel *Panel1;
	TBitBtn *mCheckDevicesBtn;
	TBitBtn *ReInitBotBtn;
	TPanel *MiddlePanel;
	TTabSheet *TabSheet3;
	TAboutArrayBotFrame_2 *TAboutArrayBotFrame_21;
	TArrayBotButton *StopButton;
	TBitBtn *BitBtn1;
	TAction *HomeAllDevicesA;
	TArrayBotButton *DiveButton;
	TArrayBotButton *LiftBtn;
	TArrayBotButton *FillMoreBtn;
	TArrayBotButton *FillLessBtn;
	TPanel *Panel2;
	TMotorPositionFrame *MotorPositionFrame1;
	TPanel *Panel3;
	TMemo *Memo1;
    void __fastcall FormKeyDown(TObject *Sender, WORD &Key, TShiftState Shift);
    void __fastcall checkForDevicesExecute(TObject *Sender);
    void __fastcall FormCreate(TObject *Sender);
    void __fastcall FormCloseQuery(TObject *Sender, bool &CanClose);
    void __fastcall ShutDownTimerTimer(TObject *Sender);
    void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
    void __fastcall stopAllAExecute(TObject *Sender);
    void __fastcall ApplicationEvents1Exception(TObject *Sender, Exception *E);
    void __fastcall reInitBotAExecute(TObject *Sender);
    void __fastcall ShutDownAExecute(TObject *Sender);
	void __fastcall FormShow(TObject *Sender);
	void __fastcall LogLevelCBChange(TObject *Sender);
	void __fastcall WaitForDeviceInitTimerTimer(TObject *Sender);
	void __fastcall MainPCChange(TObject *Sender);
	void __fastcall HomeAllDevicesAExecute(TObject *Sender);
	void __fastcall mClearLogWindowBtnClick(TObject *Sender);
	void __fastcall DiveButtonClick(TObject *Sender);
	void __fastcall LiftBtnClick(TObject *Sender);
	void __fastcall JogMotorMouseUp(TObject *Sender, TMouseButton Button, TShiftState Shift,
          int X, int Y);
	void __fastcall JogMotorMouseDown(TObject *Sender, TMouseButton Button, TShiftState Shift,
          int X, int Y);
	void __fastcall FormKeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall FormKeyUp(TObject *Sender, WORD &Key, TShiftState Shift);
	void __fastcall UIUpdateTimerTimer(TObject *Sender);

    private:
		enum PageControlTabs 					{pcMain = 0,  pcMoveSequences,
        										pcMotors, pcLogs, pcAbout};

        void									enableDisableUI(bool enable);
        LogFileReader                           mLogFileReader;
        void __fastcall                         logMsg();

        void __fastcall 						WndProc(TMessage& Message);

		void 						            setupWindowTitle();
        InitBotThread					        mInitBotThread;
        void __fastcall					        onFinishedInitBot();
        void __fastcall					        setupUIFrames();

        IniFile						            mIniFile;
        IniFileProperties  			            mProperties;
		mtk::Property<mtk::LogLevel>            mLogLevel;

		void									setupProperties();

        										//!The ArrayCam client connects to
                                                //an ArrayCam server. The client processes
                                                //incoming messages over a socket, in
                                                //onArrayCamMessageReceived
		ArrayCamClient				        	mArrayCamClient;

        							            //!Arraybot is allocated on the heap.
                                                //!So that we can catch init exceptions in the
                                                //!constructor of the main form
        ArrayBot					            mAB;

          										//!The Process sequencer allow individual
                                                //!processes to be executed in sequence
  	    ProcessSequencer  						mProcessSequencer;
		TXYZUnitFrame*					        mXYZUnitFrame1;


		TABProcessSequencerFrame*		        mABProcessSequencerFrame;
        TSequencerButtonsFrame*			        mSequencerButtons1;
		void __fastcall		                    OnException();
        void									updateDivePosition(double newPos);
	public:
		__fastcall 					            TMain(TComponent* Owner);
		__fastcall 					            ~TMain();
};

extern PACKAGE TMain *Main;
#endif
