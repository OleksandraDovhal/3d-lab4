object Form2: TForm2
  Left = 263
  Top = 367
  Width = 736
  Height = 550
  Caption = 'Form2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 512
    Height = 512
  end
  object EditX: TEdit
    Left = 536
    Top = 16
    Width = 65
    Height = 21
    TabOrder = 0
    Text = '100'
  end
  object EditY: TEdit
    Left = 624
    Top = 16
    Width = 65
    Height = 21
    TabOrder = 1
    Text = '100'
  end
  object Button1: TButton
    Left = 536
    Top = 48
    Width = 153
    Height = 57
    Caption = 'Button1'
    TabOrder = 2
    OnClick = Button1Click
  end
  object EditAlpha: TEdit
    Left = 536
    Top = 112
    Width = 33
    Height = 21
    TabOrder = 3
    Text = '0'
  end
end
