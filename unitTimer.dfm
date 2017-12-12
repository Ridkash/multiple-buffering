object fTimer: TfTimer
  Left = 0
  Top = 0
  VertScrollBar.ParentColor = False
  BorderStyle = bsToolWindow
  Caption = #1058#1072#1081#1084#1077#1088
  ClientHeight = 115
  ClientWidth = 137
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LabelTime: TLabel
    Left = 8
    Top = 0
    Width = 126
    Height = 65
    Caption = '00:00'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -56
    Font.Name = 'Book Antiqua'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object LabelCount: TLabel
    Left = 48
    Top = 64
    Width = 20
    Height = 49
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -40
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object ButtonL: TButton
    Left = 8
    Top = 64
    Width = 34
    Height = 41
    Cursor = crHandPoint
    Caption = '<'
    TabOrder = 0
    OnClick = ButtonLClick
  end
  object ButtonR: TButton
    Left = 98
    Top = 64
    Width = 34
    Height = 41
    Cursor = crHandPoint
    Caption = '>'
    TabOrder = 1
    OnClick = ButtonRClick
  end
  object sTimer: TTimer
    Enabled = False
    OnTimer = sTimerTimer
    Left = 400
    Top = 96
  end
  object MainMenu1: TMainMenu
    BiDiMode = bdRightToLeft
    ParentBiDiMode = False
    Left = 376
    Top = 24
  end
end
