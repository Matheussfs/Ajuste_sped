unit U_Icms_St_Base;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFRM_BASE_ST = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit7: TEdit;
    Label7: TLabel;
    Button1: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit8: TEdit;
    Label8: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRM_BASE_ST: TFRM_BASE_ST;

implementation

{$R *.dfm}

uses U_ipi;

procedure TFRM_BASE_ST.Button1Click(Sender: TObject);
begin
frm_ipi := tfrm_ipi.create(self);
frm_ipi.showmodal;
end;

end.
