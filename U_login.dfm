object Frm_login: TFrm_login
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  ClientHeight = 176
  ClientWidth = 263
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 15
  object pnl_titulo: TPanel
    Left = 0
    Top = 0
    Width = 263
    Height = 25
    Align = alTop
    Caption = 'Senha suporte:'
    TabOrder = 0
    ExplicitWidth = 259
  end
  object Pnl_centro: TPanel
    Left = 0
    Top = 24
    Width = 265
    Height = 153
    TabOrder = 1
    object Label1: TLabel
      Left = 112
      Top = 15
      Width = 33
      Height = 15
      Caption = 'Login:'
    end
    object Label2: TLabel
      Left = 112
      Top = 60
      Width = 35
      Height = 15
      Caption = 'Senha:'
    end
    object Edt_login: TEdit
      Left = 72
      Top = 31
      Width = 121
      Height = 23
      ImeName = 'Portuguese (Brazilian ABNT)'
      TabOrder = 0
    end
    object edt_senha: TEdit
      Left = 72
      Top = 76
      Width = 121
      Height = 23
      ImeName = 'Portuguese (Brazilian ABNT)'
      PasswordChar = '*'
      TabOrder = 1
    end
    object btn_entrar: TBitBtn
      Left = 96
      Top = 105
      Width = 75
      Height = 25
      Caption = 'Entrar:'
      TabOrder = 2
      OnClick = btn_entrarClick
    end
  end
end
