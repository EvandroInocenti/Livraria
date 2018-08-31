unit ClienteDAO;

interface

uses
  System.SysUtils, System.Classes, Data.DB, IBX.IBDatabase,IBX.IBQuery, dialogs,
  model.Cliente, IBX.IBCustomDataSet;

type
  TClienteDAO = class(TPersistent)
    private
    published
      ///<summary>Consulta de clientes</summary>
      class procedure ConsultaCliente(conexao : TIBDatabase; _Aquery : TIBQuery; _AIndice : Integer; _AStr : string);
      class procedure ConsultaClientes(conexao: TIBDatabase; _AQuery: TIBQuery);
      class procedure CadastrarCliente(conexao: TIBTransaction; _AQuery: TIBQuery; _ACliente: TCliente);
      class procedure AtualizarCliente(conexao: TIBTransaction; _AQuery: TIBQuery; _ACliente: TCliente);
      class procedure ExcluirCliente(conexao: TIBDatabase; _AQuery: TIBQuery; _ACodigo: Integer);
end;

implementation

{ TFrmCliente }

uses CadCliente;

class procedure TClienteDAO.CadastrarCliente(conexao: TIBTransaction;
  _AQuery: TIBQuery; _ACliente: TCliente);
var
  AQuery : TIBQuery;
begin
   try
    with _AQuery do begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO CLIENTE(NOME)');
      SQL.Add('VALUES(:xnome)');
      ParamByName('xnome').AsString := AnsiUpperCase(_ACliente.Nome);
      ExecSQL;
    end;
    conexao.CommitRetaining;
    except
    on e: Exception do begin
      conexao.RollbackRetaining;
      ShowMessage('Não possível salvar o registro.');
    end;
  end;
end;

class procedure TClienteDAO.AtualizarCliente(conexao: TIBTransaction;
  _AQuery: TIBQuery; _ACliente: TCliente);
var
  AQuery : TIBQuery;
begin
   try
    with _AQuery do begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE CLIENTE SET nome = :xnome where codigo = :xcodigo');
      ParamByName('xcodigo').AsString := IntToStr(_ACliente.Codigo);
      ParamByName('xnome').AsString := AnsiUpperCase(_ACliente.Nome);
      ExecSQL;
      conexao.CommitRetaining;
    end;
  except
    on e: Exception do begin
      conexao.RollbackRetaining;
      ShowMessage('Não foi possível atualizar o cliente.');
    end;
  end;
end;

class procedure TClienteDAO.ConsultaCliente(conexao: TIBDatabase; _Aquery: TIBQuery;
  _AIndice: Integer; _AStr: string);
begin
  with _AQuery do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM CLIENTE');
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

class procedure TClienteDAO.ConsultaClientes(conexao: TIBDatabase; _AQuery: TIBQuery);
begin
  with _AQuery do begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT * FROM CLIENTE');
    Open;
  end;
end;
class procedure TClienteDAO.ExcluirCliente(conexao: TIBDatabase;
  _AQuery: TIBQuery; _ACodigo: Integer);
begin
  try
    with _AQuery do begin
      close;
      SQL.Clear;
      SQL.Add('DELETE FROM CLIENTE WHERE codigo = :xCodigo');
      ParamByName('xcodigo').AsInteger := _ACodigo;
      ExecSQL;
      conexao.DefaultTransaction.CommitRetaining;
    end;
  Except
    on e: Exception do begin
      conexao.DefaultTransaction.RollbackRetaining;
      ShowMessage('Não foi possível excluir o cliente.');
    end;
  end;
end;

end.
