unit model.Cliente;

interface

uses
  SysUtils, DateUtils;
Type
  TCliente = Class
    private
      FChave: Integer;
      FCodigo: Integer;
      FNome: String;
    published
      property Nome: String read FNome write FNome;
      property Codigo: Integer read FCodigo write FCodigo;
      ///<summary>Cadastra um cliente novo</summary>
      function Cadastrar: Boolean;
      ///<summary>Atualiza um cliente novo</summary>
      function Atualizar: Boolean;
  End;

implementation
uses
  ClienteDAO;

{ TCliente }

function TCliente.Atualizar: Boolean;
begin
   // Self.
end;

function TCliente.Cadastrar: Boolean;
begin
   try
      TClienteDAO.CadastrarCliente(self);
      Result := True;
   except
    on E: Exception do
      Result := False;
   end;
end;

end.
