unit U_irpj;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, ShellAPI, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFrm_irpj = class(TForm)
    Panel1: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edt_base_adicional: TEdit;
    Edt_aliq_adicional: TEdit;
    Edt_total_adicional: TEdit;
    Panel2: TPanel;
    Cbx_venda: TCheckBox;
    Cbx_servico: TCheckBox;
    Cbx_gasolina: TCheckBox;
    Cbx_outras: TCheckBox;
    Cbx_adicional: TCheckBox;
    Cbx_adc_mensal: TCheckBox;
    Panel3: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Btn_calcu: TButton;
    Button3: TButton;
    Edt_resultado: TEdit;
    Edt_final_ad: TEdit;
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edt_base_bruta: TEdit;
    Edt_aliq: TEdit;
    Edt_base: TEdit;
    Edt_aliq_final: TEdit;
    btn_ajuda2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    procedure Cbx_vendaClick(Sender: TObject);
    procedure Cbx_servicoClick(Sender: TObject);
    procedure Cbx_gasolinaClick(Sender: TObject);
    procedure Cbx_outrasClick(Sender: TObject);
    procedure edt_base_brutaExit(Sender: TObject);
    procedure Edt_aliqExit(Sender: TObject);
    procedure Edt_aliq_finalExit(Sender: TObject);
    procedure Edt_base_adicionalExit(Sender: TObject);
    procedure edt_base_brutaKeyPress(Sender: TObject; var Key: Char);
    procedure Edt_base_adicionalKeyPress(Sender: TObject; var Key: Char);
    procedure Edt_aliqKeyPress(Sender: TObject; var Key: Char);
    procedure Edt_aliq_finalKeyPress(Sender: TObject; var Key: Char);
    procedure Btn_editarClick(Sender: TObject);
    procedure Btn_calcuClick(Sender: TObject);
    procedure Cbx_adicionalClick(Sender: TObject);
    procedure Cbx_adc_mensalClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btn_ajuda2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
  procedure venda;
  procedure servico;
    procedure gasolina;
    procedure outras;
    procedure adicional;
    procedure adicional_mensal;
  var resultado,aliquota, aliquota_final, base,
resultado_final, base_bruta, base_adicional,
aliq_adicional, resultado_adicional, total_com_adicional, fim :real;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_irpj: TFrm_irpj;

implementation

{$R *.dfm}

procedure TFrm_irpj.Btn_editarClick(Sender: TObject);
begin
Edt_base_adicional.enabled  :=true;

end;

procedure TFrm_irpj.Button3Click(Sender: TObject);
begin
//configurando botão de limpar
var p:integer;
begin
for p := 0 to   Frm_irpj.ComponentCount-1 do
 if components[p] is tedit then
 begin
    tedit(components[p]).text := '0';
  end;
  begin
for p := 0 to   Frm_irpj.ComponentCount-1 do
 if components[p] is tcheckbox then
 begin
    tcheckbox(components[p]).checked := false;
 end;
  end;
end;
end;

procedure TFrm_irpj.adicional;
begin
//configurando a procedure do adicional trimestral para as vendas
if Cbx_adicional.checked and Cbx_venda.Checked = true then

base_bruta := strtofloat (edt_base_bruta.text);
base := strtofloat (edt_base.text);
aliquota := strtofloat (edt_aliq.text);
aliquota_final := strtofloat (edt_aliq_final.text);


base := ( base_bruta * aliquota/100);
Edt_base.text := floattostr (base);
resultado_final := base * aliquota_final/100;

Edt_resultado.text := floattostr (resultado_final);

base_bruta := strtofloat (edt_base_bruta.text);
base := strtofloat (edt_base.text);
aliquota := strtofloat (edt_aliq.text);
aliquota_final := strtofloat (edt_aliq_final.text);
resultado_final := base * aliquota_final/100;
base := ( base_bruta * aliquota/100);

if base < (60000) then
ShowMessage(' Não haverá adicional de IR, pois a base do imposto é menor que 60 Mil mensais');
if base < (60000) then
Edt_aliq_adicional.visible := false;
if base < (60000) then
Edt_total_adicional.visible :=false;
if base < (60000) then
Edt_final_ad.visible := false;
if  base < (60000) then
Edt_base_adicional.visible := false;
if  base > (60000) then
Edt_base_adicional.visible := true;
if  base > (60000) then
Edt_aliq_adicional.visible := true;
if  base > (60000) then
Edt_total_adicional.visible := true;
if  base > (60000) then
Edt_final_ad.visible := true;

