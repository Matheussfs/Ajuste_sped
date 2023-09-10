object Frm_pesquisa_empresa: TFrm_pesquisa_empresa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Pesquisa de Empresas'
  ClientHeight = 323
  ClientWidth = 586
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnShow = FormShow
  TextHeight = 15
  object Pnl_principal: TPanel
    Left = 0
    Top = 0
    Width = 588
    Height = 321
    TabOrder = 0
    object Btn_pesquisar_empresa: TSpeedButton
      Left = 464
      Top = 271
      Width = 97
      Height = 39
      Caption = 'Selecionar:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Btn_pesquisar_empresaClick
    end
    object search_empresas: TSearchBox
      Left = 8
      Top = 1
      Width = 569
      Height = 23
      TabOrder = 0
      TextHint = 'Selecione as Empresas:'
      OnChange = search_empresasChange
    end
    object DBGrid_pesquisa_empresa: TDBGrid
      Left = 8
      Top = 29
      Width = 569
      Height = 236
      DataSource = DataSource_empresas
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'cdempresa'
          Title.Caption = 'C'#243'digo da empresa:'
          Width = 122
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nmempresa'
          Title.Caption = 'Nome:'
          Width = 448
          Visible = True
        end>
    end
  end
  object DataSource_empresas: TDataSource
    DataSet = FDQuery_principal
    Left = 199
    Top = 273
  end
  object FDQuery_principal: TFDQuery
    Active = True
    Connection = Frm_ajuste_sped.FDConnection_principal
    SQL.Strings = (
      'SELECT '
      
        '  CAST(LPAD (A.cdempresa::text, 5, '#39'0'#39') AS VARCHAR(5)) as cdempr' +
        'esa,'
      '  B.nmempresa '
      'FROM '
      '  wfiscal.empresa A'
      'JOIN'
      '  Wphd.empresa B'
      'ON '
      '  A.cdempresa = B.cdempresa')
    Left = 304
    Top = 272
  end
end
