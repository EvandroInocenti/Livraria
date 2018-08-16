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
      class procedure AtualizarCliente(conexao: TIBDatabase; _AQuery: TIBQuery; _ACliente: TCliente);
end;

implementation

{ TFrmCliente }

class procedure TClienteDAO.CadastrarCliente(conexao: TIBTransaction;
  _AQuery: TIBQuery; _ACliente: TCliente);
var
  AQuery : TIBQuery;
begin
   try
    with _AQuery do begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO CLIENTES(NOME)');
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

class procedure TClienteDAO.AtualizarCliente(conexao: TIBDatabase;
  _AQuery: TIBQuery; _ACliente: TCliente);
var
  AQuery : TIBQuery;
begin
   try
    //AQuery := TIBQuery.Create(nil);

    with _AQuery do begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE CLIENTE SET nome = :xnome where chave = :xchave');
      ParamByName('xchave').AsString := IntToStr(_ACliente.Chave);
      ParamByName('xnome').AsString := _ACliente.Nome;
      ExecSQL;
      conexao.DefaultTransaction.CommitRetaining;
    end;
  except
    on e: Exception do begin
      conexao.DefaultTransaction.RollbackRetaining;
      ShowMessage('Não foi possível atualizar o cliente.');
    end;
  end;
end;

class procedure TClienteDAO.ConsultaCliente(conexao: TIBDatabase; _Aquery: TIBQuery;
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

class procedure TClienteDAO.ConsultaClientes(conexao: TIBDatabase; _AQuery: TIBQuery);
begin
  with _AQuery do begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT * FROM CLIENTES');
    Open;
  end;
end;
end.