if base < (60000) then
Label7.visible :=false;

if base < (60000) then
Label5.visible :=false ;

if base < (60000) then
Label6.visible :=false;

if base < (60000) then
Label11.visible :=false ;

if base < (60000) then
Label10.visible :=false ;

if base < (60000) then
btn_ajuda2.visible :=false;

if base > (60000) then
Label7.visible :=true;

if base > (60000) then
Label5.visible :=true ;

if base > (60000) then
Label6.visible :=true;

if base > (60000) then
Label11.visible :=true ;

if base > (60000) then
Label10.visible :=true ;

if base > (60000) then
btn_ajuda2.visible :=true;

if  base > (60000) then

resultado_final := strtofloat (Edt_resultado.text);
base_adicional := strtofloat (Edt_base_adicional.text);
aliq_adicional := strtofloat ('10');
base_adicional := ( base - 60000);
Edt_base_adicional.text := floattostr (base_adicional);

Edt_total_adicional.text := floattostr(base_adicional * 10/100);
resultado_adicional := strtofloat (Edt_total_adicional.text);


Edt_final_ad.text := floattostr
(strtofloat(Edt_resultado.text) + strtofloat(Edt_total_adicional.text));
fim := strtofloat (Edt_final_ad.text);
Edt_final_ad.text := formatfloat ('0,.00', FIM);

//configurando a procedure do adicional trimestral para os serviços
if Cbx_adicional.checked and Cbx_servico.Checked = true then

base_bruta := strtofloat (edt_base_bruta.text);
base := strtofloat (edt_base.text);
aliquota := strtofloat (edt_aliq.text);
aliquota_final := strtofloat (edt_aliq_final.text);

base := ( base_bruta * aliquota/100);
Edt_base.text := floattostr (base);
resultado_final := base * aliquota_final/100;

Edt_resultado.text := floattostr (resultado_final);

base_bruta := strtofloat (edt_base_bruta.text);
base := strtofloat (edt_base.text);
aliquota := strtofloat (edt_aliq.text);
aliquota_final := strtofloat (edt_aliq_final.text);
resultado_final := base * aliquota_final/100;
base := ( base_bruta * aliquota/100);


resultado_final := strtofloat (Edt_resultado.text);
base_adicional := strtofloat (Edt_base_adicional.text);
aliq_adicional := strtofloat ('10');
base_adicional := ( base - 60000);
Edt_base_adicional.text := floattostr (base_adicional);


Edt_total_adicional.text := floattostr(base_adicional * 10/100);
resultado_adicional := strtofloat (Edt_total_adicional.text);

Edt_final_ad.text := floattostr
(strtofloat(Edt_resultado.text) + strtofloat(Edt_total_adicional.text));
fim := strtofloat (Edt_final_ad.text);
Edt_final_ad.text := formatfloat ('0,.00', FIM);

end;


procedure TFrm_irpj.adicional_mensal;
//configurando a procedure do adicional mensal para as vendas
begin
if Cbx_adc_mensal.checked and Cbx_venda.Checked = true then

base_bruta := strtofloat (edt_base_bruta.text);
base := strtofloat (edt_base.text);
aliquota := strtofloat (edt_aliq.text);
aliquota_final := strtofloat (edt_aliq_final.text);


base := ( base_bruta * aliquota/100);
Edt_base.text := floattostr (base);
resultado_final := base * aliquota_final/100;

Edt_resultado.text := floattostr (resultado_final);

base_bruta := strtofloat (edt_base_bruta.text);
base := strtofloat (edt_base.text);
aliquota := strtofloat (edt_aliq.text);
aliquota_final := strtofloat (edt_aliq_final.text);
resultado_final := base * aliquota_final/100;
base := ( base_bruta * aliquota/100);

if base < (20000) then
ShowMessage(' Não haverá adicional de IR, pois a base do imposto é menor que 20 Mil mensais');
 if base < (20000) then
Edt_base_adicional.visible := false;
if base < (20000) then
Edt_aliq_adicional.visible := false;
if base < (20000) then
Edt_total_adicional.visible :=false;
if base < (20000) then
Edt_final_ad.visible := false;
if  base > (20000) then
Edt_base_adicional.visible := true;
if  base > (20000) then
Edt_aliq_adicional.visible := true;
if  base > (20000) then
Edt_total_adicional.visible := true;
if  base > (20000) then
Edt_final_ad.visible := true;

