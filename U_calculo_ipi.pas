unit U_calculo_ipi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFRM_CALCULO_IPI = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    Btn_calc_ipi: TButton;
    Btn_clear_ipi: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRM_CALCULO_IPI: TFRM_CALCULO_IPI;

implementation

{$R *.dfm}

end.
