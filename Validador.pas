unit Validador;

interface

uses StrUtils;

function ValidarNumero(_AStr: string): Boolean;
function ValidarCampoNulo(_AStr: String): Boolean;

implementation

function ValidarCampoNulo(_AStr: String): Boolean;
begin
  Result := (_AStr <> '');
end;

function ValidarNumero(_AStr: String): Boolean;
var i: integer;
const
  SIM = 'SIM';
  NAO = 'NAO';
begin
  Result := true;
  for i := 1 to Length(_AStr) do begin
    if IfThen(_Astr[i] in ['0'..'9'], SIM, NAO) = NAO then begin
      Result := False;
      Break;
    end;
  end;
end;

end.
