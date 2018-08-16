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
    protected
      property Codigo: Integer read FCodigo write FCodigo;
    published
      property Nome: String read FNome write FNome;
      property Chave: Integer read FChave write FChave;
      ///<summary>Cadastra um cliente novo</summary>
      function Cadastrar: Boolean;
      ///<summary>Atualiza um cliente novo</summary>
      function Atualizar: Boolean;
      constructor Create(_ANome: String);
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
var
  cliDao : TClienteDAO;
begin
  // Cadastro
end;

constructor TCliente.Create(_ANome: String);
begin
  Nome := _ANome;
//  Chave := _AChave;
end;
end.
