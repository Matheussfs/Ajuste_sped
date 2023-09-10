unit U_icms;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrm_icms = class(TForm)
    LB_TELA_ICMS: TLabel;
    Btn_estadual: TButton;
    Btn_interestadual: TButton;
    procedure Btn_estadualClick(Sender: TObject);
    procedure Btn_interestadualClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_icms: TFrm_icms;

implementation

{$R *.dfm}

uses U_ICMSTELA, U_interestadual;

procedure TFrm_icms.Btn_estadualClick(Sender: TObject);
begin
  application.createform (TFRM_TELA_ICMS, frm_tela_icms);
  FRM_TELA_ICMS.borderstyle := bssingle;
  FRM_TELA_ICMS.showmodal;
end;

procedure TFrm_icms.Btn_interestadualClick(Sender: TObject);
begin
application.createform (TFrm_interestadual, Frm_interestadual);
  Frm_interestadual.borderstyle := bssingle;
  Frm_interestadual.showmodal;
end;

end.