if base < (20000) then
Label7.visible :=false;

if base < (20000) then
Label5.visible :=false ;

if base < (20000) then
Label6.visible :=false;

if base < (20000) then
Label11.visible :=false ;

if base < (20000) then
Label10.visible :=false ;

if base < (20000) then
btn_ajuda2.visible :=false;

if base > (20000) then
Label7.visible :=true;

if base > (20000) then
Label5.visible :=true ;

if base > (20000) then
Label6.visible :=true;

if base > (20000) then
Label11.visible :=true ;

if base > (20000) then
Label10.visible :=true ;

if base > (20000) then
btn_ajuda2.visible :=true;





if  base > (20000) then
resultado_final := strtofloat (Edt_resultado.text);
base_adicional := strtofloat (Edt_base_adicional.text);
aliq_adicional := strtofloat ('10');
base_adicional := ( base - 20000);
Edt_base_adicional.text := floattostr (base_adicional);



Edt_total_adicional.text := floattostr(base_adicional * 10/100);
resultado_adicional := strtofloat (Edt_total_adicional.text);



Edt_final_ad.text := floattostr
(strtofloat(Edt_resultado.text) + strtofloat(Edt_total_adicional.text));
fim := strtofloat (Edt_final_ad.text);
Edt_final_ad.text := formatfloat ('0,.00', FIM);



//configurando a procedure do adicional mensal para os serviços

if Cbx_adc_mensal.checked and Cbx_servico.Checked = true then

base_bruta := strtofloat (edt_base_bruta.text);
base := strtofloat (edt_base.text);
aliquota := strtofloat (edt_aliq.text);
aliquota_final := strtofloat (edt_aliq_final.text);


base := ( base_bruta * aliquota/100);
Edt_base.text := floattostr (base);
resultado_final := base * aliquota_final/100;

Edt_resultado.text := floattostr (resultado_final);


base_bruta := strtofloat (edt_base_bruta.text);
base := strtofloat (edt_base.text);
aliquota := strtofloat (edt_aliq.text);
aliquota_final := strtofloat (edt_aliq_final.text);
resultado_final := base * aliquota_final/100;
base := ( base_bruta * aliquota/100);

resultado_final := strtofloat (Edt_resultado.text);
base_adicional := strtofloat (Edt_base_adicional.text);
aliq_adicional := strtofloat ('10');
base_adicional := ( base - 20000);
Edt_base_adicional.text := floattostr (base_adicional);


Edt_total_adicional.text := floattostr(base_adicional * 10/100);
resultado_adicional := strtofloat (Edt_total_adicional.text);

Edt_final_ad.text := floattostr
(strtofloat(Edt_resultado.text) + strtofloat(Edt_total_adicional.text));
fim := strtofloat (Edt_final_ad.text);
Edt_final_ad.text := formatfloat ('0,.00', FIM);

end;

procedure TFrm_irpj.Btn_calcuClick(Sender: TObject);

//chamando as procedures para calculo do irpj e adicional conforme checkbox
begin
if Cbx_adc_mensal.Checked then
begin
adicional_mensal;
end;

if Cbx_adicional.Checked then
begin
adicional;
end;

if Cbx_servico.Checked then
begin
servico;
end;

if Cbx_venda.Checked then
begin
venda;
end;

if Cbx_gasolina.Checked then
begin
gasolina;
end;

if Cbx_outras.Checked then
begin
outras;
end;

end;



procedure TFrm_irpj.Cbx_adc_mensalClick(Sender: TObject);
//configurando checkbox do adicional mensal
begin

if Cbx_adc_mensal.checked  = true then
btn_ajuda2.visible := true;
if Cbx_adc_mensal.checked  = false then
btn_ajuda2.visible := false;

if Cbx_adc_mensal.checked = true then
 Cbx_adicional.enabled := false;
 if Cbx_adc_mensal.checked = false then
 Cbx_adicional.enabled := true;
 if Cbx_adc_mensal.checked  = true then
Edt_aliq_adicional.text := '10';

 if Cbx_adc_mensal.checked  = false then
Edt_base_adicional.text :=('0');
if Cbx_adc_mensal.checked  = false then
Edt_total_adicional.text :=('0');
if Cbx_adc_mensal.checked  = false then
Edt_final_ad.text :=('0');

