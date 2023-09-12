unit U_ajuste_sped;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.WinXCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, Vcl.Buttons,DateUtils, ADODB, ComCtrls;

type
  TFrm_ajuste_sped = class(TForm)
    Pnl_principal: TPanel;
    Pnl_titulo: TPanel;
    DBGrid_empresa: TDBGrid;
    Label1: TLabel;
    FDConnection_principal: TFDConnection;
    FDQuery_principal: TFDQuery;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    DataSource_empresas: TDataSource;
    Btn_pesquisar_empresa: TSpeedButton;
    Pnl_bases: TPanel;
    Label2: TLabel;
    Edt_cod_ajuste: TEdit;
    Label3: TLabel;
    Cbx_base_de_calc: TComboBox;
    Label4: TLabel;
    Edt_Aliquota: TEdit;
    Label5: TLabel;
    Cbx_outros_valores: TComboBox;
    Panel1: TPanel;
    Cbx_itens: TCheckBox;
    Cbx_Nota: TCheckBox;
    Label6: TLabel;
    Edt_CFOP: TEdit;
    Pnl_Rodar_Ajuste: TPanel;
    Btn_Rodar_Ajuste: TSpeedButton;
    Pnl_status: TPanel;
    Btn_Configurar_banco: TBitBtn;
    LabelStatus: TLabel;
    Pnl_itens: TPanel;
    Cbx_por_ncm: TCheckBox;
    Cbx_todos_os_itens: TCheckBox;
    Edt_ncm: TEdit;
    Pn_data: TPanel;
    DateTimePicker_fim: TDateTimePicker;
    DateTimePicker_inicio: TDateTimePicker;
    Label7: TLabel;
    Edt_descricao: TEdit;
    Label8: TLabel;
    Query: TFDQuery;
    Query2: TFDQuery;
    Edt_icms_nota: TEdit;
    Label9: TLabel;
    Edt_modelo_nota: TEdit;
    Label10: TLabel;
    QueryUpdate: TFDQuery;
    procedure Btn_pesquisar_empresaClick(Sender: TObject);
    procedure FDConnection_principalAfterConnect(Sender: TObject);
    procedure FDConnection_principalAfterDisconnect(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Btn_Configurar_bancoClick(Sender: TObject);
    procedure Cbx_por_ncmClick(Sender: TObject);
    procedure Cbx_itensClick(Sender: TObject);
    procedure Cbx_NotaClick(Sender: TObject);
    procedure Cbx_todos_os_itensClick(Sender: TObject);
    procedure Edt_CFOPExit(Sender: TObject);
    procedure Edt_CFOPKeyPress(Sender: TObject; var Key: Char);
    procedure Edt_AliquotaKeyPress(Sender: TObject; var Key: Char);
    procedure PorNota;
    procedure Btn_Rodar_AjusteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edt_cod_ajusteChange(Sender: TObject);
    procedure Edt_cod_ajusteKeyPress(Sender: TObject; var Key: Char);
    procedure Edt_cod_ajusteExit(Sender: TObject);
     procedure PorItem;
  private
    { Private declarations }
     SelectedIDs: TStringList;
  public
    { Public declarations }
  procedure OpenFDQueryPrincipal; // M�todo p�blico para abrir a consulta.
  procedure AdicionarLinhaAoDBGridEmpresa(const CdEmpresa, NmEmpresa: string);
  var
  FCdEmpresa: string;
  FNmEmpresa: string;
  end;
var
  Frm_ajuste_sped: TFrm_ajuste_sped;

implementation

{$R *.dfm}

uses U_pesquisa_empresa, U_configura_banco;

procedure TFrm_ajuste_sped.AdicionarLinhaAoDBGridEmpresa(const CdEmpresa,
  NmEmpresa: string);
begin
if not FDQuery_principal.Active then
    FDQuery_principal.Active := True;

  // Adiciona a linha ao DBGrid_empresa
  FDQuery_principal.Append;
  FDQuery_principal.FieldByName('cdempresa').AsString := CdEmpresa;
  FDQuery_principal.FieldByName('nmempresa').AsString := NmEmpresa;
  // Defina outros campos conforme necess�rio
  FDQuery_principal.Post;
end;

procedure TFrm_ajuste_sped.Btn_Configurar_bancoClick(Sender: TObject);
begin
  Try
  Frm_conectar_banco := tFrm_conectar_banco.create(self);
  Frm_conectar_banco.showmodal;

Finally
end;
end;

procedure TFrm_ajuste_sped.Btn_pesquisar_empresaClick(Sender: TObject);
begin
Frm_pesquisa_empresa := TFrm_pesquisa_empresa.Create(Self);
  Frm_pesquisa_empresa.FrmAjusteSPED := Self;
  try
    if Frm_pesquisa_empresa.ShowModal = mrOK then
      Frm_pesquisa_empresa.Free;
  finally
  end;

  Frm_pesquisa_empresa.FDQuery_principal.Close;
  Frm_pesquisa_empresa.FDQuery_principal.SQL.Clear;
  Frm_pesquisa_empresa.FDQuery_principal.SQL.Add('SELECT A.cdempresa, B.nmempresa ' +
        'FROM wfiscal.empresa A ' +
        'JOIN Wphd.empresa B ' +
        'ON A.cdempresa = B.cdempresa');
  Frm_pesquisa_empresa.FDQuery_principal.active :=true;
  Frm_pesquisa_empresa.FDQuery_principal.Open;


end;


procedure TFrm_ajuste_sped.Btn_Rodar_AjusteClick(Sender: TObject);
begin
if (DataSource_empresas.DataSet.RecordCount = 0) then
  ShowMessage('Selecione a empresa antes de rodar o ajuste')

  else
  begin
  if Cbx_Nota.Checked = true then
    begin
      PorNota; // Procedure para rodar o ajuste sped por notas
    end;
  end;

  if Cbx_itens.Checked = true then
    begin
    PorItem; //procedure para rodar o ajuste sped por item
    end;
end;



procedure TFrm_ajuste_sped.Cbx_itensClick(Sender: TObject);
begin
  if Cbx_itens.Checked = true then
  begin
   Cbx_por_ncm.visible := true;
   Cbx_todos_os_itens.visible := true;
   Cbx_Nota.Checked := false;
   Cbx_Nota.Enabled := false;
   Pnl_itens.Visible :=true ;
   Btn_Rodar_Ajuste.Enabled := true;
   Cbx_por_ncm.Enabled := True;
  end
 else
 begin
   Cbx_por_ncm.visible := false;
   Cbx_todos_os_itens.visible := false;
   Pnl_itens.Visible := false;
   Cbx_Nota.Enabled := true;
   Cbx_por_ncm.Checked := false;
   Cbx_todos_os_itens.Checked := false;
   Edt_ncm.Clear;
   Btn_Rodar_Ajuste.Enabled := false;
   Cbx_por_ncm.Enabled := false;
  end;
  end;


procedure TFrm_ajuste_sped.Cbx_NotaClick(Sender: TObject);
begin
if Cbx_Nota.Checked = true then
begin
  Cbx_itens.Enabled := false;
  Cbx_itens.checked := false;
  Edt_ncm.Clear;
  Btn_Rodar_Ajuste.Enabled := true;
end
else
begin
 Cbx_itens.Enabled := true;
 Cbx_itens.Enabled := true;
 Btn_Rodar_Ajuste.Enabled :=false;
end;
end;

procedure TFrm_ajuste_sped.Cbx_por_ncmClick(Sender: TObject);
begin
if Cbx_por_ncm.Checked = true then
begin
 Edt_ncm.Visible := true;
 Edt_ncm.Width := 108;
 Cbx_todos_os_itens.Visible := false;
 Edt_ncm.Enabled :=true;

end
else
begin
 Edt_ncm.Visible := false;
 Cbx_todos_os_itens.Visible := true;
   Edt_ncm.Clear;
    Edt_ncm.Enabled :=false;

end;

end;

procedure TFrm_ajuste_sped.Cbx_todos_os_itensClick(Sender: TObject);

begin

 if  Cbx_todos_os_itens.checked = true then
begin
  Cbx_por_ncm.enabled := false;
  Cbx_por_ncm.checked  := false;
  Edt_ncm.Clear;
end
else
begin
  Cbx_por_ncm.enabled := true;
end;


end;



procedure TFrm_ajuste_sped.Edt_AliquotaKeyPress(Sender: TObject; var Key: Char);
begin
if not (CharInSet(Key, ['0'..'9', '.', ',', #8]) or (Key = #13)) then
    Key := #0;
end;

procedure TFrm_ajuste_sped.Edt_CFOPExit(Sender: TObject);
begin
if Length(Edt_CFOP.Text) > 4 then
begin
  Showmessage ('Informe um CFOP v�lido.');
  Edt_CFOP.SetFocus;
  end;
if Length (Edt_CFOP.Text) < 4 then
begin
  Showmessage ('Informe um CFOP v�lido.');
  Edt_CFOP.SetFocus;
end;

end;

procedure TFrm_ajuste_sped.Edt_CFOPKeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key, ['0'..'9', #8]) or (Key = #13)) then
  Key := #0;
end;

procedure TFrm_ajuste_sped.Edt_cod_ajusteChange(Sender: TObject);
 var
 CharTyped: Char;
begin

end;

procedure TFrm_ajuste_sped.Edt_cod_ajusteExit(Sender: TObject);
begin
 if Length(Edt_cod_ajuste.Text) >10 then
  begin
    showmessage ('C�digo de ajuste deve conter apenas 10 d�gitos');
    Edt_cod_ajuste.text :='';
    Edt_cod_ajuste.SetFocus;
  end;
end;

procedure TFrm_ajuste_sped.Edt_cod_ajusteKeyPress(Sender: TObject;
  var Key: Char);
begin
 Key := UpCase(Key);
if Length(Edt_cod_ajuste.Text) >= 10 then
    Key := #0; // Anula a tecla pressionada
end;

procedure TFrm_ajuste_sped.FDConnection_principalAfterConnect(Sender: TObject);
begin
  LabelStatus.Caption := 'Conectado ao banco de dados';
end;

procedure TFrm_ajuste_sped.FDConnection_principalAfterDisconnect(Sender: TObject);
begin
  LabelStatus.Caption := 'Desconectado do banco de dados';
end;

procedure TFrm_ajuste_sped.FormCreate(Sender: TObject);
var
  I: Integer;
  IsConnected: Boolean;
  FormatSettings: TFormatSettings;
  DataAtual: TDateTime;
begin
 IsConnected := FDConnection_principal.Connected;

  if IsConnected then
begin
  LabelStatus.Font.Color := clGreen;
  LabelStatus.Caption := 'Conectado ao banco de dados';

end
else
begin
  LabelStatus.Caption := 'Desconectado do banco de dados';
  LabelStatus.Font.Color := clRed;
    Btn_Configurar_banco.Visible := true;
end;
for I := 0 to ComponentCount - 1 do
  begin
    if Components[I] is TEdit then
      TEdit(Components[I]).Enabled := IsConnected
    else if Components[I] is TComboBox then
      TComboBox(Components[I]).Enabled := IsConnected
    else if Components[I] is TCheckBox then
      TCheckBox(Components[I]).Enabled := IsConnected
      else if Components[I] is TSpeedButton then
      TSpeedButton(Components[I]).Enabled := IsConnected;

  end;

    GetLocaleFormatSettings(LOCALE_USER_DEFAULT, FormatSettings); // obt�m as configura��es regionais do sistema
    FormatSettings.ShortDateFormat := 'dd/mm/yyyy'; // define a formata��o de data desejada
    Application.UpdateFormatSettings := False; // desativa a atualiza��o das configura��es regionais durante a execu��o do programa
    DataAtual := Date(); // Obtem data atual da m�quina
    DateTimePicker_inicio.Date := StartOfTheMonth(DataAtual);
    DateTimePicker_fim.Date := EndOfTheMonth(DataAtual);
end;



procedure TFrm_ajuste_sped.FormShow(Sender: TObject);
begin
Btn_Rodar_Ajuste.Enabled :=false;
end;

procedure TFrm_ajuste_sped.OpenFDQueryPrincipal;
var
  i: Integer;
  SQLWhere: string;
begin
  if SelectedIDs.Count = 0 then
  begin
    // Se n�o houver IDs selecionados, n�o execute a consulta
    FDQuery_principal.Close;
    Exit;
  end;

  SQLWhere := 'WHERE A.cdempresa IN (';
  for i := 0 to SelectedIDs.Count - 1 do
  begin
    SQLWhere := SQLWhere + SelectedIDs[i];
    if i < SelectedIDs.Count - 1 then
      SQLWhere := SQLWhere + ', ';
  end;
  SQLWhere := SQLWhere + ')';

  FDQuery_principal.Close;
  FDQuery_principal.SQL.Clear;
  FDQuery_principal.SQL.Add('SELECT A.cdempresa, B.nmempresa FROM wfiscal.empresa A ' +
    'JOIN Wphd.empresa B ON A.cdempresa = B.cdempresa ' + SQLWhere);
  FDQuery_principal.Open;
end;

procedure TFrm_ajuste_sped.PorItem;
Begin
  Application.MessageBox('Em desenvolvimento.', 'Mensagem', MB_ICONINFORMATION);
end;



procedure TFrm_ajuste_sped.PorNota;
var
  empresa_id, Nota_id, aliquota_icms, Valor_icms, Outros_icms,
  descricao_complementar, codigo: Variant;
  tabela, coluna_base,nmobservacao, coluna_outros: string;
  Base_icms: Double;
  notaJaLancada: Boolean; // Vari�vel para verificar se a nota j� foi lan�ada

begin
  if Edt_cod_ajuste.Text = '' then
  begin
    ShowMessage('Preencha o c�digo de ajuste!');
    Edt_cod_ajuste.SetFocus;
    Exit;
  end;

  begin
  if Edt_CFOP.Text = '' then
  begin
    ShowMessage('Preencha o CFOP que deseja realizar o ajuste!');
    Edt_CFOP.SetFocus;
    Exit;
  end;

  begin
  if Edt_icms_nota.Text = '' then
  begin
    ShowMessage('Preencha a al�quota de icms das notas que deseja realizar o ajuste!');
    Edt_icms_nota.SetFocus;
    Exit;
  end;

  if Edt_descricao.Text ='' then
  begin
    ShowMessage('Preencha a descri��o!');
    Edt_descricao.SetFocus;
    Exit;
  end;


  if Cbx_base_de_calc.Text = '' then
  begin
    ShowMessage('Preencha a base de c�lculo!');
    Cbx_base_de_calc.SetFocus;
    Exit;
  end;

  if Edt_Aliquota.Text = '' then
  begin
    ShowMessage('Preencha a al�quota!');
    Edt_Aliquota.SetFocus;
    Exit;
  end;

  if Cbx_outros_valores.Text = '' then
  begin
    ShowMessage('Preencha o valor de outros!');
    Cbx_outros_valores.SetFocus;
    Exit;
  end;

  if Edt_CFOP.Text = '' then
  begin
    ShowMessage('Preencha o CFOP!');
    Edt_CFOP.SetFocus;
    Exit;
  end;

  // Obtem o valor do campo empresa_id do DBGrid_empresa
  empresa_id := DBGrid_empresa.DataSource.DataSet.FieldByName('cdempresa').Value;

  // Determina a tabela com base no valor de empresa_id
  tabela := 'wfiscal.m' + empresa_id;

  // Determina o nome da coluna com base na sele��o do Cbx_base_de_calc
  if Cbx_base_de_calc.Text = 'Valor cont�bil' then
    coluna_base := 'vlcontabil'
  else if Cbx_base_de_calc.Text = 'Base de Icms' then
    coluna_base := 'vlicmsbase'
  else if Cbx_base_de_calc.Text = 'Valor de Icms' then
    coluna_base := 'vlicmsvalor'
  else if Cbx_base_de_calc.Text = 'Valor de outros' then
    coluna_base := 'vlicmsoutras'
  else
  begin
    ShowMessage('Sele��o inv�lida no combobox Cbx_base_de_calc.');
    Exit;
  end;

  // Determina o nome da coluna com base na sele��o do Cbx_outros_valores
  if Cbx_outros_valores.Text = 'Valor cont�bil' then
    coluna_outros := 'vlcontabil'
  else if Cbx_outros_valores.Text = 'Base de Icms' then
    coluna_outros := 'vlicmsbase'
  else if Cbx_outros_valores.Text = 'Valor de Icms' then
    coluna_outros := 'vlicmsvalor'
  else if Cbx_outros_valores.Text = 'Valor de outros' then
    coluna_outros := 'vlicmsoutras'
    else if Cbx_outros_valores.Text = '0' then
    coluna_outros := 'vlicmsoutras'
  else
  begin
    ShowMessage('Sele��o inv�lida no combobox Cbx_outros_valores.');
    Exit;
  end;

  // Prepara a consulta para buscar o valor de cdnota e das colunas Base_icms e Outros_icms
  Query.SQL.Text := 'SELECT cdnota, ' + coluna_base + ', ' + coluna_outros + ' FROM ' + tabela +
    ' WHERE idcodfiscal = :EDT_CFOP and idmoddocfiscal = :Edt_modelo_nota and vlicmsaliquota = :Edt_icms_nota AND dtescrituracao BETWEEN :DataInicio AND :DataFim';

  Query.ParamByName('EDT_CFOP').DataType := ftInteger;
  Query.ParamByName('EDT_CFOP').Value := StrToInt(Edt_CFOP.Text);

  Query.ParamByName('Edt_modelo_nota').DataType := ftString; // Parametrizando idmoddocfiscal como string
  Query.ParamByName('Edt_modelo_nota').Value := Edt_modelo_nota.Text;

  Query.ParamByName('Edt_icms_nota').DataType := ftFloat; // Parametrizando vlicmsaliquota como float (se for um n�mero decimal)
  Query.ParamByName('Edt_icms_nota').Value := StrToFloat(Edt_icms_nota.Text);

  Query.ParamByName('DataInicio').DataType := ftDateTime;
  Query.ParamByName('DataInicio').Value := DateTimePicker_inicio.Date;

  Query.ParamByName('DataFim').DataType := ftDateTime;
  Query.ParamByName('DataFim').Value := DateTimePicker_fim.Date;

  // Abra a consulta
  Query.Open;

  if not Query.IsEmpty then
  begin
    while not Query.Eof do
    begin
      Nota_id := Query.FieldByName('cdnota').Value;
      Base_icms := Query.FieldByName(coluna_base).AsFloat; // Convertido para float
      Outros_icms := Query.FieldByName(coluna_outros).AsFloat; // Convertido para float

      // Verifica se a nota j� existe na tabela wfiscal.sped_ajuste
      Query2.SQL.Text := 'SELECT COUNT(*) FROM wfiscal.sped_ajuste WHERE Nota_id = :Nota_id';
      Query2.ParamByName('Nota_id').Value := Nota_id;
      Query2.Open;

      notaJaLancada := (Query2.Fields[0].AsInteger > 0); // Verifica se a nota j� foi lan�ada

      Query2.Close;

      // Realiza o c�lculo e a inser��o apenas se a nota n�o estiver lan�ada
      if not notaJaLancada then
      begin
        // Realiza o c�lculo
        aliquota_icms := StrToFloat(Edt_Aliquota.Text);
        Valor_icms := (Base_icms * aliquota_icms / 100);
        descricao_complementar := Edt_descricao.Text;
        codigo := Edt_cod_ajuste.Text;

        // Executa a inser��o
        Query2.SQL.Text := 'INSERT INTO wfiscal.sped_ajuste ' +
          '(empresa_id, Nota_id, aliquota_icms, Base_icms, Valor_icms, Outros_icms, descricao_complementar, codigo) ' +
          'VALUES (:empresa_id::integer, :Nota_id, :aliquota_icms, :Base_icms, :Valor_icms, :Outros_icms, :descricao_complementar, :codigo)';
        Query2.ParamByName('empresa_id').Value := empresa_id;
        Query2.ParamByName('Nota_id').Value := Nota_id;
        Query2.ParamByName('aliquota_icms').Value := aliquota_icms;
        Query2.ParamByName('Base_icms').Value := Base_icms;
        Query2.ParamByName('Valor_icms').Value := Valor_icms;
        Query2.ParamByName('Outros_icms').Value := Outros_icms;
        Query2.ParamByName('descricao_complementar').Value := descricao_complementar;
        Query2.ParamByName('codigo').Value := codigo;

        Query2.ExecSQL;
      end;
       if not notaJaLancada then
      begin
        QueryUpdate.SQL.Text := 'UPDATE ' + tabela +
          ' SET nmobservacao = :nmobservacao ' +
          ' WHERE cdnota = :cdnota';

        // Constroi o valor para nmobservacao
        nmobservacao := 'ajuste de c�digo ' + Edt_cod_ajuste.Text + ' ' + Edt_descricao.Text + ' de valor = ' + FloatToStr(Valor_icms);

        QueryUpdate.ParamByName('nmobservacao').Value := nmobservacao;
        QueryUpdate.ParamByName('cdnota').Value := Nota_id;

        QueryUpdate.ExecSQL;
      end;
      Query.Next;
    end;

    Query.Close;
    ShowMessage('Ajuste conclu�do para todas as notas.');

  end
  else
  begin
    ShowMessage('Nenhum registro encontrado para a condi��o especificada.');
  end;
 end;

  end;
end;

end.
