unit U_retencoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrm_IRRF = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edt_base_irrf: TEdit;
    Label2: TLabel;
    Edt_aliq_irrf: TEdit;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Edt_VALOR: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Edt_base_irrfKeyPress(Sender: TObject; var Key: Char);
    procedure Edt_aliq_irrfKeyPress(Sender: TObject; var Key: Char);
    procedure Edt_base_irrfExit(Sender: TObject);
    procedure Edt_aliq_irrfExit(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_IRRF: TFrm_IRRF;

implementation

{$R *.dfm}

procedure TFrm_IRRF.Button1Click(Sender: TObject);
var base, aliquota, valor: real;
begin
base := strtofloat (Edt_base_irrf.text);
aliquota := strtofloat ( edt_aliq_irrf.text);
valor := base * aliquota/100 ;
Edt_VALOR.text := floattostr(valor);
Edt_VALOR.text := FormatFloat('0,.00', valor);
end;

procedure TFrm_IRRF.Button2Click(Sender: TObject);
//configurando botão de limpar
var i:integer;
begin
 for i := 0 to    Frm_IRRF.ComponentCount-1 do
 if components[i] is tedit then
 begin
    tedit(components[i]).text := '0';
   end;
end;

procedure TFrm_IRRF.Edt_aliq_irrfExit(Sender: TObject);
//proteção para não deixar o edt nulo
begin
if (Edt_aliq_irrf.text='') then
begin
showmessage('Deve ser inserido uma alíquota de IRRF!');
Edt_aliq_irrf.setfocus;
Edt_aliq_irrf.text := ('0');
end;
end;

procedure TFrm_IRRF.Edt_aliq_irrfKeyPress(Sender: TObject; var Key: Char);
begin
//proteção para permitir escrever apenas números no tedit
if not (Key in ['0'..'9' , ',' , #8]) then Key := #0;
end;

procedure TFrm_IRRF.Edt_base_irrfExit(Sender: TObject);
//proteção para não deixar o edt nulo
begin
if (Edt_base_irrf.text='') then
begin
showmessage('Deve ser inserido uma base de IRRF!');
Edt_base_irrf.setfocus;
Edt_base_irrf.text := ('0');
end;
end;

procedure TFrm_IRRF.Edt_base_irrfKeyPress(Sender: TObject; var Key: Char);
begin
//proteção para permitir escrever apenas números no tedit
if not (Key in ['0'..'9' , ',' , #8]) then Key := #0;
end;

end.