if Cbx_adc_mensal.checked  = true then
Label5.Visible := true;
if Cbx_adc_mensal.checked  = true then
Edt_base_adicional.Visible := true;
if Cbx_adc_mensal.checked  = true then
Label6.Visible := true;
if Cbx_adc_mensal.checked  = true then
Edt_aliq_adicional.Visible := true;
if Cbx_adc_mensal.checked  = true then
Label7.Visible := true;
if Cbx_adc_mensal.checked  = true then
Edt_total_adicional.Visible := true;
if Cbx_adc_mensal.checked  = true then
Label11.Visible := true;
if Cbx_adc_mensal.checked  = true then
Edt_final_ad.Visible := true;
if Cbx_adc_mensal.checked  = true then
Label10.Visible := true;


if Cbx_adc_mensal.checked  = false then
Label5.Visible := false;
if Cbx_adc_mensal.checked  = false then
Edt_base_adicional.Visible := false;
if Cbx_adc_mensal.checked  = false then
Label6.Visible := false;
if Cbx_adc_mensal.checked  = false then
Edt_aliq_adicional.Visible := false;
if Cbx_adc_mensal.checked  = false then
Label7.Visible := false;
if Cbx_adc_mensal.checked  = false then
Edt_total_adicional.Visible := false;
if Cbx_adc_mensal.checked  = false then
Label11.Visible := false;

if Cbx_adc_mensal.checked  = false then
Edt_final_ad.Visible := false;

if Cbx_adc_mensal.checked  = false then
Label10.Visible := false;

end;

procedure TFrm_irpj.Cbx_adicionalClick(Sender: TObject);
//configurando checkbox do adicional trimestral
begin
if Cbx_adicional.checked  = true then
Cbx_adc_mensal.Enabled := false;

if Cbx_adicional.checked  = true then
btn_ajuda2.visible := true;
if Cbx_adicional.checked  = true then
btn_ajuda2.enabled := true;
if Cbx_adicional.checked  = false then
btn_ajuda2.visible := false;

if Cbx_adicional.checked  = false then
Cbx_adc_mensal.Enabled := true;

if Cbx_adicional.checked  = true then
Edt_aliq_adicional.text := '10';


if Cbx_adicional.checked  = false then
Edt_base_adicional.text :=('0');
if Cbx_adicional.checked  = false then
Edt_total_adicional.text :=('0');
if Cbx_adicional.checked  = false then
Edt_final_ad.text :=('0');

if Cbx_adicional.checked  = true then
Label5.Visible := true;
if Cbx_adicional.checked  = true then
Edt_base_adicional.Visible := true;
if Cbx_adicional.checked  = true then
Label6.Visible := true;
if Cbx_adicional.checked  = true then
Edt_aliq_adicional.Visible := true;
if Cbx_adicional.checked  = true then
Label7.Visible := true;
if Cbx_adicional.checked  = true then
Edt_total_adicional.Visible := true;
if Cbx_adicional.checked  = true then
Label11.Visible := true;
if Cbx_adicional.checked  = true then
Edt_final_ad.Visible := true;
if Cbx_adicional.checked  = true then
Label10.Visible := true;


if Cbx_adicional.checked  = false then
Label5.Visible := false;
if Cbx_adicional.checked  = false then
Edt_base_adicional.Visible := false;
if Cbx_adicional.checked  = false then
Label6.Visible := false;
if Cbx_adicional.checked  = false then
Edt_aliq_adicional.Visible := false;
if Cbx_adicional.checked  = false then
Label7.Visible := false;
if Cbx_adicional.checked  = false then
Edt_total_adicional.Visible := false;
if Cbx_adicional.checked  = false then
Label11.Visible := false;

if Cbx_adicional.checked  = false then
Edt_final_ad.Visible := false;

if Cbx_adicional.checked  = false then
Label10.Visible := false;



end;

procedure TFrm_irpj.Cbx_gasolinaClick(Sender: TObject);
//configurando checkbox do irpj em postos de gasolina
begin
if Cbx_gasolina.Checked = true then
Cbx_venda.enabled := false;
if Cbx_gasolina.Checked = true then
Cbx_servico.enabled := false;
if Cbx_gasolina.Checked = true then
Cbx_outras.enabled := false;



if Cbx_gasolina.Checked = false then
Cbx_venda.enabled := true;
if Cbx_gasolina.Checked = false then
Cbx_servico.enabled := true;
if Cbx_gasolina.Checked = false then
Cbx_outras.enabled := true;

if Cbx_gasolina.Checked = true then
Edt_aliq.text := '15';
if Cbx_gasolina.Checked = true then
Edt_aliq_final.text := '1,6';

