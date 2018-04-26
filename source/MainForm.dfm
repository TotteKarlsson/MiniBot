object Main: TMain
  Left = 0
  Top = 0
  Caption = 'MiniBot Version 0.5.8'
  ClientHeight = 872
  ClientWidth = 1179
  Color = clBtnFace
  Constraints.MinHeight = 910
  Constraints.MinWidth = 1195
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
  OnKeyPress = FormKeyPress
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 23
  object MainPC: TPageControl
    Left = 0
    Top = 0
    Width = 1179
    Height = 872
    ActivePage = mFrontPage
    Align = alClient
    TabHeight = 60
    TabOrder = 0
    TabWidth = 150
    OnChange = MainPCChange
    object mFrontPage: TTabSheet
      Caption = 'The Bot'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object MiddlePanel: TPanel
        Left = 0
        Top = 0
        Width = 1171
        Height = 802
        Align = alClient
        AutoSize = True
        TabOrder = 0
        DesignSize = (
          1171
          802)
        object LiftBtn: TArrayBotButton
          Left = 67
          Top = 40
          Width = 400
          Height = 400
          Caption = 'Lift'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -43
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = LiftBtnClick
          SoundID = 'BUTTON_CLICK_4'
        end
        object StopButton: TArrayBotButton
          Left = 67
          Top = 594
          Width = 183
          Height = 180
          Margins.Left = 15
          Margins.Top = 15
          Margins.Right = 15
          Margins.Bottom = 15
          Action = stopAllA
          Anchors = [akLeft, akBottom]
          BiDiMode = bdLeftToRight
          Caption = 'Stop Motor'
          ParentBiDiMode = False
          Style = bsNew
          TabOrder = 1
          SoundID = 'BUTTON_CLICK_4'
        end
        object Panel2: TPanel
          Left = 540
          Top = 16
          Width = 612
          Height = 465
          Anchors = [akTop, akRight]
          BevelOuter = bvNone
          Caption = 'Panel2'
          Constraints.MinWidth = 612
          TabOrder = 2
          DesignSize = (
            612
            465)
          object DiveButton: TArrayBotButton
            Left = 45
            Top = 24
            Width = 400
            Height = 400
            Anchors = [akTop]
            Caption = 'Dive'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -43
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = DiveButtonClick
            SoundID = 'BUTTON_CLICK_4'
          end
          object FillLessBtn: TArrayBotButton
            Left = 472
            Top = 261
            Width = 137
            Height = 105
            Anchors = [akTop, akRight]
            Caption = 'v'
            TabOrder = 1
            OnMouseDown = JogMotorMouseDown
            OnMouseUp = JogMotorMouseUp
            SoundID = 'BUTTON_CLICK_4'
          end
          object FillMoreBtn: TArrayBotButton
            Left = 472
            Top = 128
            Width = 137
            Height = 105
            Anchors = [akTop, akRight]
            Caption = '^'
            TabOrder = 2
            OnMouseDown = JogMotorMouseDown
            OnMouseUp = JogMotorMouseUp
            SoundID = 'BUTTON_CLICK_4'
          end
        end
        object MotorPositionFrame1: TMotorPositionFrame
          Left = 991
          Top = 704
          Width = 161
          Height = 81
          Anchors = [akRight, akBottom]
          AutoSize = True
          TabOrder = 3
        end
      end
    end
    object mMoveSequencesPage: TTabSheet
      Caption = 'Sequences'
      ImageIndex = 4
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    object TabSheet1: TTabSheet
      Caption = 'Motors'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 0
        Width = 1066
        Height = 802
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
        Left = 1066
        Top = 0
        Width = 105
        Height = 802
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
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    object TabSheet5: TTabSheet
      Caption = 'Logging'
      ImageIndex = 4
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object BottomPanel: TPanel
        Left = 0
        Top = 0
        Width = 1171
        Height = 802
        Align = alClient
        TabOrder = 0
        object infoMemo: TMemo
          Left = 1
          Top = 31
          Width = 1169
          Height = 770
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
          Width = 1169
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
            OnClick = mClearLogWindowBtnClick
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
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      inline TAboutArrayBotFrame_21: TAboutArrayBotFrame_2
        Left = 0
        Top = 0
        Width = 1171
        Height = 448
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 296
        ExplicitHeight = 448
        inherited GroupBox1: TGroupBox
          Width = 1171
          Height = 262
          ExplicitWidth = 296
          ExplicitHeight = 262
          inherited Memo1: TMemo
            Top = 25
            Width = 1167
            Height = 235
            ExplicitTop = 25
            ExplicitWidth = 292
            ExplicitHeight = 235
          end
        end
        inherited Panel1: TPanel
          Width = 1171
          ExplicitWidth = 1171
          inherited Image1: TImage
            Left = 985
            ExplicitLeft = 708
          end
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 448
        Width = 1171
        Height = 354
        Align = alBottom
        TabOrder = 1
        object Memo1: TMemo
          Left = 1
          Top = 1
          Width = 1169
          Height = 352
          Align = alClient
          Lines.Strings = (
            'MiniBot Help'
            
              'There are two main operation of the MiniBot, '#39'Dive'#39' and '#39'Lift'#39'. ' +
              ' Dive is used to submerge a coverslip into the Microtome boat, a' +
              'nd the Lift '
            'operation is used to lift the Coverslip out of the boat.'
            
              'The Dive and Lift operation can be executed by pressing the butt' +
              'ons on the UI, using a keyboard, or using a foot switch.'
            ''
            'Keyboard'
            '    Use the keyboard keys '#39'L'#39' for Lift and '#39'D'#39' for Dive.'
            
              '    Use the Up and Down arrows for fine tuning the '#39'Dive'#39' positi' +
              'on.'
            ''
            'FootSwitch'
            
              '    The footswitch operates the motor. It will execute and toggl' +
              'e between the Lift and Dive operation. '
            
              '    If the foot switch is pressed while the motor is running, th' +
              'en the motor will stop and the operation (Lift or Dive) will be ' +
              'toggled.'
            ''
            
              'Setup motor properties on the Motors page, e.g. velocity and tri' +
              'm step.')
          TabOrder = 0
          ExplicitLeft = 0
          ExplicitTop = 4
        end
      end
    end
  end
  object ActionList1: TActionList
    Left = 716
    Top = 752
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
    Left = 348
    Top = 752
  end
  object ApplicationEvents1: TApplicationEvents
    OnException = ApplicationEvents1Exception
    Left = 624
    Top = 656
  end
  object UIUpdateTimer: TTimer
    Enabled = False
    Interval = 250
    OnTimer = UIUpdateTimerTimer
    Left = 436
    Top = 752
  end
  object WaitForDeviceInitTimer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = WaitForDeviceInitTimerTimer
    Left = 544
    Top = 752
  end
end
