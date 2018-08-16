unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Cliente: TMenuItem;
    imgCliente: TImage;
    Livro: TMenuItem;
    imgLivro: TImage;
    procedure ClienteClick(Sender: TObject);
    procedure imgClienteClick(Sender: TObject);
    procedure LivroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Clientes, Livro;

procedure TForm1.ClienteClick(Sender: TObject);
var
ACliente : TFrmCliente;

begin
  ACliente := TFrmCliente.Create(Nil);
    try
    ACliente.ShowModal;

  finally
    FreeAndNil(ACliente);
  end;
end;

procedure TForm1.imgClienteClick(Sender: TObject);
var
ACliente : TFrmCliente;

begin
  ACliente := TFrmCliente.Create(Nil);
    try
    ACliente.ShowModal;

  finally
    FreeAndNil(ACliente);
  end;
end;

procedure TForm1.LivroClick(Sender: TObject);
var
ALivro : TFrmLivro;

begin
  ALivro := TFrmLivro.Create(Nil);
  try
    Alivro.ShowModal
  finally
    FreeAndNil(ALivro);
  end;
end;

end.
