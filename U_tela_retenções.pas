unit U_tela_retenções;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrm_retencoes_tela = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_retencoes_tela: TFrm_retencoes_tela;

implementation

{$R *.dfm}

uses U_retencoes, U_csrf;

procedure TFrm_retencoes_tela.Button1Click(Sender: TObject);
begin
try
Frm_IRRF := tFrm_IRRF.create(self);
Frm_IRRF.showmodal;
finally

end;
end;

procedure TFrm_retencoes_tela.Button2Click(Sender: TObject);
begin
try
Frm_csrf := tFrm_csrf.create(self);
Frm_csrf.showmodal;
finally

end;
end;

end.
