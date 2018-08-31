program Livraria;

uses
  Vcl.Forms,
  Principal in 'src\telas\Principal.pas' {FrmPrincipal},
  dmdados in 'dmdados.pas' {DataModule1: TDataModule},
  Validador in 'Validador.pas',
  ClienteDAO in 'ClienteDAO.pas',
  Constantes in 'config\Constantes.pas',
  model.Cliente in 'models\model.Cliente.pas',
  Clientes in 'src\telas\Clientes.pas' {FrmCliente},
  model.Livro in 'models\model.Livro.pas',
  Livro in 'src\telas\Livro.pas' {FrmLivro};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFrmCliente, FrmCliente);
  Application.CreateForm(TFrmLivro, FrmLivro);
  Application.Run;
end.
