unit U_pesquisa_empresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.WinXCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, U_ajuste_sped;

type
  TFrm_pesquisa_empresa = class(TForm)
    Pnl_principal: TPanel;
    search_empresas: TSearchBox;
    DBGrid_pesquisa_empresa: TDBGrid;
    Btn_pesquisar_empresa: TSpeedButton;
    DataSource_empresas: TDataSource;
    FDQuery_principal: TFDQuery;
    procedure search_empresasChange(Sender: TObject);
    procedure Btn_pesquisar_empresaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    SelectedIDs: TStringList;
    FCdEmpresa: string;
    FNmEmpresa: string;
    FFrmAjusteSPED: TFrm_ajuste_sped;
  public
    { Public declarations }
     function ObterEmpresaSelecionada: string;
     property FrmAjusteSPED: TFrm_ajuste_sped read FFrmAjusteSPED write FFrmAjusteSPED;
  end;

var
  Frm_pesquisa_empresa: TFrm_pesquisa_empresa;

implementation

{$R *.dfm}

procedure TFrm_pesquisa_empresa.Btn_pesquisar_empresaClick(Sender: TObject);
var
  CdEmpresa: string;
begin
  // Verifique se h� uma linha selecionada no DBGrid_pesquisa_empresa
  if DBGrid_pesquisa_empresa.SelectedRows.Count > 0 then
  begin
    // Obtenha o c�digo da empresa da linha selecionada
    CdEmpresa := DBGrid_pesquisa_empresa.DataSource.DataSet.FieldByName('cdempresa').AsString;

    // Verifique se o objeto FrmAjusteSPED est� atribu�do
    if Assigned(FrmAjusteSPED) then
    begin
    FrmAjusteSPED.FDQuery_principal.Close;
    FrmAjusteSPED.FDQuery_principal.SQL.Clear;
    FrmAjusteSPED.FDQuery_principal.SQL.Add('SELECT ' +
      'CAST(LPAD(A.cdempresa::text, 5, ''0'') AS VARCHAR(5)) AS cdempresa, ' +
      'B.nmempresa ' +
      'FROM wfiscal.empresa A ' +
      'JOIN Wphd.empresa B ' +
      'ON A.cdempresa = B.cdempresa ' +
      'WHERE CAST(LPAD(A.cdempresa::text, 5, ''0'') AS VARCHAR(5)) = :CdEmpresa');
    FrmAjusteSPED.FDQuery_principal.ParamByName('CdEmpresa').AsString := CdEmpresa;
    FrmAjusteSPED.FDQuery_principal.Open;

      // Verifique se a consulta retornou algum resultado
      if not FrmAjusteSPED.FDQuery_principal.IsEmpty then
      begin
        // Preencha o DBGrid_empresa do FrmAjusteSPED com os dados da empresa
        // Supondo que o DBGrid_empresa tenha colunas chamadas "cdempresa" e "nmempresa"
        FrmAjusteSPED.DBGrid_empresa.DataSource := FrmAjusteSPED.DataSource_empresas;
        FrmAjusteSPED.DataSource_empresas.DataSet := FrmAjusteSPED.FDQuery_principal;
      end
      else
      begin
        ShowMessage('Nenhum resultado encontrado para a empresa selecionada.');
      end;
    end
    else
    begin
      ShowMessage('FrmAjusteSPED n�o est� atribu�do.');
    end;
  end
  else
  begin
    ShowMessage('Nenhuma linha selecionada no DBGrid_pesquisa_empresa.');
  end;
  close;
end;


procedure TFrm_pesquisa_empresa.FormShow(Sender: TObject);
begin
Frm_pesquisa_empresa.FDQuery_principal.active :=true;
end;

function TFrm_pesquisa_empresa.ObterEmpresaSelecionada: string;
begin
   // Verifique se h� linhas selecionadas no DBGrid_pesquisa_empresa
   if DBGrid_pesquisa_empresa.SelectedRows.Count > 0 then
  begin
    // Obtenha o DataSet associado ao DBGrid
    if Assigned(DBGrid_pesquisa_empresa.DataSource) and
       Assigned(DBGrid_pesquisa_empresa.DataSource.DataSet) then
    begin
      // Acesse o campo cdempresa da linha selecionada
      Result := DBGrid_pesquisa_empresa.DataSource.DataSet.FieldByName('cdempresa').AsString;
    end
    else
    begin
      // DataSet n�o atribu�do, retorne uma string vazia ou outra indica��o apropriada.
      Result := '';
    end;
  end
  else
  begin
    // Se nenhuma linha estiver selecionada, retorne uma string vazia ou outra indica��o apropriada.
    Result := '';
  end;
end;

procedure TFrm_pesquisa_empresa.search_empresasChange(Sender: TObject);
var
  SearchString: string;
  IsStringSearch: boolean;
begin
  SearchString := search_empresas.Text;
  IsStringSearch := True;

  // Verifica se a string cont�m apenas letras
  for var i := 1 to Length(SearchString) do
  begin
    if not (SearchString[i] in ['a'..'z', 'A'..'Z']) then
    begin
      IsStringSearch := False;
      Break; // Sai do loop ao encontrar um caractere n�o-alfab�tico
    end;
  end;

  try
    FDQuery_principal.Close;
    FDQuery_principal.SQL.Clear;

    if IsStringSearch then
    begin
      FDQuery_principal.SQL.Text :=
    'SELECT ' +
      'CAST(LPAD(A.cdempresa::text, 5, ''0'') AS VARCHAR(5)) AS cdempresa, ' +
      'B.nmempresa ' +
      'FROM wfiscal.empresa A ' +
      'JOIN Wphd.empresa B ' +
      'ON A.cdempresa = B.cdempresa ' +
    'WHERE ' +
    '  LOWER(B.nmempresa) ILIKE ''%'' || :searchString || ''%'' OR ' +
    '  CAST(LPAD(A.cdempresa::text, 5, ''0'') AS VARCHAR(5)) ILIKE ''%'' || :searchString || ''%''';
    end
    else
    begin
      FDQuery_principal.SQL.Text :=
      'SELECT ' +
      'CAST(LPAD(A.cdempresa::text, 5, ''0'') AS VARCHAR(5)) AS cdempresa, ' +
      'B.nmempresa ' +
      'FROM wfiscal.empresa A ' +
      'JOIN Wphd.empresa B ' +
      'ON ' +
      '  A.cdempresa = B.cdempresa ' +
      'WHERE CAST(A.cdempresa AS TEXT) ILIKE :searchString';

    end;

    FDQuery_principal.ParamByName('searchString').DataType := ftString;
    FDQuery_principal.ParamByName('searchString').Value := '%' + LowerCase(SearchString) + '%';
    FDQuery_principal.Open;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao executar a consulta');
    end;
  end;
end;


end.
