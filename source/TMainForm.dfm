object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MiniBot Version 0.5.8'
  ClientHeight = 1041
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
    Top = 123
    Width = 1179
    Height = 918
    ActivePage = UC7Page
    Align = alClient
    HotTrack = True
    TabHeight = 60
    TabOrder = 0
    TabWidth = 150
    OnChange = MainPCChange
    ExplicitHeight = 850
    object mFrontPage: TTabSheet
      Caption = 'The Bot'
      ExplicitHeight = 780
      object MiddlePanel: TPanel
        Left = 254
        Top = 0
        Width = 917
        Height = 848
        Align = alClient
        AutoSize = True
        TabOrder = 0
        ExplicitHeight = 780
        DesignSize = (
          917
          848)
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
          Top = 640
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
          ExplicitTop = 572
        end
        object Panel2: TPanel
          Left = 323
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
        inline MotorPositionFrame1: TMotorPositionFrame
          Left = 737
          Top = 750
          Width = 161
          Height = 81
          Anchors = [akRight, akBottom]
          AutoSize = True
          TabOrder = 3
          ExplicitTop = 682
          object MotorPositionGB: TGroupBox
            Left = 0
            Top = 0
            Width = 161
            Height = 81
            Caption = 'Motor Position'
            TabOrder = 0
            object mPosL: TLabel
              Left = 2
              Top = 25
              Width = 157
              Height = 54
              Align = alClient
              Alignment = taCenter
              Caption = 'N/A'
              Layout = tlCenter
              ExplicitTop = 15
              ExplicitWidth = 31
              ExplicitHeight = 23
            end
          end
          object PullPosTimer: TTimer
            Enabled = False
            Interval = 300
            Left = 26
            Top = 18
          end
        end
      end
      object LeftPanel: TPanel
        Left = 0
        Top = 0
        Width = 254
        Height = 848
        Align = alLeft
        TabOrder = 1
        ExplicitHeight = 780
        object CutterGB: TGroupBox
          Left = 1
          Top = 1
          Width = 252
          Height = 846
          Align = alClient
          Caption = 'Cutter'
          TabOrder = 0
          ExplicitHeight = 778
          object StartStopBtn: TArrayBotButton
            Left = 2
            Top = 433
            Width = 248
            Height = 411
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
            ExplicitHeight = 343
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
      ExplicitHeight = 780
      object Panel9: TPanel
        Left = 0
        Top = 0
        Width = 1171
        Height = 848
        Align = alClient
        TabOrder = 0
        ExplicitHeight = 780
        object RibbonRegistrationGB: TGroupBox
          Left = 1
          Top = 154
          Width = 1169
          Height = 239
          Align = alTop
          Caption = 'Ribbon  Registration'
          TabOrder = 0
          DesignSize = (
            1169
            239)
          object BarcodeLbl: TLabel
            AlignWithMargins = True
            Left = 597
            Top = 39
            Width = 85
            Height = 25
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            Caption = 'Barcode'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -21
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object RibbonIDLbl: TLabel
            AlignWithMargins = True
            Left = 630
            Top = 89
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            Caption = 'RibbonID'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clLime
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object Label7: TLabel
            Left = 189
            Top = 40
            Width = 82
            Height = 23
            Caption = 'Block ID: '
          end
          object DBText1: TDBText
            Left = 277
            Top = 40
            Width = 188
            Height = 33
            DataField = 'id'
          end
          object ClearBarcodeBtn: TArrayBotButton
            Left = 688
            Top = 30
            Width = 99
            Height = 41
            Anchors = [akTop, akRight]
            Caption = 'Clear'
            TabOrder = 1
            SoundID = 'BUTTON_CLICK_4'
          end
          object ClearRibbonIDBtn: TArrayBotButton
            Left = 688
            Top = 78
            Width = 99
            Height = 41
            Anchors = [akTop, akRight]
            Caption = 'Clear'
            TabOrder = 2
            SoundID = 'BUTTON_CLICK_4'
          end
          object RegisterRibbonBtn: TArrayBotButton
            Left = 24
            Top = 144
            Width = 247
            Height = 78
            Caption = 'Register Floating Ribbon'
            ParentDoubleBuffered = True
            TabOrder = 3
            OnClick = RegisterRibbonBtnClick
            SoundID = 'BUTTON_CLICK_4'
          end
          object DecodeSessionBtn: TArrayBotButton
            Left = 25
            Top = 37
            Width = 143
            Height = 85
            Caption = 'Scan Barcode'
            ParentDoubleBuffered = True
            TabOrder = 0
            OnClick = DecodeBarcodeClick
            SoundID = 'BUTTON_CLICK_4'
          end
        end
        object CuttingGB: TGroupBox
          Left = 1
          Top = 42
          Width = 1169
          Height = 112
          Align = alTop
          Caption = 'Feed'
          TabOrder = 1
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
          Top = 393
          Width = 1169
          Height = 454
          Align = alClient
          Caption = 'UC7 Operations'
          Constraints.MinHeight = 101
          TabOrder = 2
          ExplicitHeight = 386
          object GroupBox12: TGroupBox
            AlignWithMargins = True
            Left = 203
            Top = 28
            Width = 961
            Height = 421
            Margins.Left = 10
            Align = alClient
            Caption = 'Knife Stage'
            TabOrder = 0
            ExplicitHeight = 353
            DesignSize = (
              961
              421)
            object mMoveNorthBtn: TArrayBotButton
              Left = 299
              Top = 29
              Width = 160
              Height = 86
              Anchors = [akTop, akRight]
              Caption = 'Knife Forward'
              Enabled = False
              ParentDoubleBuffered = True
              TabOrder = 0
              SoundID = 'BUTTON_CLICK_4'
            end
            object mMoveSouthBtn: TArrayBotButton
              Left = 35
              Top = 29
              Width = 160
              Height = 86
              Anchors = [akTop, akRight]
              Caption = 'Knife Reverse'
              Enabled = False
              ParentDoubleBuffered = True
              TabOrder = 1
              SoundID = 'BUTTON_CLICK_4'
            end
            object GroupBox8: TGroupBox
              Left = 12
              Top = 132
              Width = 214
              Height = 225
              Caption = 'Return speeds (mm/s)'
              TabOrder = 2
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
                Top = 112
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
                Top = 176
                Width = 121
                Height = 31
                EditLabel.Width = 84
                EditLabel.Height = 23
                EditLabel.Caption = 'Ultra Slow'
                TabOrder = 2
                Text = '0.00'
              end
            end
            inline BackOffStepFrame: TUC7StagePositionFrame
              Left = 236
              Top = 260
              Width = 257
              Height = 81
              AutoSize = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              ExplicitLeft = 236
              ExplicitTop = 260
              inherited GroupBox1: TGroupBox
                Caption = 'Backoff Step'
                inherited Label1: TLabel
                  Top = 31
                  ExplicitTop = 31
                end
                inherited Label2: TLabel
                  Top = 31
                  ExplicitTop = 31
                end
                inherited Label3: TLabel
                  Top = 31
                  ExplicitTop = 31
                end
              end
            end
          end
          object GroupBox7: TPanel
            AlignWithMargins = True
            Left = 5
            Top = 28
            Width = 185
            Height = 421
            Align = alLeft
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 1
            ExplicitHeight = 353
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
        end
        object mTopPanel: TPanel
          Left = 1
          Top = 1
          Width = 1169
          Height = 41
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 3
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
    object RibbonsTS: TTabSheet
      Caption = 'Ribbons'
      ImageIndex = 8
      ExplicitHeight = 780
      object GroupBox14: TGroupBox
        Left = 0
        Top = 121
        Width = 1171
        Height = 308
        Align = alTop
        Caption = 'Ribbons'
        TabOrder = 0
        object RibbonsGrid: TDBGrid
          Left = 2
          Top = 25
          Width = 1167
          Height = 175
          Align = alClient
          DataSource = pgDM.ribbonsDSource
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -19
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'statusL'
              Width = 123
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cutting_order'
              Width = 104
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nr_of_sections'
              Width = 113
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'coverslip_id'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'created_on'
              Visible = True
            end>
        end
        object RibbonsNavigator: TDBNavigator
          Left = 2
          Top = 200
          Width = 1167
          Height = 65
          DataSource = pgDM.ribbonsDSource
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          Align = alBottom
          TabOrder = 1
        end
        object Panel5: TPanel
          Left = 2
          Top = 265
          Width = 1167
          Height = 41
          Align = alBottom
          TabOrder = 2
          object RibbonID: TDBText
            Left = 1
            Top = 1
            Width = 441
            Height = 39
            Align = alLeft
            DataField = 'id'
            DataSource = pgDM.ribbonsDSource
            ExplicitLeft = 56
            ExplicitTop = 6
            ExplicitHeight = 17
          end
        end
      end
      object Panel11: TPanel
        Left = 0
        Top = 0
        Width = 1171
        Height = 121
        Align = alTop
        TabOrder = 1
        object BlockSelectionGB: TGroupBox
          Left = 1
          Top = 1
          Width = 1169
          Height = 119
          Align = alClient
          Caption = 'DB/Block Selection'
          TabOrder = 0
          object Label1: TLabel
            Left = 293
            Top = 32
            Width = 68
            Height = 23
            Caption = 'Knife ID'
          end
          object Label3: TLabel
            Left = 141
            Top = 32
            Width = 69
            Height = 23
            Caption = 'Block ID'
          end
          object Label5: TLabel
            Left = 13
            Top = 32
            Width = 37
            Height = 23
            Caption = 'User'
          end
          object BlockIDCB: TDBLookupComboBox
            Left = 140
            Top = 57
            Width = 135
            Height = 31
            KeyField = 'id'
            ListField = 'id'
            ListSource = pgDM.allBlocksDataSource
            TabOrder = 0
          end
          object KnifeIDCB: TDBLookupComboBox
            Left = 292
            Top = 57
            Width = 135
            Height = 31
            KeyField = 'id'
            ListField = 'id'
            ListSource = pgDM.knifesDSource
            TabOrder = 1
          end
          object GroupBox5: TGroupBox
            Left = 518
            Top = 15
            Width = 225
            Height = 90
            Caption = 'Block Face'
            TabOrder = 2
            object BlockFaceHeight: TFloatLabeledEdit
              Left = 16
              Top = 56
              Width = 81
              Height = 31
              EditLabel.Width = 201
              EditLabel.Height = 23
              EditLabel.Caption = 'Block Face Height (mm)'
              TabOrder = 0
              Text = '1.0000'
              Value = 1.000000000000000000
            end
          end
          object mUsersCB: TDBLookupComboBox
            Left = 12
            Top = 57
            Width = 109
            Height = 31
            KeyField = 'id'
            ListField = 'user_name'
            ListSource = pgDM.usersDataSource
            TabOrder = 3
          end
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 429
        Width = 1171
        Height = 166
        Align = alTop
        Caption = 'Ribbon Notes'
        TabOrder = 2
        object Panel6: TPanel
          Left = 2
          Top = 25
          Width = 185
          Height = 139
          Align = alLeft
          TabOrder = 0
          object mRibbonNotesGrid: TDBGrid
            Left = 1
            Top = 1
            Width = 183
            Height = 112
            Align = alClient
            DataSource = pgDM.ribbonNotesDSource
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -19
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'created_on'
                Title.Caption = 'Date'
                Width = 143
                Visible = True
              end>
          end
          object mRibbonNotesNavigator: TDBNavigator
            Left = 1
            Top = 113
            Width = 183
            Height = 25
            DataSource = pgDM.ribbonNotesDSource
            VisibleButtons = [nbInsert, nbDelete, nbRefresh, nbApplyUpdates]
            Align = alBottom
            ConfirmDelete = False
            TabOrder = 1
          end
        end
        object Panel7: TPanel
          Left = 187
          Top = 25
          Width = 982
          Height = 139
          Align = alClient
          TabOrder = 1
          object mRibbonNoteMemo: TDBMemo
            Left = 1
            Top = 1
            Width = 980
            Height = 112
            Align = alClient
            DataField = 'note'
            DataSource = pgDM.ribbonNotesDSource
            TabOrder = 0
          end
          object mRibbonNoteNavigator: TDBNavigator
            Left = 1
            Top = 113
            Width = 980
            Height = 25
            DataSource = pgDM.ribbonNotesDSource
            VisibleButtons = [nbPost, nbCancel]
            Align = alBottom
            TabOrder = 1
          end
        end
      end
      inline TMoviesFrame1: TMoviesFrame
        Left = 0
        Top = 595
        Width = 1171
        Height = 253
        Align = alClient
        TabOrder = 3
        ExplicitTop = 595
        ExplicitWidth = 1171
        ExplicitHeight = 185
        inherited Panel22: TPanel
          Top = 198
          Width = 1171
          ExplicitTop = 130
          ExplicitWidth = 1171
          inherited Label4: TLabel
            Width = 170
            Height = 23
            ExplicitWidth = 170
            ExplicitHeight = 23
          end
        end
        inherited ScrollBox2: TScrollBox
          Width = 1171
          Height = 198
          ExplicitWidth = 1171
          ExplicitHeight = 130
          inherited FlowPanel1: TFlowPanel
            Width = 1150
            ExplicitWidth = 1150
          end
        end
        inherited GetMoviesQuery: TSQLQuery
          Left = 445
        end
      end
    end
    object mMoveSequencesPage: TTabSheet
      Caption = 'Sequences'
      ImageIndex = 4
      ExplicitHeight = 780
    end
    object TabSheet1: TTabSheet
      Caption = 'Motors'
      ExplicitHeight = 780
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 0
        Width = 1066
        Height = 848
        HorzScrollBar.Smooth = True
        VertScrollBar.Tracking = True
        Align = alClient
        BorderStyle = bsNone
        Padding.Left = 5
        Padding.Top = 5
        Padding.Right = 5
        Padding.Bottom = 5
        TabOrder = 0
        ExplicitHeight = 780
      end
      object Panel1: TPanel
        Left = 1066
        Top = 0
        Width = 105
        Height = 848
        Align = alRight
        TabOrder = 1
        ExplicitHeight = 780
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
      ExplicitHeight = 780
    end
    object TabSheet5: TTabSheet
      Caption = 'Logging'
      ImageIndex = 4
      ExplicitHeight = 780
      object BottomPanel: TPanel
        Left = 0
        Top = 0
        Width = 1171
        Height = 848
        Align = alClient
        TabOrder = 0
        ExplicitHeight = 780
        object infoMemo: TMemo
          Left = 1
          Top = 31
          Width = 1169
          Height = 816
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
          ExplicitHeight = 748
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
    object SettingsTab: TTabSheet
      Caption = 'Settings'
      ImageIndex = 8
      ExplicitHeight = 780
      object MiscPageControl: TPageControl
        Left = 0
        Top = 0
        Width = 1171
        Height = 848
        ActivePage = UC7Tab
        Align = alClient
        TabOrder = 0
        ExplicitHeight = 780
        object TabSheet8: TTabSheet
          Caption = 'Sounds'
          ImageIndex = 1
          ExplicitHeight = 742
          inline TSoundsFrame1: TSoundsFrame
            Left = 0
            Top = 241
            Width = 1163
            Height = 569
            Align = alClient
            AutoSize = True
            TabOrder = 0
            ExplicitTop = 241
            ExplicitWidth = 1163
            ExplicitHeight = 501
            inherited GroupBox1: TGroupBox
              Width = 1163
              Height = 569
              Align = alClient
              ExplicitWidth = 1163
              ExplicitHeight = 501
              inherited SoundsLB: TListBox
                Top = 25
                Width = 215
                Height = 542
                ItemHeight = 23
                ExplicitTop = 25
                ExplicitWidth = 215
                ExplicitHeight = 474
              end
            end
          end
          inline TApplicationSoundsFrame1: TApplicationSoundsFrame
            Left = 0
            Top = 0
            Width = 1163
            Height = 241
            Align = alTop
            AutoSize = True
            TabOrder = 1
            ExplicitWidth = 1163
            inherited GBS: TGroupBox
              Width = 1163
              ExplicitWidth = 1163
              inherited ApplicationSoundsLB: TListBox
                Top = 25
                Height = 214
                ItemHeight = 23
                ExplicitTop = 25
                ExplicitHeight = 214
              end
              inherited SoundPropsGB: TGroupBox
                Top = 25
                Width = 912
                Height = 214
                ExplicitTop = 25
                ExplicitWidth = 912
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
          ExplicitHeight = 742
          object GroupBox6: TGroupBox
            Left = 0
            Top = 0
            Width = 1163
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
          ExplicitHeight = 742
          inline TPGConnectionFrame1: TPGConnectionFrame
            Left = 0
            Top = 0
            Width = 1163
            Height = 201
            Align = alTop
            AutoSize = True
            TabOrder = 0
            ExplicitWidth = 1163
            inherited GBox1: TGroupBox
              Width = 1163
              Align = alClient
              ExplicitWidth = 1163
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
        object TabSheet9: TTabSheet
          Caption = 'Barcode Reader'
          ImageIndex = 6
          ExplicitHeight = 742
          object BarCodeGB: TGroupBox
            Left = 0
            Top = 0
            Width = 1163
            Height = 209
            Align = alTop
            Caption = 'Zebra'
            TabOrder = 0
            object Panel4: TPanel
              Left = 2
              Top = 25
              Width = 1159
              Height = 28
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object mZebraCOMPortCB: TComboBox
                Left = 0
                Top = 0
                Width = 87
                Height = 31
                Margins.Left = 10
                Align = alLeft
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
              object mConnectZebraBtn: TButton
                Left = 163
                Top = 0
                Width = 77
                Height = 28
                Align = alLeft
                Caption = 'Open'
                TabOrder = 1
                OnClick = mConnectZebraBtnClick
              end
              object mZebraBaudRateCB: TComboBox
                Left = 87
                Top = 0
                Width = 76
                Height = 31
                Margins.Left = 10
                Align = alLeft
                ItemIndex = 0
                TabOrder = 2
                Text = '9600'
                Items.Strings = (
                  '9600'
                  '14400'
                  '19200'
                  '38400'
                  '57600'
                  '115200'
                  '128000'
                  '256000')
              end
            end
            object mImagerSettingsGB: TGroupBox
              Left = 13
              Top = 76
              Width = 518
              Height = 107
              Caption = 'Check'
              TabOrder = 1
              object mScannerAimRG: TRadioGroup
                Left = 179
                Top = 22
                Width = 145
                Height = 49
                Caption = 'Aim'
                Columns = 2
                ItemIndex = 1
                Items.Strings = (
                  'On'
                  'Off')
                TabOrder = 0
                OnClick = scannerSettingsClick
              end
              object mScannerEnabledRG: TRadioGroup
                Left = 9
                Top = 23
                Width = 145
                Height = 49
                Caption = 'Enabled'
                Columns = 2
                ItemIndex = 0
                Items.Strings = (
                  'On'
                  'Off')
                TabOrder = 1
                OnClick = scannerSettingsClick
              end
              object mBeepBtn: TButton
                Left = 342
                Top = 31
                Width = 89
                Height = 37
                Caption = 'Beep'
                TabOrder = 2
              end
            end
          end
        end
        object UC7Tab: TTabSheet
          Caption = 'UC7'
          ImageIndex = 7
          ExplicitHeight = 742
          object UC7GB: TGroupBox
            Left = 0
            Top = 0
            Width = 1163
            Height = 810
            Align = alClient
            Caption = 'UC7'
            TabOrder = 0
            ExplicitHeight = 742
            object GroupBox4: TGroupBox
              Left = 2
              Top = 25
              Width = 1159
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
              Width = 1159
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
              Width = 1159
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
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'About'
      ImageIndex = 6
      ExplicitHeight = 780
      inline TAboutArrayBotFrame_21: TAboutArrayBotFrame_2
        Left = 0
        Top = 0
        Width = 1171
        Height = 494
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 1171
        ExplicitHeight = 426
        inherited GroupBox1: TGroupBox
          Width = 1171
          Height = 308
          ExplicitWidth = 1171
          ExplicitHeight = 240
          inherited Memo1: TMemo
            Top = 25
            Width = 1167
            Height = 281
            ExplicitTop = 25
            ExplicitWidth = 1167
            ExplicitHeight = 213
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
        Top = 494
        Width = 1171
        Height = 354
        Align = alBottom
        TabOrder = 1
        ExplicitTop = 426
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
        end
      end
    end
  end
  object ControlBar1: TControlBar
    Left = 0
    Top = 0
    Width = 1179
    Height = 82
    Align = alTop
    AutoDock = False
    CornerEdge = ceLarge
    DockSite = False
    DrawingStyle = dsGradient
    TabOrder = 1
    object CounterGB: TGroupBox
      Left = 11
      Top = 2
      Width = 942
      Height = 74
      Align = alTop
      TabOrder = 0
      object SectionCounterLabel: TIntLabel
        Left = 19
        Top = 16
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
        Left = 261
        Top = 27
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
        Left = 239
        Top = 7
        Width = 113
        Height = 23
        Caption = 'Ribbon Order'
      end
      object RibbonLengthLbl: TFloatLabel
        Left = 448
        Top = 39
        Width = 38
        Height = 19
        Caption = '-1.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ValueString = '-1.00'
        Value = -1.000000000000000000
        TheFont.Charset = DEFAULT_CHARSET
        TheFont.Color = clWindowText
        TheFont.Height = -16
        TheFont.Name = 'Tahoma'
        TheFont.Style = []
      end
      object Label19: TLabel
        Left = 448
        Top = 14
        Width = 175
        Height = 23
        Caption = 'Ribbon Length (mm)'
      end
      object DBText7: TDBText
        Left = 743
        Top = 34
        Width = 73
        Height = 20
        DataField = 'id'
        DataSource = pgDM.allBlocksDataSource
      end
      object Label11: TLabel
        Left = 660
        Top = 34
        Width = 76
        Height = 23
        Caption = 'Block ID:'
      end
      object mCountToE: TIntegerLabeledEdit
        Left = 142
        Top = 31
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
        Left = 61
        Top = 16
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
        Left = 358
        Top = 16
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
  end
  object CutterStatusPanel: TPanel
    Left = 0
    Top = 82
    Width = 1179
    Height = 41
    Align = alTop
    TabOrder = 2
    object UC7Shape: TShape
      Left = 432
      Top = 29
      Width = 93
      Height = 6
      Brush.Color = clLime
    end
    object Label4: TLabel
      Left = 32
      Top = 6
      Width = 120
      Height = 23
      Caption = 'Before Cutting'
    end
    object Label16: TLabel
      Left = 264
      Top = 6
      Width = 60
      Height = 23
      Caption = 'Cutting'
    end
    object Label17: TLabel
      Left = 432
      Top = 6
      Width = 106
      Height = 23
      Caption = 'After Cutting'
    end
    object Label18: TLabel
      Left = 624
      Top = 6
      Width = 86
      Height = 23
      Caption = 'Retracting'
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
