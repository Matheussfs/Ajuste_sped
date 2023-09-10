unit U_memoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrm_memoria = class(TForm)
    Lb_memoria: TLabel;
    Memoriacalc: TLabel;
    procedure MemoriacalcClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_memoria: TFrm_memoria;

implementation

{$R *.dfm}

procedure TFrm_memoria.MemoriacalcClick(Sender: TObject);
begin
frm_memoria.Memoriacalc.Caption
end;

end.
