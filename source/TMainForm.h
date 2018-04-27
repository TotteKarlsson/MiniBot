#ifndef TMainFormH
#define TMainFormH
#include "abApplicationMessages.h"
#include "arraycam/atArrayCamClient.h"
#include "arraybot/atArrayBot.h"
#include "abUIDataStructures.h"
#include "InitArrayBotThread.h"
#include "dslIniFileProperties.h"
#include "dslLogFileReader.h"
#include "dslTRegistryForm.h"
#include "dslTSTDStringLabeledEdit.h"
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
#include "dslTFloatLabeledEdit.h"
#include "dslTIntegerLabeledEdit.h"
#include "dslTIntLabel.h"
#include "dslTPropertyCheckBox.h"
#include "TArrayBotBtn.h"
#include "TAboutArrayBot_2Frame.h"
#include "TMotorPositionFrame.h"
#include "dslLoglevel.h"
#include "uc7/atUC7Component.h"
#include "TUC7StagePositionFrame.h"
#include <Vcl.DBCtrls.hpp>
#include "TApplicationSoundsFrame.h"
#include "TFFMPEGFrame.h"
#include "THDMIStreamerFrame.h"
#include "TPGConnectionFrame.h"
#include "TSoundsFrame.h"
#include "barcodereader/atDS457.h"
#include "dslTFloatLabel.h"
#include "TMoviesFrame.h"
#include <Data.DB.hpp>
#include <Vcl.DBGrids.hpp>
#include <Vcl.Grids.hpp>
//---------------------------------------------------------------------------

using Poco::Timestamp;
using dsl::IniFileProperties;
class TABProcessSequencerFrame;
class TRibbonLifterFrame;
class TXYZUnitFrame;
class TSequencerButtonsFrame;
class THandWheelPositionForm;
//---------------------------------------------------------------------------
class TMainForm : public TRegistryForm
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
	TPanel *LeftPanel;
	TGroupBox *UC7GB;
	TGroupBox *GroupBox4;
	TIntegerLabeledEdit *mStageMoveDelayE;
	TPanel *mTopPanel;
	TComboBox *mUC7ComportCB;
	TButton *mConnectUC7Btn;
	TArrayBotButton *mSynchUIBtn;
	TGroupBox *KnifeGB;
	TUC7StagePositionFrame *ResumeDeltaDistanceFrame;
	TGroupBox *KnifeStageGB;
	TUC7StagePositionFrame *MaxStagePosFrame;
	TArrayBotButton *PopulateMaxNorthPosBtn;
	TUC7StagePositionFrame *CurrentStagePosFrame;
	TTabSheet *UC7Page;
	TPanel *Panel9;
	TGroupBox *RibbonRegistrationGB;
	TLabel *BarcodeLbl;
	TLabel *RibbonIDLbl;
	TLabel *Label7;
	TDBText *DBText1;
	TArrayBotButton *ClearBarcodeBtn;
	TArrayBotButton *ClearRibbonIDBtn;
	TArrayBotButton *RegisterRibbonBtn;
	TArrayBotButton *DecodeSessionBtn;
	TGroupBox *CuttingGB;
	TArrayBotButton *mSetZeroCutBtn;
	TIntegerLabeledEdit *mFeedRateE;
	TIntegerLabeledEdit *mZeroCutsE;
	TIntegerLabeledEdit *mPresetFeedRateE;
	TArrayBotButton *SetPresetFeedBtn;
	TGroupBox *UC7OperationGB;
	TGroupBox *GroupBox12;
	TArrayBotButton *mMoveNorthBtn;
	TArrayBotButton *mMoveSouthBtn;
	TGroupBox *GroupBox8;
	TFloatLabeledEdit *PresetReturnSpeedE;
	TFloatLabeledEdit *SlowReturnSpeedE;
	TFloatLabeledEdit *UltraSlowReturnSpeedE;
	TUC7StagePositionFrame *BackOffStepFrame;
	TPanel *GroupBox7;
	TRadioGroup *StopOptionsRG;
	TPanel *CutterStatusPanel;
	TShape *UC7Shape;
	TLabel *Label4;
	TLabel *Label16;
	TLabel *Label17;
	TLabel *Label18;
	TGroupBox *CutterGB;
	TArrayBotButton *StartStopBtn;
	TGroupBox *GroupBox9;
	TArrayBotButton *PresetReturnSpeedBtn;
	TArrayBotButton *SlowReturnSpeedBtn;
	TArrayBotButton *UltraSlowReturnSpeedBtn;
	TTabSheet *SettingsTab;
	TPageControl *MiscPageControl;
	TTabSheet *TabSheet8;
	TSoundsFrame *TSoundsFrame1;
	TApplicationSoundsFrame *TApplicationSoundsFrame1;
	TTabSheet *TabSheet11;
	TFFMPEGFrame *TFFMPEGFrame1;
	THDMIStreamerFrame *THDMIStreamerFrame1;
	TGroupBox *GroupBox6;
	TButton *BrowseForMediaFolderBtn;
	TSTDStringLabeledEdit *MediaFolderE;
	TTabSheet *RibbonSeparatorSheet;
	TGroupBox *GroupBox10;
	TButton *RunWiperBtn;
	TButton *ConnectWipterClientBtn;
	TTabSheet *TabSheet12;
	TPGConnectionFrame *TPGConnectionFrame1;
	TTabSheet *TabSheet9;
	TGroupBox *BarCodeGB;
	TPanel *Panel4;
	TComboBox *mZebraCOMPortCB;
	TButton *mConnectZebraBtn;
	TComboBox *mZebraBaudRateCB;
	TGroupBox *mImagerSettingsGB;
	TRadioGroup *mScannerAimRG;
	TRadioGroup *mScannerEnabledRG;
	TButton *mBeepBtn;
	TTabSheet *UC7Tab;
	TControlBar *ControlBar1;
	TGroupBox *CounterGB;
	TIntLabel *SectionCounterLabel;
	TIntLabel *RibbonOrderCountLabel;
	TLabel *Label6;
	TFloatLabel *RibbonLengthLbl;
	TLabel *Label19;
	TDBText *DBText7;
	TLabel *Label11;
	TIntegerLabeledEdit *mCountToE;
	TArrayBotButton *mResetCounterBtn;
	TArrayBotButton *mResetRibbonOrderBtn;
	TTabSheet *RibbonsTS;
	TGroupBox *GroupBox14;
	TDBGrid *RibbonsGrid;
	TDBNavigator *RibbonsNavigator;
	TPanel *Panel5;
	TDBText *RibbonID;
	TPanel *Panel11;
	TGroupBox *BlockSelectionGB;
	TLabel *Label1;
	TLabel *Label3;
	TLabel *Label5;
	TDBLookupComboBox *BlockIDCB;
	TDBLookupComboBox *KnifeIDCB;
	TGroupBox *GroupBox5;
	TFloatLabeledEdit *BlockFaceHeight;
	TDBLookupComboBox *mUsersCB;
	TGroupBox *GroupBox3;
	TPanel *Panel6;
	TDBGrid *mRibbonNotesGrid;
	TDBNavigator *mRibbonNotesNavigator;
	TPanel *Panel7;
	TDBMemo *mRibbonNoteMemo;
	TDBNavigator *mRibbonNoteNavigator;
	TMoviesFrame *TMoviesFrame1;
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
	void __fastcall mConnectUC7BtnClick(TObject *Sender);

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
		dsl::Property<dsl::LogLevel>            mLogLevel;

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
        UC7                                     mUC7;
		bool									handleUC7Message(const UC7Message& msg);
		void __fastcall							onConnectedToUC7();
		void __fastcall							onDisConnectedToUC7();


		void __fastcall							enableDisableUC7UI(bool enableDisable);
		void									onUC7Count();
		void									onUC7CountedTo();
