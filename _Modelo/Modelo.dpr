program Modelo;

uses
  Forms,
  uDM_Conexao in 'uDM_Conexao.pas' {dm_Conexao: TDataModule},
  uFrmPrincipal in 'uFrmPrincipal.pas' {frmPrincipal},
  uConstantes in 'Classes\uConstantes.pas',
  Form_Modelo in '..\Repositorio\Formulario Base\Form_Modelo.pas' {frmForm_Modelo},
  uEnumerados in 'Classes\uEnumerados.pas',
  sFuncoes in '..\Repositorio\Classes\sFuncoes.pas',
  sException in '..\Repositorio\Classes\sException.pas',
  TratamentoErro in '..\Repositorio\Classes\TratamentoErro.pas',
  uEmpresaCorrente in 'Classes\uEmpresaCorrente.pas',
  uSistema in 'Classes\uSistema.pas',
  uFrmPesquisar in '..\Repositorio\Formulario Base\uFrmPesquisar.pas' {frmPesquisar};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Modelo de Sistema';
  Application.CreateForm(Tdm_Conexao, dm_Conexao);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;

end.
