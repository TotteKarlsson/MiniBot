object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MiniBot Version 0.5.8'
  ClientHeight = 1041
  ClientWidth = 1483
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
    Top = 82
    Width = 1483
    Height = 959
    ActivePage = SettingsTS
    Align = alClient
    HotTrack = True
    MultiLine = True
    TabHeight = 60
    TabOrder = 0
    TabWidth = 150
    OnChange = MainPCChange
    object MainTS: TTabSheet
      Caption = 'The Bot'
      object MiddlePanel: TPanel
        Left = 254
        Top = 0
        Width = 1221
        Height = 889
        Align = alClient
        AutoSize = True
        TabOrder = 0
        DesignSize = (
          1221
          889)
        object LiftBtn: TArrayBotButton
          Left = 67
          Top = 64
          Width = 250
          Height = 200
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
          Top = 681
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
          Left = 627
          Top = 40
          Width = 612
          Height = 465
          Anchors = [akTop, akRight]
          BevelOuter = bvNone
          Constraints.MinWidth = 612
          TabOrder = 2
          DesignSize = (
            612
            465)
          object DiveButton: TArrayBotButton
            Left = 45
            Top = 24
            Width = 250
            Height = 200
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
      end
      object LeftPanel: TPanel
        Left = 0
        Top = 0
        Width = 254
        Height = 889
        Align = alLeft
        TabOrder = 1
        object CutterGB: TGroupBox
          Left = 1
          Top = 1
          Width = 252
          Height = 887
          Align = alClient
          Caption = 'Cutter'
          TabOrder = 0
          object StartStopBtn: TArrayBotButton
            Left = 2
            Top = 433
            Width = 248
            Height = 452
            Align = alClient
            Caption = 'Start'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentDoubleBuffered = True
            ParentFont = False
            TabOrder = 0
            OnClick = CreateUC7Message
            SoundID = 'BUTTON_CLICK_4'
          end
          object GroupBox9: TGroupBox
            Left = 2
            Top = 25
            Width = 248
            Height = 408
            Align = alTop
            Caption = 'Return Speed'
            TabOrder = 1
            object PresetReturnSpeedBtn: TArrayBotButton
              Left = 22
              Top = 40
              Width = 195
              Height = 81
              Caption = 'Preset'
              TabOrder = 0
              WordWrap = True
              OnClick = CreateUC7Message
              SoundID = 'BUTTON_CLICK_4'
            end
            object SlowReturnSpeedBtn: TArrayBotButton
              Left = 22
              Top = 167
              Width = 195
              Height = 81
              Caption = 'Slow'
              TabOrder = 1
              WordWrap = True
              OnClick = CreateUC7Message
              SoundID = 'BUTTON_CLICK_4'
            end
            object UltraSlowReturnSpeedBtn: TArrayBotButton
              Left = 22
              Top = 294
              Width = 195
              Height = 81
              Caption = 'Ultra Slow'
              TabOrder = 2
              WordWrap = True
              OnClick = CreateUC7Message
              SoundID = 'BUTTON_CLICK_4'
            end
          end
        end
      end
    end
    object UC7Page: TTabSheet
      Caption = 'UC7'
      ImageIndex = 7
      object Panel9: TPanel
        Left = 0
        Top = 0
        Width = 1475
        Height = 889
        Align = alClient
        TabOrder = 0
        object CuttingGB: TGroupBox
          Left = 1
          Top = 42
          Width = 1473
          Height = 112
          Align = alTop
          Caption = 'Feed'
          TabOrder = 0
          object mSetZeroCutBtn: TArrayBotButton
            Left = 134
            Top = 45
            Width = 104
            Height = 50
            Caption = 'Set zero-cut'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            SoundID = 'BUTTON_CLICK_4'
          end
          object mFeedRateE: TIntegerLabeledEdit
            Left = 28
            Top = 48
            Width = 100
            Height = 47
            EditLabel.Width = 121
            EditLabel.Height = 23
            EditLabel.Caption = 'Feed (nm/cut)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -32
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Text = '0'
            OnKeyDown = uc7EditKeyDown
          end
          object mZeroCutsE: TIntegerLabeledEdit
            Left = 616
            Top = 48
            Width = 89
            Height = 47
            EditLabel.Width = 171
            EditLabel.Height = 19
            EditLabel.Caption = 'Zero cuts before backoff'
            EditLabel.Font.Charset = DEFAULT_CHARSET
            EditLabel.Font.Color = clWindowText
            EditLabel.Font.Height = -16
            EditLabel.Font.Name = 'Tahoma'
            EditLabel.Font.Style = []
            EditLabel.ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -32
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Text = '0'
            Visible = False
            OnKeyDown = uc7EditKeyDown
          end
          object mPresetFeedRateE: TIntegerLabeledEdit
            Left = 276
            Top = 48
            Width = 146
            Height = 47
            EditLabel.Width = 178
            EditLabel.Height = 23
            EditLabel.Caption = 'Preset Feed (nm/cut)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -32
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            Text = '0'
            OnKeyDown = uc7EditKeyDown
          end
          object SetPresetFeedBtn: TArrayBotButton
            Left = 428
            Top = 45
            Width = 120
            Height = 50
            Caption = 'Set Preset Feed'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            SoundID = 'BUTTON_CLICK_4'
          end
        end
        object UC7OperationGB: TGroupBox
          Left = 1
          Top = 154
          Width = 1473
          Height = 734
          Align = alClient
          Caption = 'UC7 Operations'
          Constraints.MinHeight = 101
          TabOrder = 1
          object GroupBox7: TPanel
            AlignWithMargins = True
            Left = 5
            Top = 28
            Width = 185
            Height = 701
            Align = alLeft
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 0
            object StopOptionsRG: TRadioGroup
              Left = 0
              Top = 0
              Width = 185
              Height = 252
              Align = alTop
              Caption = 'Stop options'
              Items.Strings = (
                'Immediately'
                'Before Cutting'
                'After Cutting'
                'Before Retracting')
              TabOrder = 0
            end
          end
          object GroupBox8: TGroupBox
            Left = 208
            Top = 28
            Width = 214
            Height = 252
            Caption = 'Return speeds (mm/s)'
            TabOrder = 1
            object PresetReturnSpeedE: TFloatLabeledEdit
              Left = 24
              Top = 56
              Width = 121
              Height = 31
              EditLabel.Width = 51
              EditLabel.Height = 23
              EditLabel.Caption = 'Preset'
              TabOrder = 0
              Text = '0.00'
            end
            object SlowReturnSpeedE: TFloatLabeledEdit
              Left = 24
              Top = 120
              Width = 121
              Height = 31
              EditLabel.Width = 39
              EditLabel.Height = 23
              EditLabel.Caption = 'Slow'
              TabOrder = 1
              Text = '0.00'
            end
            object UltraSlowReturnSpeedE: TFloatLabeledEdit
              Left = 24
              Top = 187
              Width = 121
              Height = 31
              EditLabel.Width = 84
              EditLabel.Height = 23
              EditLabel.Caption = 'Ultra Slow'
              TabOrder = 2
              Text = '0.00'
            end
          end
        end
        object mTopPanel: TPanel
          Left = 1
          Top = 1
          Width = 1473
          Height = 41
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object mUC7ComportCB: TComboBox
            Left = 8
            Top = 4
            Width = 145
            Height = 31
            ItemIndex = 0
            TabOrder = 0
            Text = 'COM1'
            Items.Strings = (
              'COM1'
              'COM2'
              'COM3'
              'COM4'
              'COM5'
              'COM6'
              'COM7'
              'COM8'
              'COM9'
              'COM10'
              'COM11'
              'COM12'
              'COM13'
              'COM14'
              'COM15'
              'COM16'
              'COM17'
              'COM18'
              'COM19'
              'COM20')
          end
          object mConnectUC7Btn: TButton
            Left = 159
            Top = 2
            Width = 67
            Height = 33
            Caption = 'Open'
            TabOrder = 1
            OnClick = mConnectUC7BtnClick
          end
          object mSynchUIBtn: TArrayBotButton
            Left = 232
            Top = 2
            Width = 129
            Height = 33
            Caption = 'Refresh Status'
            ParentDoubleBuffered = True
            TabOrder = 2
            SoundID = 'BUTTON_CLICK_4'
          end
        end
      end
    end
    object SequencesTS: TTabSheet
      Caption = 'Sequences'
      ImageIndex = 4
    end
    object MotorsTS: TTabSheet
      Caption = 'Motors'
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 0
        Width = 1370
        Height = 889
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
        Left = 1370
        Top = 0
        Width = 105
        Height = 889
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
    object LoggingTS: TTabSheet
      Caption = 'Logging'
      ImageIndex = 4
      object BottomPanel: TPanel
        Left = 0
        Top = 0
        Width = 1475
        Height = 889
        Align = alClient
        TabOrder = 0
        object infoMemo: TMemo
          Left = 1
          Top = 31
          Width = 1473
          Height = 857
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
          Width = 1473
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
    object SettingsTS: TTabSheet
      Caption = 'Settings'
      ImageIndex = 8
      object MiscPageControl: TPageControl
        Left = 0
        Top = 0
        Width = 1475
        Height = 889
        ActivePage = TabSheet8
        Align = alClient
        TabOrder = 0
        object UC7Tab: TTabSheet
          Caption = 'UC7'
          ImageIndex = 7
          object UC7GB: TGroupBox
            Left = 0
            Top = 0
            Width = 1467
            Height = 851
            Align = alClient
            Caption = 'UC7'
            TabOrder = 0
            object GroupBox4: TGroupBox
              Left = 2
              Top = 25
              Width = 1463
              Height = 94
              Align = alTop
              Caption = 'Misc parameters'
              TabOrder = 0
              object mStageMoveDelayE: TIntegerLabeledEdit
                Left = 23
                Top = 48
                Width = 151
                Height = 27
                EditLabel.Width = 186
                EditLabel.Height = 23
                EditLabel.Caption = 'StageMove delay (ms)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                Text = '50'
                OnKeyDown = uc7EditKeyDown
                Value = 50
              end
            end
            object KnifeGB: TGroupBox
              Left = 2
              Top = 231
              Width = 1463
              Height = 120
              Align = alTop
              Caption = 'Knife position'
              TabOrder = 1
              inline ResumeDeltaDistanceFrame: TUC7StagePositionFrame
                Left = 280
                Top = 24
                Width = 257
                Height = 81
                AutoSize = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                ExplicitLeft = 280
                ExplicitTop = 24
                inherited GroupBox1: TGroupBox
                  Caption = 'Resume Delta Distance'
                  inherited Label1: TLabel
                    Visible = False
                  end
                  inherited ValueMM: TIntegerEdit
                    Enabled = False
                    Text = '0'
                    Value = 0
                  end
                end
              end
            end
            object KnifeStageGB: TGroupBox
              Left = 2
              Top = 119
              Width = 1463
              Height = 112
              Align = alTop
              Caption = 'Knife Stage'
              TabOrder = 2
              inline MaxStagePosFrame: TUC7StagePositionFrame
                Left = 339
                Top = 24
                Width = 257
                Height = 81
                AutoSize = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                ExplicitLeft = 339
                ExplicitTop = 24
                inherited GroupBox1: TGroupBox
                  Caption = 'Max Knife Position'
                end
              end
              object PopulateMaxNorthPosBtn: TArrayBotButton
                Left = 275
                Top = 51
                Width = 58
                Height = 28
                Caption = '->'
                TabOrder = 1
                SoundID = 'BUTTON_CLICK_4'
              end
              inline CurrentStagePosFrame: TUC7StagePositionFrame
                Left = 13
                Top = 24
                Width = 257
                Height = 81
                AutoSize = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                ExplicitLeft = 13
                ExplicitTop = 24
                inherited GroupBox1: TGroupBox
                  Caption = 'Current Knife Position'
                end
              end
            end
          end
        end
        object TabSheet8: TTabSheet
          Caption = 'Sounds'
          ImageIndex = 1
          inline TSoundsFrame1: TSoundsFrame
            Left = 0
            Top = 241
            Width = 1467
            Height = 610
            Align = alClient
            AutoSize = True
            TabOrder = 0
            ExplicitTop = 241
            ExplicitWidth = 1467
            ExplicitHeight = 610
            inherited GroupBox1: TGroupBox
              Width = 1467
              Height = 610
              Align = alClient
              ExplicitWidth = 1467
              ExplicitHeight = 610
              inherited SoundsLB: TListBox
                Top = 25
                Width = 215
                Height = 583
                ItemHeight = 23
                ExplicitTop = 25
                ExplicitWidth = 215
                ExplicitHeight = 583
              end
            end
          end
          inline TApplicationSoundsFrame1: TApplicationSoundsFrame
            Left = 0
            Top = 0
            Width = 1467
            Height = 241
            Align = alTop
            AutoSize = True
            TabOrder = 1
            ExplicitWidth = 1467
            inherited GBS: TGroupBox
              Width = 1467
              ExplicitWidth = 1467
              inherited ApplicationSoundsLB: TListBox
                Top = 25
                Height = 214
                ItemHeight = 23
                ExplicitTop = 25
                ExplicitHeight = 214
              end
              inherited SoundPropsGB: TGroupBox
                Top = 25
                Width = 1216
                Height = 214
                ExplicitTop = 25
                ExplicitWidth = 1216
                ExplicitHeight = 214
                inherited SoundCB: TComboBox
                  Height = 31
                  ExplicitHeight = 31
                end
              end
            end
          end
        end
        object TabSheet11: TTabSheet
          Caption = 'Media'
          ImageIndex = 3
          object GroupBox6: TGroupBox
            Left = 0
            Top = 0
            Width = 1467
            Height = 89
            Align = alTop
            BiDiMode = bdLeftToRight
            Caption = 'Media'
            ParentBiDiMode = False
            TabOrder = 0
            object BrowseForMediaFolderBtn: TButton
              Left = 339
              Top = 47
              Width = 27
              Height = 25
              Caption = '...'
              TabOrder = 0
            end
            object MediaFolderE: TSTDStringLabeledEdit
              Left = 16
              Top = 46
              Width = 317
              Height = 31
              EditLabel.Width = 152
              EditLabel.Height = 23
              EditLabel.Caption = 'Media Root Folder'
              TabOrder = 1
            end
          end
        end
        object TabSheet12: TTabSheet
          Caption = 'DB Connection'
          ImageIndex = 5
          inline TPGConnectionFrame1: TPGConnectionFrame
            Left = 0
            Top = 0
            Width = 1467
            Height = 201
            Align = alTop
            AutoSize = True
            TabOrder = 0
            ExplicitWidth = 1467
            inherited GBox1: TGroupBox
              Width = 1467
              Align = alClient
              ExplicitWidth = 1467
              inherited mServerIPE: TSTDStringLabeledEdit
                Top = 47
                Width = 473
                Height = 31
                EditLabel.Width = 126
                EditLabel.Height = 23
                EditLabel.ExplicitLeft = 16
                EditLabel.ExplicitTop = 21
                EditLabel.ExplicitWidth = 126
                EditLabel.ExplicitHeight = 23
                ExplicitTop = 47
                ExplicitWidth = 473
                ExplicitHeight = 31
              end
              inherited mDBUserE: TSTDStringLabeledEdit
                Left = 192
                Top = 103
                Height = 31
                EditLabel.Width = 37
                EditLabel.Height = 23
                EditLabel.ExplicitLeft = 192
                EditLabel.ExplicitTop = 77
                EditLabel.ExplicitWidth = 37
                EditLabel.ExplicitHeight = 23
                ExplicitLeft = 192
                ExplicitTop = 103
                ExplicitHeight = 31
              end
              inherited mPasswordE: TSTDStringLabeledEdit
                Left = 370
                Top = 103
                Height = 31
                EditLabel.Width = 78
                EditLabel.Height = 23
                EditLabel.ExplicitLeft = 370
                EditLabel.ExplicitTop = 77
                EditLabel.ExplicitWidth = 78
                EditLabel.ExplicitHeight = 23
                ExplicitLeft = 370
                ExplicitTop = 103
                ExplicitHeight = 31
              end
              inherited mDatabaseE: TSTDStringLabeledEdit
                Left = 18
                Top = 103
                Height = 31
                EditLabel.Width = 78
                EditLabel.Height = 23
                EditLabel.ExplicitLeft = 18
                EditLabel.ExplicitTop = 77
                EditLabel.ExplicitWidth = 78
                EditLabel.ExplicitHeight = 23
                ExplicitLeft = 18
                ExplicitTop = 103
                ExplicitHeight = 31
              end
              inherited ArrayBotButton1: TArrayBotButton
                Left = 512
                Top = 47
                Width = 265
                Height = 81
                ExplicitLeft = 512
                ExplicitTop = 47
                ExplicitWidth = 265
                ExplicitHeight = 81
              end
            end
          end
        end
      end
    end
    object AboutTS: TTabSheet
      Caption = 'About'
      ImageIndex = 6
      object PageControl1: TPageControl
        Left = 0
        Top = 0
        Width = 1475
        Height = 889
        ActivePage = About
        Align = alClient
        TabOrder = 0
        object About: TTabSheet
          Caption = 'About'
          inline TAboutArrayBotFrame_21: TAboutArrayBotFrame_2
            Left = 0
            Top = 0
            Width = 1467
            Height = 851
            Align = alClient
            TabOrder = 0
            ExplicitWidth = 1467
            ExplicitHeight = 851
            inherited GroupBox1: TGroupBox
              Width = 1467
              Height = 665
              ExplicitWidth = 1467
              ExplicitHeight = 665
              inherited Memo1: TMemo
                Top = 25
                Width = 1463
                Height = 638
                ExplicitTop = 25
                ExplicitWidth = 1463
                ExplicitHeight = 638
              end
            end
            inherited Panel1: TPanel
              Width = 1467
              ExplicitWidth = 1467
              inherited Image1: TImage
                Left = 1281
                ExplicitLeft = 708
              end
              inherited AppNameLabel: TLabel
                Width = 168
                Caption = 'MiniBot -'
                ExplicitWidth = 168
              end
            end
          end
        end
        object Help: TTabSheet
          Caption = 'Help'
          ImageIndex = 1
          object Memo1: TMemo
            Left = 0
            Top = 0
            Width = 1467
            Height = 851
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
          end
        end
      end
    end
  end
  object ControlBar1: TControlBar
    Left = 0
    Top = 0
    Width = 1483
    Height = 82
    Align = alTop
    AutoDock = False
    AutoSize = True
    CornerEdge = ceLarge
    DockSite = False
    DrawingStyle = dsGradient
    RowSnap = False
    TabOrder = 1
    object CounterGB: TGroupBox
      Left = 11
      Top = 2
      Width = 1286
      Height = 74
      Align = alClient
      TabOrder = 0
      object SectionCounterLabel: TIntLabel
        Left = 35
        Top = 28
        Width = 16
        Height = 35
        Caption = '1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -29
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Value = 1
        TheFont.Charset = DEFAULT_CHARSET
        TheFont.Color = clWindowText
        TheFont.Height = -29
        TheFont.Name = 'Tahoma'
        TheFont.Style = []
      end
      object RibbonOrderCountLabel: TIntLabel
        Left = 481
        Top = 28
        Width = 16
        Height = 35
        Caption = '1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -29
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Value = 1
        TheFont.Charset = DEFAULT_CHARSET
        TheFont.Color = clWindowText
        TheFont.Height = -29
        TheFont.Name = 'Tahoma'
        TheFont.Style = []
      end
      object Label6: TLabel
        Left = 350
        Top = 34
        Width = 113
        Height = 23
        Caption = 'Ribbon Order'
      end
      object CuttingLbl: TLabel
        Left = 976
        Top = 25
        Width = 60
        Height = 23
        Caption = 'Cutting'
      end
      object AfterCuttingLbl: TLabel
        Left = 1064
        Top = 25
        Width = 106
        Height = 23
        Caption = 'After Cutting'
      end
      object RetractingLbl: TLabel
        Left = 1192
        Top = 25
        Width = 86
        Height = 23
        Caption = 'Retracting'
      end
      object BeforeCuttingLbl: TLabel
        Left = 840
        Top = 25
        Width = 120
        Height = 23
        Caption = 'Before Cutting'
      end
      object UC7Shape: TShape
        Left = 840
        Top = 48
        Width = 93
        Height = 6
        Brush.Color = clLime
      end
      object mCountToE: TIntegerLabeledEdit
        Left = 228
        Top = 30
        Width = 65
        Height = 31
        EditLabel.Width = 76
        EditLabel.Height = 23
        EditLabel.Caption = 'Count To'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = '0'
      end
      object mResetCounterBtn: TArrayBotButton
        Left = 94
        Top = 22
        Width = 68
        Height = 46
        Caption = 'Reset'
        Enabled = False
        ParentDoubleBuffered = True
        TabOrder = 1
        OnClick = mResetCounterBtnClick
        SoundID = 'BUTTON_CLICK_4'
      end
      object mResetRibbonOrderBtn: TArrayBotButton
        Left = 562
        Top = 22
        Width = 84
        Height = 46
        Caption = 'Reset'
        Enabled = False
        ParentDoubleBuffered = True
        TabOrder = 2
        OnClick = mResetCounterBtnClick
        SoundID = 'BUTTON_CLICK_4'
      end
    end
    object ArrayBotButton1: TArrayBotButton
      Left = 1320
      Top = 2
      Width = 157
      Height = 74
      Action = FileExit1
      Align = alRight
      Caption = 'E&xit'
      TabOrder = 1
      SoundID = 'BUTTON_CLICK_4'
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
  object mStartupTimer: TTimer
    Enabled = False
    Interval = 250
    OnTimer = mStartupTimerTimer
    Left = 240
    Top = 752
  end
end
