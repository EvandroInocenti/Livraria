program Livraria;

uses
  Vcl.Forms,
  dmdados in 'dmdados.pas' {DataModule1: TDataModule},
  Validador in 'Validador.pas',
  ClienteDAO in 'ClienteDAO.pas',
  model.Cliente in 'models\model.Cliente.pas',
  model.Livro in 'models\model.Livro.pas' {$R *.res},
  Constantes in 'config\Constantes.pas',
  Clientes in 'src\telas\Clientes.pas' {FrmCliente},
  Livro in 'src\telas\Livro.pas' {FrmLivro},
  Principal in 'src\telas\Principal.pas' {FrmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
