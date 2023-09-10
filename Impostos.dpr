program Impostos;

uses
  Vcl.Forms,
  U_tela in 'U_tela.pas' {Form1},
  U_pis in 'U_pis.pas' {frm_pis},
  U_cofins in 'U_cofins.pas' {Frm_cofins},
  U_icms in 'U_icms.pas' {Frm_icms},
  U_icms_st in 'U_icms_st.pas' {frm_icms_st},
  U_ipi in 'U_ipi.pas' {frm_IPI},
  U_difal in 'U_difal.pas' {frm_difal},
  U_irpj in 'U_irpj.pas' {Frm_irpj},
  U_csll in 'U_csll.pas' {Frm_csll},
  U_retencoes in 'U_retencoes.pas' {Frm_IRRF},
  U_ICMSTELA in 'U_ICMSTELA.pas' {FRM_TELA_ICMS},
  U_Icms_St_Base in 'U_Icms_St_Base.pas' {FRM_BASE_ST},
  U_tela_reten��es in 'U_tela_reten��es.pas' {Frm_retencoes_tela},
  U_csrf in 'U_csrf.pas' {Frm_csrf},
  U_icms_in in 'U_icms_in.pas' {Icms_do_st},
  U_BI in 'U_BI.pas' {frm_bi},
  U_Dime in 'U_Dime.pas' {Frm_dime},
  U_ajuste_sped in 'U_ajuste_sped.pas' {Frm_ajuste_sped},
  U_pesquisa_empresa in 'U_pesquisa_empresa.pas' {Frm_pesquisa_empresa},
  U_configura_banco in 'U_configura_banco.pas' {Frm_conectar_banco};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.