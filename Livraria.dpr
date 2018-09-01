program Livraria;

uses
  Vcl.Forms,
  Principal in 'src\telas\Principal.pas' {FrmPrincipal},
  dmdados in 'dmdados.pas' {DataModule1: TDataModule},
  Validador in 'Validador.pas',
  ClienteDAO in 'ClienteDAO.pas',
  Constantes in 'config\Constantes.pas',
  Clientes in 'src\telas\Clientes.pas' {FrmCliente},
  Livro in 'src\telas\Livro.pas' {FrmLivro},
  model.Cliente in 'src\models\model.Cliente.pas',
  CadCliente in 'src\telas\CadCliente.pas' {FrmCadCliente},
  model.Livro in 'src\models\model.Livro.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFrmCliente, FrmCliente);
  Application.CreateForm(TFrmLivro, FrmLivro);
  Application.CreateForm(TFrmCadCliente, FrmCadCliente);
  Application.Run;
end.
