unit U_tela;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    Pnl_topo: TPanel;
    Timer1: TTimer;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel1: TPanel;
    btn_icms: TSpeedButton;
    Label1: TLabel;
    Btn_icms_st: TSpeedButton;
    Label2: TLabel;
    Btn_ipi: TSpeedButton;
    btn_cofins: TSpeedButton;
    Label3: TLabel;
    btn_pis: TSpeedButton;
    Label5: TLabel;
    Btn_difal: TSpeedButton;
    Label4: TLabel;
    btn_irpj: TSpeedButton;
    Label7: TLabel;
    Btn_csll: TSpeedButton;
    Label8: TLabel;
    Btn_retencoes: TSpeedButton;
    Label9: TLabel;
    Label6: TLabel;
    SpeedButton4: TSpeedButton;
    procedure btn_pisClick(Sender: TObject);
    procedure btn_cofinsClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btn_icmsClick(Sender: TObject);
    procedure Btn_icms_stClick(Sender: TObject);
    procedure Btn_ipiClick(Sender: TObject);
    procedure Btn_difalClick(Sender: TObject);
    procedure btn_irpjClick(Sender: TObject);
    procedure Btn_csllClick(Sender: TObject);
    procedure Btn_retencoesClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses U_cofins, U_pis, U_icms, U_csll, U_difal, U_icms_st, U_ipi, U_irpj,
  U_retencoes, U_tela_reten��es, U_Dime, U_ajuste_sped;

procedure TForm1.btn_cofinsClick(Sender: TObject);
begin
try
frm_cofins := tfrm_cofins.create (self);
frm_cofins.showmodal;
finally

end;
end;

procedure TForm1.Btn_csllClick(Sender: TObject);
begin
try
frm_csll := tfrm_csll.create(self);
frm_csll.showmodal;
finally

end;
end;

procedure TForm1.Btn_difalClick(Sender: TObject);
begin
try
frm_difal := tfrm_difal.create(self);
frm_difal.showmodal;
finally

end;
end;

procedure TForm1.btn_icmsClick(Sender: TObject);
begin
Try
  frm_icms := tfrm_icms.create(self);
  frm_icms.showmodal;

Finally

End;
end;

procedure TForm1.Btn_icms_stClick(Sender: TObject);
begin
try
frm_icms_st := tfrm_icms_st.create(self);
frm_icms_st.showmodal;
finally

end;
end;

procedure TForm1.Btn_ipiClick(Sender: TObject);
begin
try
frm_ipi := tfrm_ipi.create(self);
frm_ipi.showmodal;
finally

end;
end;

procedure TForm1.btn_irpjClick(Sender: TObject);
begin
try
frm_irpj := tfrm_irpj.create(self);
frm_irpj.showmodal;
finally

end;
end;

procedure TForm1.btn_pisClick(Sender: TObject);
begin
try
frm_pis := tfrm_pis.create(self);
frm_pis.showmodal;
finally

end;
end;

procedure TForm1.Btn_retencoesClick(Sender: TObject);
begin
try
Frm_retencoes_tela := tFrm_retencoes_tela.create(self);
Frm_retencoes_tela.showmodal;
finally

end;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
ShowMessage
('Este aplicativo foi construido para ajudar o suporte a realizar c�lculos de alguns dos impostos mais comuns do nosso dia a dia! Em caso de d�vidas ou sugest�es de melhoria, procurem pelo MatheusFs.sup.pack no Googlechat.');
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
Frm_dime := tFrm_dime.create(self);
Frm_dime.showmodal;
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
  Frm_ajuste_sped := tFrm_ajuste_sped.create(self);
  Frm_ajuste_sped.showmodal;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  StatusBar1.panels[0].text := 'Data: ' + FormatDateTime('dd/mm/yyyy', now);
  StatusBar1.panels[1].text := 'Hora: ' + FormatDateTime('hh:mm:ss', now);
end;

end.
