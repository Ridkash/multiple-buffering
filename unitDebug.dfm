object debug: Tdebug
  Left = 0
  Top = 0
  Caption = 'debug'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object memo: TMemo
    Left = 0
    Top = 0
    Width = 635
    Height = 299
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    PopupMenu = PopupMenuDebug
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object PopupMenuDebug: TPopupMenu
    Left = 16
    Top = 16
    object N1: TMenuItem
      Caption = #1054#1090#1095#1080#1089#1090#1080#1090#1100
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074#1089#1077' '
      OnClick = N2Click
    end
  end
end
