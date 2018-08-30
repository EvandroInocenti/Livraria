program Livraria;

uses
  Vcl.Forms,
  dmdados in 'dmdados.pas' {DataModule1: TDataModule},
  Validador in 'Validador.pas',
  ClienteDAO in 'ClienteDAO.pas',
  Constantes in 'config\Constantes.pas',
  Clientes in 'src\telas\Clientes.pas' {FrmCliente},
  Livro in 'src\telas\Livro.pas' {FrmLivro},
  Principal in 'src\telas\Principal.pas' {FrmPrincipal},
  model.Cliente in 'src\models\model.Cliente.pas',
  model.Livro in 'src\models\model.Livro.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
