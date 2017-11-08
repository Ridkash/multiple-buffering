object settings: Tsettings
  Left = 0
  Top = 0
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 110
  ClientWidth = 361
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
  object LabelNumberMaxPage: TLabel
    Left = 8
    Top = 8
    Width = 179
    Height = 13
    Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1086#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1088#1072#1085#1080#1094
  end
  object LabelBuferG: TLabel
    Left = 8
    Top = 43
    Width = 172
    Height = 13
    Caption = #1055#1086' '#1085#1072#1078#1072#1090#1080#1102' CTRL + G '#1074#1089#1090#1072#1074#1083#1103#1077#1090':'
  end
  object ButtonCancel: TButton
    Left = 89
    Top = 72
    Width = 75
    Height = 25
    Caption = #1086#1090#1084#1077#1085#1072
    TabOrder = 0
    OnClick = ButtonCancelClick
  end
  object ButtonSave: TButton
    Left = 8
    Top = 72
    Width = 75
    Height = 25
    Caption = #1089#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 1
    OnClick = ButtonSaveClick
  end
  object EditNumberMaxPage: TEdit
    Left = 214
    Top = 8
    Width = 43
    Height = 21
    TabOrder = 2
    Text = '99'
  end
  object EditBuferG: TEdit
    Left = 214
    Top = 35
    Width = 99
    Height = 21
    TabOrder = 3
    Text = '0'
  end
end
