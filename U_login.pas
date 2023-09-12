unit U_login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFrm_login = class(TForm)
    pnl_titulo: TPanel;
    Pnl_centro: TPanel;
    Edt_login: TEdit;
    edt_senha: TEdit;
    btn_entrar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    procedure btn_entrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_login: TFrm_login;

implementation

{$R *.dfm}

uses U_tela;

procedure TFrm_login.btn_entrarClick(Sender: TObject);
begin
  if (edt_login.Text = 'SuporteFiscal') and (edt_senha.Text = 'Suppack123') then
  begin
    // Credenciais corretas, abrir o Form1
    Form1 := TForm1.Create(Application);
    Form1.Show;
    Hide; // Ocultar o formulário de login
  end
  else
  begin
    // Credenciais incorretas, exibir mensagem de erro
    ShowMessage('Senha incorreta. Por favor, tente novamente.');
  end;
end;


end.
