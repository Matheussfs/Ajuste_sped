unit U_interestadual;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrm_interestadual = class(TForm)
    edt_base_inter: TEdit;
    Cbx_origem: TComboBox;
    Cbx_destino: TComboBox;
    edt_icms_interestadual: TEdit;
    btn_int_icms: TButton;
    Btn_clear_icms_inte: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edt_resultado_inter: TEdit;
    Label5: TLabel;
    procedure Cbx_destinoChange(Sender: TObject);
    procedure edt_icms_interestadualKeyPress(Sender: TObject; var Key: Char);
    procedure btn_int_icmsClick(Sender: TObject);
    procedure Btn_clear_icms_inteClick(Sender: TObject);
    procedure edt_base_interKeyPress(Sender: TObject; var Key: Char);
    procedure edt_resultado_interChange(Sender: TObject);
    procedure edt_base_interExit(Sender: TObject);
    procedure edt_icms_interestadualExit(Sender: TObject);
  private
    { Private declarations }
  public
  base_icms_inter: real;
  aliq_icms_inter: real;
  resultado_inter: real;
    { Public declarations }
  end;

var
  Frm_interestadual: TFrm_interestadual;

implementation

{$R *.dfm}

procedure TFrm_interestadual.Btn_clear_icms_inteClick(Sender: TObject);
var y:integer;
begin
for y := 0 to    Frm_interestadual.ComponentCount-1 do
 if components[y] is tedit then
 begin
    tedit(components[y]).text := '';
   end;
   for y := 0 to  Frm_interestadual.ComponentCount-1 do
 if components[y] is TComboBox then
 begin
    TComboBOX(components[y]).text := '';
 end;
     btn_int_icms.Enabled := FALSE;
      Btn_clear_icms_inte.enabled := FALSE;

end;
procedure TFrm_interestadual.btn_int_icmsClick(Sender: TObject);
var
//variáveis numéricas
  base_icms_inter: real;
  aliq_icms_inter: real;
  resultado_inter: real;

begin


begin
    base_icms_inter:= strtofloat (edt_base_inter.text);
   aliq_icms_inter:= strtofloat (edt_icms_interestadual.text);
    resultado_inter:=  base_icms_inter * aliq_icms_inter/100;
   edt_resultado_inter.text := floattostr (resultado_inter);
   edt_resultado_inter.text := FormatFloat(',.00', resultado_inter);
end;
end;

procedure TFrm_interestadual.Cbx_destinoChange(Sender: TObject);
begin
  IF (Cbx_origem.text = 'AC') and (Cbx_destino.text = 'AC')
  or (Cbx_origem.text = 'PA') and (Cbx_destino.text = 'PA')
  or (Cbx_origem.text = 'ES') and (Cbx_destino.text = 'ES')
  or (Cbx_origem.text = 'GO') and (Cbx_destino.text = 'GO')
  or (Cbx_origem.text = 'MT') and (Cbx_destino.text = 'MT')
  or (Cbx_origem.text = 'RR') and (Cbx_destino.text = 'RR')
  or (Cbx_origem.text = 'MS') and (Cbx_destino.text = 'MS')then
  begin
    edt_icms_interestadual.text := '17';
    END
    else
  IF (Cbx_origem.text = 'CE') and (Cbx_destino.text = 'CE')
  or (Cbx_origem.text = 'AL') and (Cbx_destino.text = 'AL')
  OR (Cbx_origem.text = 'AP') and (Cbx_destino.text = 'AP')
  OR (Cbx_origem.text = 'BA') and (Cbx_destino.text = 'BA')
  OR (Cbx_origem.text = 'AM') and (Cbx_destino.text = 'AM')
  OR (Cbx_origem.text = 'DF') and (Cbx_destino.text = 'DF')
  OR (Cbx_origem.text = 'MA') and (Cbx_destino.text = 'MA')
  OR (Cbx_origem.text = 'RN') and (Cbx_destino.text = 'RN')
  OR (Cbx_origem.text = 'PI') and (Cbx_destino.text = 'PI')
  OR (Cbx_origem.text = 'SE') and (Cbx_destino.text = 'SE')
  OR (Cbx_origem.text = 'TO') and (Cbx_destino.text = 'TO')then
  begin
     edt_icms_interestadual.text := '18';
    end
    else
    begin
     edt_icms_interestadual.text := '12';
     end;
       btn_int_icms.Enabled := TRUE;
      Btn_clear_icms_inte.enabled := TRUE;
  end;

procedure TFrm_interestadual.edt_base_interExit(Sender: TObject);
begin
if (edt_base_inter.text='') then
begin
showmessage('Deve ser inserido uma base de ICMS');
edt_base_inter.setfocus;
edt_base_inter.text := ('0');
end;
end;

procedure TFrm_interestadual.edt_base_interKeyPress(Sender: TObject;
  var Key: Char);
begin
     if not (Key in ['0'..'9' , ',' , #8]) then Key := #0;
end;

procedure TFrm_interestadual.edt_icms_interestadualExit(Sender: TObject);
begin
if (edt_icms_interestadual.text='') then
begin
showmessage('Deve ser inserido uma alíquota de ICMS');
edt_icms_interestadual.setfocus;
edt_icms_interestadual.text := ('0');
end;
end;

procedure TFrm_interestadual.edt_icms_interestadualKeyPress(Sender: TObject;
  var Key: Char);
begin
     if not (Key in ['0'..'9' , ',' , #8]) then Key := #0;
end;

procedure TFrm_interestadual.edt_resultado_interChange(Sender: TObject);
var   resultado_inter:integer;
begin


end;

end.