if Cbx_gasolina.Checked = false then
Edt_aliq.text := '0';
if Cbx_gasolina.Checked = false then
Edt_aliq_final.text := '0';

if Cbx_gasolina.Checked = false then
edt_base_bruta.text := '0';
if Cbx_gasolina.Checked = false then
Edt_base.text := '0';
if Cbx_gasolina.Checked = false then
Edt_final_ad.text := '0';
if Cbx_gasolina.Checked = false then
Edt_base_adicional.text := '0';
if Cbx_gasolina.Checked = false then
Edt_total_adicional.text :='0';
if Cbx_gasolina.Checked = false then
Edt_resultado.text :='0';
end;

procedure TFrm_irpj.Cbx_outrasClick(Sender: TObject);
//configurando o checkbox para outras alíquotas
begin
if Cbx_outras.Checked = true then
Edt_aliq.enabled := true;
if Cbx_outras.Checked = true then
Edt_aliq_final.enabled := true;


if Cbx_outras.Checked = false then
Edt_aliq.enabled := false;
if Cbx_outras.Checked = false then
Edt_aliq_final.enabled := false;

if Cbx_outras.Checked = true then
Cbx_venda.enabled := false;
if Cbx_outras.Checked = true then
Cbx_gasolina.enabled := false;
if Cbx_outras.Checked = true then
Cbx_servico.enabled := false;

if Cbx_outras.Checked = false then
Cbx_venda.enabled := true;
if Cbx_outras.Checked = false then
Cbx_gasolina.enabled := true;
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
Edt_final_ad.text := '0';
if Cbx_outras.Checked = false then
Edt_base_adicional.text := '0';
if Cbx_outras.Checked = false then
Edt_total_adicional.text :='0';
if Cbx_outras.Checked = false then
Edt_resultado.text :='0';
end;

procedure TFrm_irpj.Cbx_servicoClick(Sender: TObject);
//configurando o checkbox para os serviços
begin
if Cbx_servico.Checked = true then
Cbx_venda.enabled := false;
if Cbx_servico.Checked = true then
Cbx_gasolina.enabled := false;
if Cbx_servico.Checked = true then
Cbx_outras.enabled := false;


if Cbx_servico.Checked = false then
Cbx_venda.enabled := true;
if Cbx_servico.Checked = false then
Cbx_gasolina.enabled := true;
if Cbx_servico.Checked = false then
Cbx_outras.enabled := true;

if Cbx_servico.Checked = true then
Edt_aliq.text := '32';
if Cbx_servico.Checked = true then
Edt_aliq_final.text := '15';

if Cbx_servico.Checked = false then
Edt_aliq.text := '0';
if Cbx_servico.Checked = false then
Edt_aliq_final.text := '0';

if Cbx_servico.Checked = false then
edt_base_bruta.text := '0';
if Cbx_servico.Checked = false then
Edt_base.text := '0';
if Cbx_servico.Checked = false then
Edt_final_ad.text := '0';
if Cbx_servico.Checked = false then
Edt_base_adicional.text := '0';
if Cbx_servico.Checked = false then
Edt_total_adicional.text :='0';
if Cbx_servico.Checked = false then
Edt_resultado.text :='0';
end;

procedure TFrm_irpj.Cbx_vendaClick(Sender: TObject);
//configurando o checkbox para as vendas
begin
if Cbx_venda.Checked = true then
Cbx_servico.enabled := false;
if Cbx_venda.Checked = true then
Cbx_gasolina.enabled := false;
if Cbx_venda.Checked = true then
Cbx_outras.enabled := false;


if Cbx_venda.Checked = false then
Cbx_servico.enabled := true;
if Cbx_venda.Checked = false then
Cbx_gasolina.enabled := true;
if Cbx_venda.Checked = false then
Cbx_outras.enabled := true;

if Cbx_venda.Checked = true then
Edt_aliq.text := '8';
if Cbx_venda.Checked = true then
Edt_aliq_final.text := '15';

if Cbx_venda.Checked = false then
Edt_aliq.text := '0';
if Cbx_venda.Checked = false then
Edt_aliq_final.text := '0';

if Cbx_venda.Checked = false then
edt_base_bruta.text := '0';
if Cbx_venda.Checked = false then
Edt_base.text := '0';
if Cbx_venda.Checked = false then
Edt_final_ad.text := '0';
if Cbx_venda.Checked = false then
Edt_base_adicional.text := '0';
if Cbx_venda.Checked = false then
Edt_total_adicional.text :='0';
if Cbx_venda.Checked = false then
Edt_resultado.text :='0';

