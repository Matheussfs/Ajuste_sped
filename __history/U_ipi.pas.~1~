unit U_ipi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tfrm_IPI = class(TForm)
    edt_base_ipi: TEdit;
    edt_aliq_ipi: TEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    Btn_calc_ipi: TButton;
    Btn_clear_ipi: TButton;
    Label1: TLabel;
    edt_total_ipi: TEdit;
    procedure Btn_calc_ipiClick(Sender: TObject);
    procedure Btn_clear_ipiClick(Sender: TObject);
    procedure edt_base_ipiKeyPress(Sender: TObject; var Key: Char);
    procedure edt_aliq_ipiKeyPress(Sender: TObject; var Key: Char);
    procedure edt_aliq_ipiChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_IPI: Tfrm_IPI;

implementation

{$R *.dfm}

procedure Tfrm_IPI.Btn_calc_ipiClick(Sender: TObject);
var
//variáveis numéricas
  base_ipi: real;
  aliq_ipi: real;
  resultado: real;
begin
base_ipi := strtofloat (edt_base_ipi.text);
   aliq_ipi := strtofloat (edt_aliq_ipi.text);
    resultado :=  base_ipi * aliq_ipi/100;
     edt_total_ipi.text := floattostr (resultado);
      edt_total_ipi.text := FormatFloat(',.00', resultado);
end;

procedure Tfrm_IPI.Btn_clear_ipiClick(Sender: TObject);
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

procedure Tfrm_IPI.edt_aliq_ipiKeyPress(Sender: TObject; var Key: Char);
begin
if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
 key := #0;
end;

procedure Tfrm_IPI.edt_base_ipiKeyPress(Sender: TObject; var Key: Char);
begin
 if not (Key in ['0'..'9' , ',' , #8]) then Key := #0;
end;

end.
