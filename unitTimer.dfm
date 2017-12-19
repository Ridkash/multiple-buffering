object fTimer: TfTimer
  Left = 0
  Top = 0
  VertScrollBar.ParentColor = False
  BorderStyle = bsToolWindow
  Caption = #1058#1072#1081#1084#1080#1085#1075
  ClientHeight = 136
  ClientWidth = 141
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  Menu = MainMenu1
  OldCreateOrder = True
  Visible = True
  WindowMenu = timerStartButton
  PixelsPerInch = 96
  TextHeight = 13
  object timerH: TLabel
    Left = 8
    Top = 0
    Width = 56
    Height = 69
    Caption = '00'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -56
    Font.Name = 'Book Antiqua'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object timerCount: TLabel
    Left = 48
    Top = 66
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
  object Label1: TLabel
    Left = 8
    Top = 113
    Width = 71
    Height = 13
    Caption = #1059#1078#1077' '#1079#1072#1082#1088#1099#1090#1086':'
  end
  object timerAllClose: TLabel
    Left = 100
    Top = 113
    Width = 6
    Height = 13
    Caption = '0'
  end
  object timerM: TLabel
    Left = 81
    Top = 0
    Width = 56
    Height = 69
    Caption = '00'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -56
    Font.Name = 'Book Antiqua'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object timerBetwin: TLabel
    Left = 65
    Top = -7
    Width = 14
    Height = 69
    Caption = ':'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -56
    Font.Name = 'Book Antiqua'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object ButtonL: TButton
    Left = 8
    Top = 66
    Width = 34
    Height = 41
    Cursor = crHandPoint
    Caption = '<'
    TabOrder = 0
    OnClick = ButtonLClick
  end
  object ButtonR: TButton
    Left = 100
    Top = 66
    Width = 34
    Height = 41
    Cursor = crHandPoint
    Caption = '>'
    TabOrder = 1
    OnClick = ButtonRClick
  end
  object sTimer: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = sTimerTimer
    Left = 240
    Top = 96
  end
  object MainMenu1: TMainMenu
    Left = 240
    Top = 16
    object timerStopButton: TMenuItem
      Caption = #1057#1058#1054#1055
      OnClick = timerStopButtonClick
    end
    object timerStartButton: TMenuItem
      Caption = #1057#1058#1040#1056#1058
      OnClick = timerStartButtonClick
    end
  end
end
