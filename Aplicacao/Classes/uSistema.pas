unit uSistema;

interface

uses
  uEmpresaCorrente, System.SysUtils, Data.SqlExpr;

type
  TSistema = class
  private
    FEmpresaCorrente: TEmpresaCorrente;

    class var FInstance: TSistema;
  public
    constructor Create;
    destructor Destroy; override;

    class function GetInstance: TSistema;

    property EmpresaCorrente: TEmpresaCorrente read FEmpresaCorrente write FEmpresaCorrente;
  end;

implementation

{ TSistema }

constructor TSistema.Create;
begin
  Self.FEmpresaCorrente := TEmpresaCorrente.Create;
end;

destructor TSistema.Destroy;
begin
  FreeAndNil(Self.FEmpresaCorrente);

  inherited;
end;

class function TSistema.GetInstance: TSistema;
begin
  if not Assigned(Self.FInstance) then
  begin
    Self.FInstance := TSistema.Create();
  end;

  Result := Self.FInstance;
end;

end.
