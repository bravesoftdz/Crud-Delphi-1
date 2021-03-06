unit uDM_Cidade;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Data.SqlExpr, uFrmPesquisaCidade, uDM_Conexao;

type
  Tdm_cidade = class(TDataModule)
    dst_CarregarCidade: TSQLDataSet;
    dst_CarregarCidadeID: TIntegerField;
    dst_CarregarCidadeNOME: TStringField;
  private
    { Private declarations }
  public
    function Pesquisar: Integer;
  end;

var
  dm_cidade: Tdm_cidade;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

function Tdm_cidade.Pesquisar: Integer;
var
  VPesquisa: TfrmPesquisarCidade;
begin
  VPesquisa := TfrmPesquisarCidade.Create(Self);
  try
    VPesquisa.ShowModal;

    Result := VPesquisa.Id;
  finally
    FreeAndNil(VPesquisa);
  end;
end;

end.
