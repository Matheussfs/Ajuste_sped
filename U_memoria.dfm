object Frm_memoria: TFrm_memoria
  Left = 0
  Top = 0
  Caption = 'Frm_memoria'
  ClientHeight = 380
  ClientWidth = 702
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 19
  object Lb_memoria: TLabel
    Left = 240
    Top = 8
    Width = 168
    Height = 19
    Caption = 'Mem'#243'ria de c'#225'lculo: '
  end
  object Memoriacalc: TLabel
    Left = 240
    Top = 48
    Width = 134
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = MemoriacalcClick
  end
end
