object Form3: TForm3
  Left = 347
  Top = 287
  Width = 736
  Height = 550
  Caption = 'Form3'
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
    Left = 528
    Top = 8
    Width = 49
    Height = 21
    TabOrder = 0
    Text = '200'
  end
  object EditY: TEdit
    Left = 592
    Top = 8
    Width = 49
    Height = 21
    TabOrder = 1
    Text = '200'
  end
  object EditZ: TEdit
    Left = 656
    Top = 8
    Width = 49
    Height = 21
    TabOrder = 2
    Text = '100'
  end
  object EditEdge: TEdit
    Left = 528
    Top = 40
    Width = 49
    Height = 21
    TabOrder = 3
    Text = '200'
  end
  object Button1: TButton
    Left = 528
    Top = 152
    Width = 177
    Height = 57
    Caption = 'Draw'
    TabOrder = 4
    OnClick = Button1Click
  end
  object EditAlpha: TEdit
    Left = 528
    Top = 96
    Width = 49
    Height = 21
    TabOrder = 5
    Text = '0'
  end
  object EditBeta: TEdit
    Left = 592
    Top = 96
    Width = 49
    Height = 21
    TabOrder = 6
    Text = '0'
  end
  object EditGamma: TEdit
    Left = 656
    Top = 96
    Width = 49
    Height = 21
    TabOrder = 7
    Text = '0'
  end
  object ButtonAlphaPlus: TButton
    Left = 528
    Top = 72
    Width = 49
    Height = 17
    Caption = '+'
    TabOrder = 8
    OnClick = ButtonAlphaPlusClick
  end
  object ButtonAlphaMinus: TButton
    Left = 528
    Top = 120
    Width = 49
    Height = 17
    Caption = '-'
    TabOrder = 9
    OnClick = ButtonAlphaMinusClick
  end
  object ButtonBetaPlus: TButton
    Left = 592
    Top = 72
    Width = 49
    Height = 17
    Caption = '+'
    TabOrder = 10
    OnClick = ButtonBetaPlusClick
  end
  object ButtonBetaMinus: TButton
    Left = 592
    Top = 120
    Width = 49
    Height = 17
    Caption = '-'
    TabOrder = 11
    OnClick = ButtonBetaMinusClick
  end
  object ButtonGammaPlus: TButton
    Left = 656
    Top = 72
    Width = 49
    Height = 17
    Caption = '+'
    TabOrder = 12
    OnClick = ButtonGammaPlusClick
  end
  object ButtonGammaMinus: TButton
    Left = 656
    Top = 120
    Width = 49
    Height = 17
    Caption = '-'
    TabOrder = 13
    OnClick = ButtonGammaMinusClick
  end
  object cbb1: TComboBox
    Left = 528
    Top = 224
    Width = 177
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 14
    Text = #1055#1080#1088#1072#1084#1080#1076#1072
    Items.Strings = (
      #1055#1080#1088#1072#1084#1080#1076#1072
      #1050#1091#1073)
  end
end