end;

procedure TFrm_irpj.Edt_base_adicionalExit(Sender: TObject);
//configurando proteção para que o txt Edt_base_adicional não fique vazio
begin
if (Edt_base_adicional.text='') then
begin
showmessage('Deve ser inserido uma base de adicional de IRPJ');
Edt_base_adicional.setfocus;
Edt_base_adicional.text := ('0');
end;
end;

procedure TFrm_irpj.Edt_base_adicionalKeyPress(Sender: TObject; var Key: Char);
//confuigurando o evento onkeypress para aceitar apenas números
begin
begin
if key = #13 then
  begin
    key:= #0;
    perform (WM_NEXTDLGCTL,0,0);
    end;
    begin
if not (Key in ['0'..'9' , ',' , #8]) then Key := #0;
  end;
end;
end;

procedure TFrm_irpj.Edt_aliqExit(Sender: TObject);
//configurando proteção para que o txt Edt_aliq não fique vazio
begin
if (Edt_aliq.text='') then
begin
showmessage('Deve ser inserido uma alíquota de IRPJ');
Edt_aliq.setfocus;
Edt_aliq.text := ('0');
end;

end;

procedure TFrm_irpj.Edt_aliqKeyPress(Sender: TObject; var Key: Char);
//confuigurando o evento onkeypress para aceitar apenas números
begin
begin
if key = #13 then
  begin
    key:= #0;
    perform (WM_NEXTDLGCTL,0,0);
    end;
    begin
if not (Key in ['0'..'9' , ',' , #8]) then Key := #0;
  end;
end;
end;

procedure TFrm_irpj.Edt_aliq_finalExit(Sender: TObject);
//configurando proteção para que o txt Edt_aliq_final não fique vazio
begin
if (Edt_aliq_final.text='') then
begin
showmessage('Deve ser inserido uma alíquota de IRPJ');
Edt_aliq_final.setfocus;
Edt_aliq_final.text := ('0');
end;
end;

procedure TFrm_irpj.Edt_aliq_finalKeyPress(Sender: TObject; var Key: Char);
//confuigurando o evento onkeypress para aceitar apenas números
begin
begin
if key = #13 then
  begin
    key:= #0;
    perform (WM_NEXTDLGCTL,0,0);
    end;
    begin
if not (Key in ['0'..'9' , ',' , #8]) then Key := #0;
  end;
end;
end;

procedure TFrm_irpj.edt_base_brutaExit(Sender: TObject);
//configurando proteção para que o txt edt_base_bruta não fique vazio
begin
if (edt_base_bruta.text='') then
begin
showmessage('Deve ser inserido uma base de IRPJ');
edt_base_bruta.setfocus;
edt_base_bruta.text := ('0');
end;
Btn_calcu.setfocus;
end;

procedure TFrm_irpj.edt_base_brutaKeyPress(Sender: TObject; var Key: Char);
//confuigurando o evento onkeypress para aceitar apenas números
begin
begin
if key = #13 then
  begin
    key:= #0;
    perform (WM_NEXTDLGCTL,0,0);
    end;
    begin
if not (Key in ['0'..'9' , ',' , #8]) then Key := #0;
  end;
end;
end;

procedure TFrm_irpj.gasolina;
//configurando o calculo do irpj para os postos de combustível
begin
if Cbx_gasolina.checked = true then
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

procedure TFrm_irpj.outras;
//configurando o calculo do irpj para os valores de outras alíquotas
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

procedure TFrm_irpj.servico;
//configurando o calculo do irpj para os valores de serviços
begin
 if  Cbx_servico.checked = true then
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


procedure TFrm_irpj.SpeedButton1Click(Sender: TObject);
begin
ShellExecute(Handle,'open','https://ajuda.alterdata.com.br/fiscalbase/como-cadastrar-as-bases-de-irpj-e-csll-77437445.html', '',nil,0);

end;

procedure TFrm_irpj.btn_ajuda2Click(Sender: TObject);
//configurando botão para abrir o site do ajuda, deve ser declarado na user: ShellAPI;

begin
 ShellExecute(Handle,'open','https://ajuda.alterdata.com.br/fiscalbase/como-calcular-o-adicional-de-ir-87732761.html', '',nil,0);

end;

procedure TFrm_irpj.venda;
//configurando o calculo do irpj para os valores de vendas
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
