unit ClienteDAO;

interface

uses
  System.SysUtils, System.Classes, Data.DB, IBX.IBDatabase,IBX.IBQuery, dialogs;

type
  TClienteDAO = class(TPersistent)

  private

  public
    procedure ConsultaCliente(conexao : TIBDatabase; _Aquery : TIBQuery; _AIndice : Integer; _AStr : string);

end;

implementation

uses Validador;

{ TFrmCliente }

procedure TClienteDAO.ConsultaCliente(conexao: TIBDatabase; _Aquery: TIBQuery;
  _AIndice: Integer; _AStr: string);
begin
  with _Aquery do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM CLIENTES');
    case _AIndice of
      0: begin
           SQL.Add('WHERE codigo = :xcodigo');
           ParamByName('xcodigo').AsInteger := StrToInt(_AStr);
      end;
      1: begin
        SQL.Add('WHERE nome like :xparam');
        ParamByName('xparam').AsString := '%' + AnsiUpperCase(_AStr) + '%';
      end;
    end;
    Open;
  end;
end;

end.
