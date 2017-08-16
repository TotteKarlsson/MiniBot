object Main: TMain
  Left = 0
  Top = 0
  Caption = 'MiniBot Version 0.5.8'
  ClientHeight = 992
  ClientWidth = 1486
  Color = clBtnFace
  Constraints.MinHeight = 900
  Constraints.MinWidth = 1100
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 23
  object MainPC: TPageControl
    Left = 0
    Top = 0
    Width = 1486
    Height = 782
    ActivePage = mFrontPage
    Align = alClient
    TabHeight = 60
    TabOrder = 0
    TabWidth = 150
    OnChange = MainPCChange
    object mFrontPage: TTabSheet
      Caption = 'The Bot'
      object MiddlePanel: TPanel
        Left = 0
        Top = 0
        Width = 1478
        Height = 712
        Align = alClient
        AutoSize = True
        TabOrder = 0
      end
    end
    object mMoveSequencesPage: TTabSheet
      Caption = 'Sequences'
      ImageIndex = 4
    end
    object TabSheet1: TTabSheet
      Caption = 'Motors'
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 0
        Width = 1373
        Height = 712
        HorzScrollBar.Smooth = True
        VertScrollBar.Tracking = True
        Align = alClient
        BorderStyle = bsNone
        Padding.Left = 5
        Padding.Top = 5
        Padding.Right = 5
        Padding.Bottom = 5
        TabOrder = 0
      end
      object Panel1: TPanel
        Left = 1373
        Top = 0
        Width = 105
        Height = 712
        Align = alRight
        TabOrder = 1
        object mCheckDevicesBtn: TBitBtn
          Left = 1
          Top = 177
          Width = 103
          Height = 176
          Action = checkForDevices
          Align = alTop
          BiDiMode = bdLeftToRight
          Caption = 'Devices Check'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 0
          WordWrap = True
        end
        object ReInitBotBtn: TBitBtn
          Left = 1
          Top = 353
          Width = 103
          Height = 177
          Action = reInitBotA
          Align = alTop
          BiDiMode = bdLeftToRight
          Caption = 'Reinitialize Devices'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 1
          WordWrap = True
        end
        object BitBtn1: TBitBtn
          Left = 1
          Top = 1
          Width = 103
          Height = 176
          Action = HomeAllDevicesA
          Align = alTop
          BiDiMode = bdLeftToRight
          Caption = 'Home All'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 2
          WordWrap = True
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Settings'
      ImageIndex = 2
    end
    object TabSheet5: TTabSheet
      Caption = 'Logging'
      ImageIndex = 4
      object BottomPanel: TPanel
        Left = 0
        Top = 0
        Width = 1478
        Height = 712
        Align = alClient
        TabOrder = 0
        object infoMemo: TMemo
          Left = 1
          Top = 31
          Width = 1476
          Height = 680
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 0
          WordWrap = False
        end
        object ToolBar1: TToolBar
          Left = 1
          Top = 1
          Width = 1476
          Height = 30
          AutoSize = True
          ButtonHeight = 30
          Caption = 'ToolBar1'
          TabOrder = 1
          object mClearLogWindowBtn: TBitBtn
            Left = 0
            Top = 0
            Width = 75
            Height = 30
            Caption = 'Clear'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object LogLevelCB: TComboBox
            Left = 75
            Top = 0
            Width = 145
            Height = 31
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Text = 'INFO'
            OnChange = LogLevelCBChange
            Items.Strings = (
              'INFO'
              'Everything')
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'About'
      ImageIndex = 6
      inline TAboutArrayBotFrame_21: TAboutArrayBotFrame_2
        Left = 0
        Top = 0
        Width = 1478
        Height = 712
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 1478
        ExplicitHeight = 712
        inherited GroupBox1: TGroupBox
          Width = 1478
          Height = 526
          ExplicitWidth = 1478
          ExplicitHeight = 526
          inherited Memo1: TMemo
            Top = 25
            Width = 1474
            Height = 499
            ExplicitTop = 25
            ExplicitWidth = 1474
            ExplicitHeight = 499
          end
        end
        inherited Panel1: TPanel
          Width = 1478
          ExplicitWidth = 1478
          inherited Image1: TImage
            Left = 1292
            ExplicitLeft = 708
          end
        end
      end
    end
  end
  object StopButton: TArrayBotButton
    AlignWithMargins = True
    Left = 15
    Top = 797
    Width = 1456
    Height = 180
    Margins.Left = 15
    Margins.Top = 15
    Margins.Right = 15
    Margins.Bottom = 15
    Action = stopAllA
    Align = alBottom
    BiDiMode = bdLeftToRight
    Caption = 'Stop All Motors'
    ParentBiDiMode = False
    Style = bsNew
    TabOrder = 1
    SoundID = 'BUTTON_CLICK_4'
  end
  object ActionList1: TActionList
    Left = 764
    Top = 792
    object checkForDevices: TAction
      Caption = 'Devices Check'
      OnExecute = checkForDevicesExecute
    end
    object addDevicesToListBox: TAction
      Caption = 'Connect All'
    end
    object identifyCurrent: TAction
      Caption = 'Identify'
    end
    object homeDevice: TAction
      Caption = 'Home'
    end
    object jogForward: TAction
      Caption = 'Fwd'
    end
    object jogBackwards: TAction
      Caption = 'Rev'
    end
    object moveForward: TAction
      Caption = 'Forward'
    end
    object moveBackward: TAction
      Caption = 'Backward'
    end
    object stopAllA: TAction
      Caption = 'Stop All'
      OnExecute = stopAllAExecute
    end
    object reInitBotA: TAction
      Caption = 'Reinitialize Devices'
      OnExecute = reInitBotAExecute
    end
    object ShutDownA: TAction
      Caption = 'Disconnect Devices'
      OnExecute = ShutDownAExecute
    end
    object FileExit1: TFileExit
      Caption = 'E&xit'
      Hint = 'Exit|Quits the application'
      ImageIndex = 43
    end
    object abortLiftA: TAction
      Caption = 'Abort Lift'
    end
    object liftA: TAction
      Caption = 'Lift'
    end
    object HomeAllDevicesA: TAction
      Caption = 'Home All'
      OnExecute = HomeAllDevicesAExecute
    end
  end
  object ShutDownTimer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = ShutDownTimerTimer
    Left = 228
    Top = 760
  end
  object ApplicationEvents1: TApplicationEvents
    OnException = ApplicationEvents1Exception
    Left = 664
    Top = 784
  end
  object UIUpdateTimer: TTimer
    Enabled = False
    Interval = 250
    Left = 468
    Top = 752
  end
  object LiftTimer: TTimer
    Enabled = False
    Interval = 200
    Left = 1392
    Top = 256
  end
  object WaitForDeviceInitTimer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = WaitForDeviceInitTimerTimer
    Left = 576
    Top = 752
  end
  object WaitForHandleTimer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = WaitForHandleTimerTimer
    Left = 480
    Top = 496
  end
end
