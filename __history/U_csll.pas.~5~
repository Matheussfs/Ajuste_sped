unit U_csll;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls,ShellAPI, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFrm_csll = class(TForm)
    Panel1: TPanel;
    Cbx_venda: TCheckBox;
    Cbx_servico: TCheckBox;
    Cbx_outras: TCheckBox;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edt_base_bruta: TEdit;
    Edt_aliq: TEdit;
    Edt_base: TEdit;
    Edt_aliq_final: TEdit;
    Panel3: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Btn_calcu: TButton;
    Button3: TButton;
    Edt_resultado: TEdit;
    SpeedButton1: TSpeedButton;
    procedure Cbx_vendaClick(Sender: TObject);
    procedure Cbx_servicoClick(Sender: TObject);
    procedure Cbx_outrasClick(Sender: TObject);
    procedure edt_base_brutaKeyPress(Sender: TObject; var Key: Char);
    procedure Edt_baseKeyPress(Sender: TObject; var Key: Char);
    procedure Edt_aliqKeyPress(Sender: TObject; var Key: Char);
    procedure Edt_aliq_finalKeyPress(Sender: TObject; var Key: Char);
    procedure edt_base_brutaExit(Sender: TObject);
    procedure Edt_aliqExit(Sender: TObject);
    procedure Edt_aliq_finalExit(Sender: TObject);
    procedure venda;
     procedure servico;
     procedure outras;
    procedure Btn_calcuClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
  var resultado_final, aliquota_final, aliquota, base, base_bruta:real;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_csll: TFrm_csll;

implementation

{$R *.dfm}

procedure TFrm_csll.Btn_calcuClick(Sender: TObject);
begin
//chamando a procedure de outras alíquotas
if cbx_outras.checked = true then
begin
  outras;
end;

//chamando a procedure de serviços
if Cbx_servico.Checked then
begin
servico;
end;

//chamando a procedure de vendas
if Cbx_venda.Checked then
begin
venda;
end;

end;

procedure TFrm_csll.Button3Click(Sender: TObject);
begin
//configurando botão de limpar
var p:integer;
begin
for p := 0 to   Frm_csll.ComponentCount-1 do
 if components[p] is tedit then
 begin
    tedit(components[p]).text := '0';
  end;
end;
end;

procedure TFrm_csll.Cbx_outrasClick(Sender: TObject);
//configurando o checkbox de outras alíquotas
begin
if Cbx_outras.Checked = true then
Edt_aliq.enabled := true;
if Cbx_outras.Checked = true then
Edt_aliq_final.enabled := true;

if Cbx_outras.Checked = true then
btn_calcu.enabled := true;
if Cbx_outras.Checked = false then
btn_calcu.enabled := false;

if Cbx_outras.Checked = false then
Edt_aliq.enabled := false;
if Cbx_outras.Checked = false then
Edt_aliq_final.enabled := false;

if Cbx_outras.Checked = true then
Cbx_venda.enabled := false;
if Cbx_outras.Checked = true then

if Cbx_outras.Checked = true then
Cbx_servico.enabled := false;

if Cbx_outras.Checked = false then
Cbx_venda.enabled := true;
if Cbx_outras.Checked = false then

if Cbx_outras.Checked = false then
Cbx_servico.enabled := true;

if Cbx_outras.Checked = false then
Edt_aliq.text := '0';
if Cbx_outras.Checked = false then
Edt_aliq_final.text := '0';

if Cbx_outras.Checked = false then
edt_base_bruta.text := '0';
if Cbx_outras.Checked = false then
Edt_base.text := '0';
if Cbx_outras.Checked = false then
Edt_resultado.text :='0';
end;

procedure TFrm_csll.Cbx_servicoClick(Sender: TObject);
//configurando o checkbox dos serviços
begin
if Cbx_servico.Checked = true then
Cbx_venda.enabled := false;
if Cbx_servico.Checked = true then

if Cbx_servico.Checked = true then
Cbx_outras.enabled := false;

if Cbx_servico.Checked = true then
btn_calcu.enabled := true;
if Cbx_servico.Checked = false then
btn_calcu.enabled := false;

if Cbx_servico.Checked = false then
Cbx_venda.enabled := true;
if Cbx_servico.Checked = false then

if Cbx_servico.Checked = false then
Cbx_outras.enabled := true;

if Cbx_servico.Checked = true then
Edt_aliq.text := '32';
if Cbx_servico.Checked = true then
Edt_aliq_final.text := '9';

if Cbx_servico.Checked = false then
Edt_aliq.text := '0';
if Cbx_servico.Checked = false then
Edt_aliq_final.text := '0';

if Cbx_servico.Checked = false then
edt_base_bruta.text := '0';
if Cbx_servico.Checked = false then
Edt_base.text := '0';

if Cbx_servico.Checked = false then
Edt_resultado.text :='0';
end;

procedure TFrm_csll.Cbx_vendaClick(Sender: TObject);
//configurando o checkbox das vendas
begin
if Cbx_venda.Checked = true then
Cbx_servico.enabled := false;


if Cbx_venda.Checked = true then
Cbx_outras.enabled := false;

