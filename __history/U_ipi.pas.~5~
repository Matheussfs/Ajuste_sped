unit U_ipi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  Tfrm_IPI = class(TForm)
    Panel1: TPanel;
    edt_base_ipi: TEdit;
    edt_aliq_ipi: TEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    Panel2: TPanel;
    Label1: TLabel;
    Btn_calc_ipi: TButton;
    Btn_clear_ipi: TButton;
    edt_total_ipi: TEdit;
    procedure Btn_calc_ipiClick(Sender: TObject);
    procedure Btn_clear_ipiClick(Sender: TObject);
    procedure edt_base_ipiKeyPress(Sender: TObject; var Key: Char);
    procedure edt_aliq_ipiKeyPress(Sender: TObject; var Key: Char);
    procedure edt_aliq_ipiChange(Sender: TObject);
    procedure edt_aliq_ipiExit(Sender: TObject);
    procedure edt_base_ipiExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_IPI: Tfrm_IPI;

implementation

{$R *.dfm}

uses U_Icms_St_Base;

procedure Tfrm_IPI.Btn_calc_ipiClick(Sender: TObject);
var
//variáveis numéricas
  base_ipi: real;
  aliq_ipi: real;
  resultado: real;
begin
//configurando calculo de ipi
base_ipi := strtofloat (edt_base_ipi.text);
   aliq_ipi := strtofloat (edt_aliq_ipi.text);
    resultado :=  base_ipi * aliq_ipi/100;
     edt_total_ipi.text := floattostr (resultado);
      edt_total_ipi.text := FormatFloat(',.00', resultado);
end;

procedure Tfrm_IPI.Btn_clear_ipiClick(Sender: TObject);
//confiugurando botão de limpar
 var x:integer;
begin

begin
 for x := 0 to    frm_IPI.ComponentCount-1 do
 if components[x] is tedit then
 begin
    tedit(components[x]).text := '';
end;
Btn_calc_ipi.Enabled := false;
    Btn_clear_ipi.enabled := false;
end;
end;

procedure Tfrm_IPI.edt_aliq_ipiChange(Sender: TObject);
begin
Btn_calc_ipi.Enabled := True;
    Btn_clear_ipi.enabled := True;
end;

procedure Tfrm_IPI.edt_aliq_ipiExit(Sender: TObject);
begin
//configurando proteção para que o txt edt_aliq_ipi não fique vazio
begin
if (edt_aliq_ipi.text='') then
begin
showmessage('Deve ser inserido uma alíquota de IPI');
edt_aliq_ipi.setfocus;
edt_aliq_ipi.text := ('0');
end;
end;
end;

procedure Tfrm_IPI.edt_aliq_ipiKeyPress(Sender: TObject; var Key: Char);
//Proteção para permitir apenas números e vírgula no edt_aliq_ipi
begin
if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
 key := #0;
end;

procedure Tfrm_IPI.edt_base_ipiExit(Sender: TObject);
begin
//configurando proteção para que o txt edt_base_ipi não fique vazio
begin
if (edt_base_ipi.text='') then
begin
showmessage('Deve ser inserido uma base de IPI');
edt_base_ipi.setfocus;
edt_base_ipi.text := ('0');
end;
end;
end;

procedure Tfrm_IPI.edt_base_ipiKeyPress(Sender: TObject; var Key: Char);
//Proteção para permitir apenas números e vírgula no edt_base_ipi
begin
 if not (Key in ['0'..'9' , ',' , #8]) then Key := #0;
end;

procedure Tfrm_IPI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//FRM_BASE_ST.Edt_vl_ipi.text :=edt_total_ipi.text;
end;

end.
