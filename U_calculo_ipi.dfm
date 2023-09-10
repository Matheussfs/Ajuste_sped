object FRM_CALCULO_IPI: TFRM_CALCULO_IPI
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'FRM_CALCULO_IPI'
  ClientHeight = 157
  ClientWidth = 374
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 72
    Top = 48
    Width = 104
    Height = 21
    TabOrder = 0
    TextHint = 'Base IPI'
  end
  object Edit2: TEdit
    Left = 224
    Top = 48
    Width = 58
    Height = 21
    TabOrder = 1
    TextHint = '% IPI'
  end
  object StaticText1: TStaticText
    Left = 72
    Top = 22
    Width = 104
    Height = 20
    Caption = 'Base de C'#225'lculo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object StaticText2: TStaticText
    Left = 224
    Top = 22
    Width = 58
    Height = 20
    Caption = 'Al'#237'quota'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object Btn_calc_ipi: TButton
    Left = 104
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Calcular'
    TabOrder = 4
  end
  object Btn_clear_ipi: TButton
    Left = 185
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Limpar'
    TabOrder = 5
  end
end
