object buffer: Tbuffer
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'buffer'
  ClientHeight = 70
  ClientWidth = 309
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  Position = poDesigned
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object tablo: TLabel
    Left = 0
    Top = 0
    Width = 309
    Height = 51
    Align = alClient
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ExplicitWidth = 4
    ExplicitHeight = 14
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 51
    Width = 309
    Height = 19
    Panels = <
      item
        Width = 80
      end
      item
        Width = 50
      end>
  end
  object ok: TButton
    Left = 256
    Top = 24
    Width = 53
    Height = 27
    Cursor = crHandPoint
    Caption = #1087#1086#1085#1103#1090#1085#1086'!'
    TabOrder = 1
    Visible = False
    OnClick = okClick
  end
end