//		void __fastcall							AppInBox(ATWindowStructMessage& Msg);


		Property<string>						mLocalDBName;

		Property<int>							mUC7COMPort;
		Property<int>							mCountTo;
		Property<int>							mStopCutterMode;

												//Sound properties
		IniFileProperties						mSoundProperties;
		Property<ApplicationSound>				mBeforeKnifeBackOffSound;
		Property<ApplicationSound>				mKnifeBeforeCuttingSound;
		Property<ApplicationSound>				mKnifeCuttingSound;
		Property<ApplicationSound>				mKnifeAfterCuttingSound;
		Property<ApplicationSound>				mArmRetractingSound;



		Property<int>							mKnifeStageMaxPos;
		Property<int>							mKnifeStageJogStep;
		Property<int>							mKnifeStageResumeDelta;

												//Database stuff
		Property<int>							mDBUserID;
		Property<int>							mBlockID;
		Property<int>							mKnifeID;

		void									populateUsersCB();
		void									populateUsers();
		void	__fastcall						afterDBServerConnect(System::TObject* Sender);
		void	__fastcall						afterDBServerDisconnect(System::TObject* Sender);

        												//!The barcode reader
		DS457									mZebra;

												//INI Parameters...
		Property<int>							mZebraCOMPort;
		Property<int>							mZebraBaudRate;
		int										getZebraCOMPortNumber();
		void __fastcall							onConnectedToZebra();
		void __fastcall							onDisConnectedToZebra();

												//Decoder events
		void __fastcall							onWMDecode(TMessage& Msg);
		void __fastcall							onSSIEvent(TMessage& Msg);
		void __fastcall							onSSIImage(TMessage& Msg);
		void __fastcall							onSSIError(TMessage& Msg);
		void __fastcall							onSSITimeout(TMessage& Msg);
		void __fastcall							onSSICapabilities(TMessage& Msg);

		THandWheelPositionForm*					mHandWheelPositionForm;





	public:
		__fastcall 					            TMainForm(TComponent* Owner);
		__fastcall 					            ~TMainForm();
};

extern PACKAGE TMainForm *MainForm;
#endif
