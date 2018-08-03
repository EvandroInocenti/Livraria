unit Validador;

interface

uses StrUtils;

function ValidarNumero(_AStr: string): Boolean;

implementation

function ValidarNumero(_AStr: String): Boolean;
var i: integer;
begin
  for i := 1 to Length(_AStr) do
   if IfThen(_Astr[i] in ['1'..'9', '0'], 'S', 'N') = 'S' then result := true else result := false;
end;

end.
