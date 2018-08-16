program Livraria;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {Form1},
  Clientes in 'Clientes.pas' {FrmCliente},
  dmdados in 'dmdados.pas' {DataModule1: TDataModule},
  Validador in 'Validador.pas',
  ClienteDAO in 'ClienteDAO.pas',
  model.Cliente in 'models\model.Cliente.pas',
  model.Livro in 'models\model.Livro.pas' {$R *.res},
  Livro in 'Livro.pas' {FrmLivro};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFrmCliente, FrmCliente);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFrmLivro, FrmLivro);
  Application.CreateForm(TFrmLivro, FrmLivro);
  Application.Run;
end.
