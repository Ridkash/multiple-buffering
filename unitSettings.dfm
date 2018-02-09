object settings: Tsettings
  Left = 0
  Top = 0
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 229
  ClientWidth = 673
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonCancel: TButton
    Left = 582
    Top = 176
    Width = 75
    Height = 25
    Caption = #1086#1090#1084#1077#1085#1072
    TabOrder = 0
    OnClick = ButtonCancelClick
  end
  object ButtonSave: TButton
    Left = 481
    Top = 176
    Width = 75
    Height = 25
    Caption = #1089#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 1
    OnClick = ButtonSaveClick
  end
  object gTimer: TGroupBox
    Left = 407
    Top = 8
    Width = 250
    Height = 126
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1090#1072#1081#1084#1077#1088#1072
    TabOrder = 2
    object Label1: TLabel
      Left = 4
      Top = 23
      Width = 120
      Height = 13
      Caption = #1041#1091#1076#1091' '#1088#1072#1073#1086#1090#1072#1090#1100' ('#1095#1072#1089#1086#1074'):'
    end
    object timerAllClose: TEdit
      Left = 180
      Top = 46
      Width = 38
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
      Left = 180
      Top = 69
      Width = 38
      Height = 21
      Enabled = False
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
      Left = 180
      Top = 92
      Width = 38
      Height = 21
      TabOrder = 5
      Text = '3'
    end
    object timerAllHours: TEdit
      Left = 180
      Top = 19
      Width = 38
      Height = 21
      TabOrder = 6
      Text = '12'
    end
  end
  object mainSettings: TGroupBox
    Left = 8
    Top = 8
    Width = 385
    Height = 145
    Caption = #1054#1073#1097#1080#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
    TabOrder = 3
    object LabelBuferG: TLabel
      Left = 3
      Top = 53
      Width = 172
      Height = 13
      Caption = #1055#1086' '#1085#1072#1078#1072#1090#1080#1102' CTRL + G '#1074#1089#1090#1072#1074#1083#1103#1077#1090':'
    end
    object LabelNumberMaxPage: TLabel
      Left = 3
      Top = 24
      Width = 179
      Height = 13
      Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1086#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1088#1072#1085#1080#1094
    end
    object LabelBuferL: TLabel
      Left = 3
      Top = 73
      Width = 171
      Height = 13
      Caption = #1055#1086' '#1085#1072#1078#1072#1090#1080#1102' CTRL + K '#1074#1089#1090#1072#1074#1083#1103#1077#1090':'
    end
    object LabelBuferP: TLabel
      Left = 3
      Top = 93
      Width = 171
      Height = 13
      Caption = #1055#1086' '#1085#1072#1078#1072#1090#1080#1102' CTRL + P '#1074#1089#1090#1072#1074#1083#1103#1077#1090':'
    end
    object LabelBuferM: TLabel
      Left = 3
      Top = 113
      Width = 173
      Height = 13
      Caption = #1055#1086' '#1085#1072#1078#1072#1090#1080#1102' CTRL + M '#1074#1089#1090#1072#1074#1083#1103#1077#1090':'
    end
    object EditBuferG: TEdit
      Left = 181
      Top = 50
      Width = 188
      Height = 21
      TabOrder = 0
      Text = #1058#1091#1090' '#1089#1086#1076#1077#1088#1078#1080#1090#1089#1103' '#1074#1089#1077#1075#1076#1072' '#1086#1076#1080#1085' '#1073#1091#1092#1077#1088
    end
    object EditNumberMaxPage: TEdit
      Left = 216
      Top = 16
      Width = 43
      Height = 21
      TabOrder = 1
      Text = '99'
    end
    object bashCheack: TCheckBox
      Left = 0
      Top = 264
      Width = 206
      Height = 17
      BiDiMode = bdRightToLeft
      Caption = #1057#1082#1088#1099#1074#1072#1090#1100' '#1082#1086#1084#1072#1085#1076#1099' '#1086#1090' BASH - history                            '
      ParentBiDiMode = False
      TabOrder = 2
      Visible = False
    end
    object EditBuferL: TEdit
      Left = 181
      Top = 70
      Width = 188
      Height = 21
      TabOrder = 3
      Text = #1058#1091#1090' '#1089#1086#1076#1077#1088#1078#1080#1090#1089#1103' '#1074#1089#1077#1075#1076#1072' '#1086#1076#1080#1085' '#1073#1091#1092#1077#1088
    end
    object EditBuferP: TEdit
      Left = 181
      Top = 90
      Width = 188
      Height = 21
      TabOrder = 4
      Text = #1058#1091#1090' '#1089#1086#1076#1077#1088#1078#1080#1090#1089#1103' '#1074#1089#1077#1075#1076#1072' '#1086#1076#1080#1085' '#1073#1091#1092#1077#1088
    end
    object EditBuferM: TEdit
      Left = 181
      Top = 110
      Width = 188
      Height = 21
      TabOrder = 5
      Text = #1058#1091#1090' '#1089#1086#1076#1077#1088#1078#1080#1090#1089#1103' '#1074#1089#1077#1075#1076#1072' '#1086#1076#1080#1085' '#1073#1091#1092#1077#1088
    end
  end
end
