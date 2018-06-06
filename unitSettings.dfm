object settings: Tsettings
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 354
  ClientWidth = 736
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Height = 332
    ExplicitLeft = 186
    ExplicitTop = 29
    ExplicitHeight = 339
  end
  object ButtonCancel: TButton
    Left = 585
    Top = 284
    Width = 75
    Height = 25
    Caption = #1086#1090#1084#1077#1085#1072
    TabOrder = 0
    OnClick = ButtonCancelClick
  end
  object ButtonSave: TButton
    Left = 489
    Top = 284
    Width = 75
    Height = 25
    Caption = #1089#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 1
    OnClick = ButtonSaveClick
  end
  object gNotice: TGroupBox
    Left = 338
    Top = 0
    Width = 385
    Height = 114
    Caption = ' '#1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1072#1087#1086#1084#1080#1085#1072#1085#1080#1077
    TabOrder = 2
    object noticeNumberCurrent: TLabel
      Left = 2
      Top = 50
      Width = 22
      Height = 25
      Caption = '12'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object noticeNumberZnak: TLabel
      Left = 30
      Top = 49
      Width = 8
      Height = 25
      Caption = '/'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object noticeNumberAll: TLabel
      Left = 44
      Top = 50
      Width = 22
      Height = 25
      Caption = '12'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object noticeNumberPrevious: TButton
      Left = 74
      Top = 50
      Width = 25
      Height = 23
      Cursor = crHandPoint
      Caption = '<'
      TabOrder = 0
      OnClick = noticeNumberPreviousClick
    end
    object noticeNumberFollowing: TButton
      Left = 98
      Top = 50
      Width = 25
      Height = 23
      Cursor = crHandPoint
      Caption = '>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = noticeNumberFollowingClick
    end
    object noticeChange: TButton
      Left = 258
      Top = 50
      Width = 64
      Height = 25
      Cursor = crHandPoint
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 2
      OnClick = noticeChangeClick
    end
    object noticeBody: TEdit
      Left = 201
      Top = 23
      Width = 121
      Height = 21
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      AutoSize = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 3
      Text = #1058#1077#1083#1086
    end
    object noticeTime: TEdit
      Left = 11
      Top = 23
      Width = 57
      Height = 21
      AutoSize = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 4
      Text = #1042#1088#1077#1084#1103
    end
    object noticeTitle: TEdit
      Left = 74
      Top = 23
      Width = 121
      Height = 21
      AutoSize = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 5
      Text = #1064#1072#1087#1082#1072
    end
    object noticeAdd: TButton
      Left = 328
      Top = 24
      Width = 25
      Height = 20
      Cursor = crHandPoint
      Caption = '+'
      TabOrder = 6
      OnClick = noticeAddClick
    end
    object noticeDelete: TButton
      Left = 357
      Top = 24
      Width = 25
      Height = 20
      Cursor = crHandPoint
      Caption = '-'
      TabOrder = 7
      OnClick = noticeDeleteClick
    end
    object timerIsActive: TButton
      Left = 258
      Top = 81
      Width = 64
      Height = 25
      Caption = 'TIMER'
      TabOrder = 8
      OnClick = timerIsActiveClick
    end
  end
  object bashCheack: TCheckBox
    Left = 845
    Top = 26
    Width = 206
    Height = 17
    BiDiMode = bdRightToLeft
    Caption = #1057#1082#1088#1099#1074#1072#1090#1100' '#1082#1086#1084#1072#1085#1076#1099' '#1086#1090' BASH - history                            '
    ParentBiDiMode = False
    TabOrder = 3
    Visible = False
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 332
    Width = 736
    Height = 22
    Panels = <>
  end
  object hotKeyGroup: TGroupBox
    Left = 9
    Top = 166
    Width = 288
    Height = 147
    Caption = #1043#1086#1088#1103#1095#1080#1077' '#1082#1085#1086#1087#1082#1080':'
    TabOrder = 5
    object hotKeyCaption: TLabel
      Left = 13
      Top = 23
      Width = 98
      Height = 13
      Caption = #1055#1086' '#1085#1072#1078#1072#1090#1080#1102' '#1085#1072' * +'
    end
    object hotKeyCurient: TLabel
      Left = 38
      Top = 118
      Width = 22
      Height = 25
      Caption = '11'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object hotkeyAllNum: TLabel
      Left = 78
      Top = 118
      Width = 22
      Height = 25
      BiDiMode = bdRightToLeft
      Caption = '10'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
    end
    object Label2: TLabel
      Left = 66
      Top = 118
      Width = 8
      Height = 25
      Caption = '/'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object hotkeyMemo: TMemo
      Left = 13
      Top = 56
      Width = 252
      Height = 56
      TabOrder = 0
    end
    object HotKey1: THotKey
      Left = 117
      Top = 23
      Width = 41
      Height = 19
      HotKey = 0
      InvalidKeys = [hcShift, hcCtrl, hcAlt, hcShiftCtrl, hcShiftAlt, hcCtrlAlt, hcShiftCtrlAlt]
      Modifiers = []
      TabOrder = 1
      OnChange = HotKey1Change
    end
    object addHotkeyButton: TButton
      Left = 133
      Top = 118
      Width = 67
      Height = 25
      Cursor = crHandPoint
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 2
      OnClick = addHotkeyButtonClick
    end
    object Button1: TButton
      Left = 13
      Top = 118
      Width = 25
      Height = 25
      Cursor = crHandPoint
      Caption = '<'
      TabOrder = 3
      Visible = False
    end
    object Button2: TButton
      Left = 106
      Top = 118
      Width = 21
      Height = 25
      Cursor = crHandPoint
      Caption = '>'
      TabOrder = 4
      Visible = False
    end
    object Button3: TButton
      Left = 206
      Top = 118
      Width = 59
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1090#1100
      TabOrder = 5
      Visible = False
    end
    object Button4: TButton
      Left = 204
      Top = 25
      Width = 61
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 6
      Visible = False
    end
  end
  object gTimer: TGroupBox
    Left = 11
    Top = 0
    Width = 323
    Height = 160
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1090#1072#1081#1084#1077#1088#1072
    TabOrder = 6
    object Label1: TLabel
      Left = 4
      Top = 23
      Width = 120
      Height = 13
      Caption = #1041#1091#1076#1091' '#1088#1072#1073#1086#1090#1072#1090#1100' ('#1095#1072#1089#1086#1074'):'
    end
    object LabelNumberMaxPage: TLabel
      Left = 1
      Top = 132
      Width = 179
      Height = 13
      Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1086#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1088#1072#1085#1080#1094
    end
    object timerAllClose: TEdit
      Left = 202
      Top = 46
      Width = 30
      Height = 21
      TabOrder = 0
      Text = '20'
    end
    object timerLabelClose: TLinkLabel
      Left = 3
      Top = 46
      Width = 122
      Height = 17
      Caption = #1080' '#1079#1072' '#1101#1090#1086' '#1074#1088#1077#1084#1103' '#1079#1072#1082#1088#1086#1102':'
      TabOrder = 1
    end
    object TimerCorrectionLabel: TLinkLabel
      Left = 4
      Top = 69
      Width = 55
      Height = 17
      Caption = #1044#1077#1083#1080#1084' '#1085#1072':'
      TabOrder = 2
    end
    object timerCorrectionDay: TEdit
      Left = 202
      Top = 70
      Width = 30
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 3
      Text = '4'
    end
    object LinkLabel1: TLinkLabel
      Left = 4
      Top = 92
      Width = 176
      Height = 17
      Caption = #1042#1088#1077#1084#1103' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103' '#1090#1072#1081#1084#1077#1088#1072' ('#1089#1077#1082'*)'
      TabOrder = 4
    end
    object timerUpdate: TEdit
      Left = 202
      Top = 97
      Width = 30
      Height = 21
      TabOrder = 5
      Text = '3'
    end
    object timerAllHours: TEdit
      Left = 202
      Top = 19
      Width = 30
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 6
      Text = '12'
    end
    object EditNumberMaxPage: TEdit
      Left = 202
      Top = 124
      Width = 30
      Height = 21
      TabOrder = 7
      Text = '99'
    end
  end
  object noticeTimer: TTimer
    Enabled = False
    Interval = 8000
    OnTimer = noticeTimerTimer
    Left = 352
    Top = 127
  end
end
