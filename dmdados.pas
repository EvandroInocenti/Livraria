unit dmdados;

interface

uses
  System.SysUtils, System.Classes, Data.DB, IBX.IBDatabase;

type
  TDataModule1 = class(TDataModule)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;


implementation

uses Constantes;
{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  IBDatabase1.DatabaseName := DIRETORIO_DB;
end;

end.
