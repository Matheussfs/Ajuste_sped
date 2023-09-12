unit U_configura_banco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, System.IniFiles, Vcl.ExtCtrls, FireDAC.Comp.Client, FireDAC.Stan.Error;

type
  TFrm_conectar_banco = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Panel5: TPanel;
    Panel2: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Btn_mostrar_senha: TSpeedButton;
    Panel6: TPanel;
    Edt_caminho: TEdit;
    Edt_porta: TEdit;
    Edt_base: TEdit;
    Edt_login: TEdit;
    Edt_senha: TEdit;
    Btn_confirmar: TBitBtn;
    Btn_cancelar: TBitBtn;
    CmbBanco: TComboBox;
    Label4: TLabel;
    procedure Btn_confirmarClick(Sender: TObject);
    procedure Btn_cancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_conectar_banco: TFrm_conectar_banco;

implementation

{$R *.dfm}

uses U_ajuste_sped;

function IsPortValid(const Port: string): Boolean;
var
  PortNumber: Integer;
begin
  Result := TryStrToInt(Port, PortNumber) and (PortNumber >= 1) and (PortNumber <= 65535);
end;

procedure TFrm_conectar_banco.Btn_cancelarClick(Sender: TObject);
begin
  Frm_conectar_banco.Close;
end;

procedure TFrm_conectar_banco.Btn_confirmarClick(Sender: TObject);
var
  I: Integer;
  IsConnected: Boolean;
begin
  if (Edt_caminho.Text = '') or (Edt_base.Text = '') or (Edt_login.Text = '') or
    (Edt_senha.Text = '') then
  begin
    ShowMessage('Atenção, campos com o * são obrigatórios');
    Exit;
  end;

  if not IsPortValid(Edt_porta.Text) then
  begin
    ShowMessage('Porta inválida. Insira um valor entre 1 e 65535.');
    Exit;
  end;

  // Determine qual banco de dados o usuário escolheu
  if CmbBanco.ItemIndex = 0 then // PostgreSQL selecionado
  begin
    // Configurar os parâmetros da conexão para o PostgreSQL
    frm_ajuste_sped.FDConnection_principal.Params.Clear;
    frm_ajuste_sped.FDConnection_principal.Params.Add('DriverID=PG'); // Driver para o PostgreSQL
  end
  else if CmbBanco.ItemIndex = 1 then // SQL Server selecionado
  begin
    // Configurar os parâmetros da conexão para o SQL Server
    frm_ajuste_sped.FDConnection_principal.Params.Clear;
    frm_ajuste_sped.FDConnection_principal.Params.Add('DriverID=MSSQL'); // Driver para o SQL Server
  end
  else
  begin
    ShowMessage('Selecione um banco de dados válido.');
    Exit;
  end;

  // Configurar os outros parâmetros da conexão
  frm_ajuste_sped.FDConnection_principal.Params.Add('Server=' + Edt_caminho.Text);
  frm_ajuste_sped.FDConnection_principal.Params.Add('Database=' + Edt_base.Text);
  frm_ajuste_sped.FDConnection_principal.Params.Add('User_Name=' + Edt_login.Text);
  frm_ajuste_sped.FDConnection_principal.Params.Add('Password=' + Edt_senha.Text);
  frm_ajuste_sped.FDConnection_principal.Params.Add('Port=' + Edt_porta.Text);

  try
    // Tenta abrir a conexão
    frm_ajuste_sped.FDConnection_principal.Connected := True;

    // Se chegou até aqui, a conexão foi bem-sucedida
    ShowMessage('Conexão bem-sucedida');
    Frm_conectar_banco.Close;
    FRM_Ajuste_Sped.Edt_cod_ajuste.Enabled := true;
    FRM_Ajuste_Sped.Cbx_base_de_calc.Enabled := true;
    FRM_Ajuste_Sped.Edt_Aliquota.Enabled := true;
    FRM_Ajuste_Sped.Cbx_outros_valores.Enabled := true;
    FRM_Ajuste_Sped.Edt_CFOP.Enabled := true;
    FRM_Ajuste_Sped.Cbx_itens.Enabled := true;
    FRM_Ajuste_Sped.Cbx_Nota.Enabled := true;
    FRM_Ajuste_Sped.Btn_Rodar_Ajuste.Enabled := true;
    FRM_Ajuste_Sped.Btn_pesquisar_empresa.Enabled := true;
    FRM_Ajuste_Sped.Btn_Configurar_banco.visible := false;
    FRM_Ajuste_Sped.Edt_descricao.Enabled := true;
    FRM_Ajuste_Sped.Edt_icms_nota.Enabled := true;
    FRM_Ajuste_Sped.Edt_modelo_nota.Enabled := true;
    FRM_Ajuste_Sped.LabelStatus.Font.Color := clGreen;


  except
    on E: EFDDBEngineException do
    begin
      // Verifica se a mensagem de erro indica falha na autenticação
      if Pos('password authentication failed', E.Message) > 0 then
      begin
        ShowMessage('Erro de autenticação: A senha está incorreta.');
      end
      else
      begin
        // Tratae outros erros de conexão ou exiba uma mensagem genérica
        ShowMessage('Erro ao conectar ao servidor: ' + E.Message);
      end;
    end;
  end;

end;
procedure TFrm_conectar_banco.FormClose(Sender: TObject;
  var Action: TCloseAction);
  VAR I: Integer;
begin
     for I := 0 to ComponentCount - 1 do
    begin
      if Components[I] is TEdit then
        TEdit(Components[I]).Enabled := True
      else if Components[I] is TComboBox then
        TComboBox(Components[I]).Enabled := True
      else if Components[I] is TCheckBox then
        TCheckBox(Components[I]).Enabled := True
      else if Components[I] is TSpeedButton then
        TSpeedButton(Components[I]).Enabled := True;
    end;
end;

procedure TFrm_conectar_banco.FormCreate(Sender: TObject);
var
  IniFile: TIniFile;
begin
  Edt_senha.PasswordChar := '*';
  CmbBanco.Items.Add('PostgreSQL');
  CmbBanco.Items.Add('SQL Server');
  CmbBanco.ItemIndex := 0; // Define PostgreSQL como a escolha padrão

  begin
    IniFile := TIniFile.Create('CaminhoParaSeuArquivo.ini');
  try
    // Recupera os valores das configurações do INI e preencha os campos de edição
    Edt_caminho.Text := IniFile.ReadString('ConfiguracaoBanco', 'Server', '');
    Edt_base.Text := IniFile.ReadString('ConfiguracaoBanco', 'Database', '');
    Edt_login.Text := IniFile.ReadString('ConfiguracaoBanco', 'User_Name', '');
    Edt_senha.Text := IniFile.ReadString('ConfiguracaoBanco', 'Password', '');
    Edt_porta.Text := IniFile.ReadString('ConfiguracaoBanco', 'Port', '');
  finally
    IniFile.Free;
  end;
  end;
end;

end.
