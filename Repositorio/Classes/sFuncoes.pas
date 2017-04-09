unit sFuncoes;

interface

uses
  windows, Forms, Controls, SysUtils, SqlExpr, DBGrids, Grids, Graphics, ComCtrls, Classes;

type
  TFuncoes = Class
  public
    class procedure ColorirGrid(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState; Color: TColor);
    class function MontarSqlComponente(objeto: TObject) : String; overload;
  end;

implementation

{ TFuncoes_v3 }

class procedure TFuncoes.ColorirGrid(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState; Color: TColor);
begin
  if not odd(TDBGrid(Sender).DataSource.DataSet.RecNo) then
  begin
     TDBGrid(Sender).Canvas.Brush.Color := Color;
     TDBGrid(Sender).Canvas.FillRect(Rect);
     TDBGrid(Sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  if (gdSelected in state ) then
  begin
     TDBGrid(Sender).Canvas.Brush.Color:= clNavy;
     TDBGrid(Sender).Canvas.Font.Color := clwhite;
     TDBGrid(Sender).Canvas.FillRect(Rect);
     TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

class function TFuncoes.MontarSqlComponente(objeto: TObject): String;
var
	VPosicaoFinal  : Integer;
	VCorpoSQL      : String;
	VSqlComponente : String;
begin
	VSqlComponente := TSQLDataSet(objeto).CommandText;

	VPosicaoFinal := POS('WHERE', UpperCase(VSqlComponente)) - 1;

	if (VPosicaoFinal <= 0) then
		VPosicaoFinal := length(VSqlComponente);

	VCorpoSQL := Copy(VSqlComponente, 1, VPosicaoFinal ) + ' ' ;

	Result := VCorpoSQL;
end;

end.
