unit U_icms_in;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TIcms_do_st = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    edt_base: TEdit;
    Edt_aliq: TEdit;
    Edt_total: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Btn_calc: TButton;
    Btn_clear: TButton;
    procedure Btn_calcClick(Sender: TObject);
    procedure edt_baseKeyPress(Sender: TObject; var Key: Char);
    procedure Edt_aliqKeyPress(Sender: TObject; var Key: Char);
    procedure edt_baseExit(Sender: TObject);
    procedure Edt_aliqExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Btn_clearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Icms_do_st: TIcms_do_st;

implementation

{$R *.dfm}

uses U_icms_st;

procedure TIcms_do_st.Btn_calcClick(Sender: TObject);
var base, aliquota, total:real;
begin
base := strtofloat (edt_base.text);
aliquota :=   strtofloat (Edt_aliq.text);
total := base * aliquota/100;
Edt_total.text := floattostr (total);
end;

procedure TIcms_do_st.Btn_clearClick(Sender: TObject);
var l:integer;
begin
 for l := 0 to  Icms_do_st.ComponentCount-1 do
 if components[l] is tedit then
 begin
    tedit(components[l]).text := '0';
 end;
end;

procedure TIcms_do_st.Edt_aliqExit(Sender: TObject);
begin
if (Edt_aliq.text='') then
begin
showmessage('Deve ser inserido uma alíquota de ICMS');
Edt_aliq.setfocus;
Edt_aliq.text := ('0');
end;
end;

procedure TIcms_do_st.Edt_aliqKeyPress(Sender: TObject; var Key: Char);
begin
 if not (Key in ['0'..'9' , ',' , #8]) then Key := #0;
end;

procedure TIcms_do_st.edt_baseExit(Sender: TObject);
begin
if (edt_base.text='') then
begin
showmessage('Deve ser inserido uma base de ICMS');
edt_base.setfocus;
edt_base.text := ('0');
end;
end;

procedure TIcms_do_st.edt_baseKeyPress(Sender: TObject; var Key: Char);
begin
 if not (Key in ['0'..'9' , ',' , #8]) then Key := #0;
end;

procedure TIcms_do_st.FormClose(Sender: TObject; var Action: TCloseAction);
begin
frm_icms_st.Edt_icms_total_normal.text :=Edt_total.text;
end;

end.
