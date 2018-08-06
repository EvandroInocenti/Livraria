program Livraria;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {Form1},
  Clientes in 'Clientes.pas' {FrmCliente},
  dmdados in 'dmdados.pas' {DataModule1: TDataModule},
  Validador in 'Validador.pas',
  ClienteDAO in 'ClienteDAO.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFrmCliente, FrmCliente);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