if Cbx_venda.Checked = true then
btn_calcu.enabled := true;
if Cbx_venda.Checked = false then
btn_calcu.enabled := false;

if Cbx_venda.Checked = false then
Cbx_servico.enabled := true;

if Cbx_venda.Checked = false then
Cbx_outras.enabled := true;

if Cbx_venda.Checked = true then
Edt_aliq.text := '12';
if Cbx_venda.Checked = true then
Edt_aliq_final.text := '9';

if Cbx_venda.Checked = false then
Edt_aliq.text := '0';
if Cbx_venda.Checked = false then
Edt_aliq_final.text := '0';

if Cbx_venda.Checked = false then
edt_base_bruta.text := '0';
if Cbx_venda.Checked = false then
Edt_base.text := '0';

if Cbx_venda.Checked = false then
Edt_resultado.text :='0';

end;

procedure TFrm_csll.Edt_aliqExit(Sender: TObject);
begin
//configurando proteção para que o txt edt_aliq não fique vazio
begin
if (Edt_aliq.text='') then
begin
showmessage('Deve ser inserido uma alíquota de CSLL');
Edt_aliq.setfocus;
Edt_aliq.text := ('0');
end;
end;
end;

procedure TFrm_csll.Edt_aliqKeyPress(Sender: TObject; var Key: Char);
//proteção para deixar preencher apenas números no tedit edt_aliq
begin
if not (Key in ['0'..'9' , ',' , #8]) then Key := #0;
end;

procedure TFrm_csll.Edt_aliq_finalExit(Sender: TObject);
begin
//configurando proteção para que o txt edt_aliq_final não fique vazio
begin
if (Edt_aliq_final.text='') then
begin
showmessage('Deve ser inserido uma alíquota de CSLL');
Edt_aliq_final.setfocus;
Edt_aliq_final.text := ('0');
end;
end;
end;

procedure TFrm_csll.Edt_aliq_finalKeyPress(Sender: TObject; var Key: Char);
//proteção para deixar preencher apenas números no tedit edt_aliq_final
begin
if not (Key in ['0'..'9' , ',' , #8]) then Key := #0;
end;

procedure TFrm_csll.Edt_baseKeyPress(Sender: TObject; var Key: Char);
//proteção para deixar preencher apenas números no tedit edt_base
begin
if not (Key in ['0'..'9' , ',' , #8]) then Key := #0;
end;

procedure TFrm_csll.edt_base_brutaExit(Sender: TObject);
begin
//configurando proteção para que o txt edt_base_bruta não fique vazio
begin
if (edt_base_bruta.text='') then
begin
showmessage('Deve ser inserido uma base de CSLL');
edt_base_bruta.setfocus;
edt_base_bruta.text := ('0');
end;
end;
end;

procedure TFrm_csll.edt_base_brutaKeyPress(Sender: TObject; var Key: Char);
//proteção para deixar preencher apenas números no tedit edt_base_bruta
begin
if not (Key in ['0'..'9' , ',' , #8]) then Key := #0;
end;

procedure TFrm_csll.outras;
//configurando a procedure para csll outras
begin
 if Cbx_outras.checked = true then
base_bruta := strtofloat (edt_base_bruta.text);
base := strtofloat (edt_base.text);
aliquota := strtofloat (edt_aliq.text);
aliquota_final := strtofloat (edt_aliq_final.text);


base := ( base_bruta * aliquota/100);
Edt_base.text := floattostr (base);
resultado_final := base * aliquota_final/100;

Edt_resultado.text := floattostr (resultado_final);
Edt_resultado.text := formatfloat ('0,.00', resultado_final);
end;

procedure TFrm_csll.servico;
//configurando a csll pros servicos
begin
 if Cbx_servico.checked = true then
base_bruta := strtofloat (edt_base_bruta.text);
base := strtofloat (edt_base.text);
aliquota := strtofloat (edt_aliq.text);
aliquota_final := strtofloat (edt_aliq_final.text);


base := ( base_bruta * aliquota/100);
Edt_base.text := floattostr (base);
resultado_final := base * aliquota_final/100;

Edt_resultado.text := floattostr (resultado_final);
Edt_resultado.text := formatfloat ('0,.00', resultado_final);
end;

procedure TFrm_csll.SpeedButton1Click(Sender: TObject);
//configurando botão para abrir o site do ajuda, deve ser declarado na user: ShellAPI;

begin
 ShellExecute(Handle,'open','https://ajuda.alterdata.com.br/fiscalbase/como-cadastrar-as-bases-de-irpj-e-csll-77437445.html', '',nil,0);
end;

procedure TFrm_csll.venda;
//configurando a csll para as vendas
begin
 if Cbx_venda.checked = true then
base_bruta := strtofloat (edt_base_bruta.text);
base := strtofloat (edt_base.text);
aliquota := strtofloat (edt_aliq.text);
aliquota_final := strtofloat (edt_aliq_final.text);


base := ( base_bruta * aliquota/100);
Edt_base.text := floattostr (base);
resultado_final := base * aliquota_final/100;

Edt_resultado.text := floattostr (resultado_final);
Edt_resultado.text := formatfloat ('0,.00', resultado_final);

end;

end.
