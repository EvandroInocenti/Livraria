unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.StdCtrls, IdHTTP, Json, Math;

type
  TFrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Cliente: TMenuItem;
    imgCliente: TImage;
    Livro: TMenuItem;
    imgLivro: TImage;
    lblTemp: TLabel;
    procedure ClienteClick(Sender: TObject);
    procedure imgClienteClick(Sender: TObject);
    procedure LivroClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function KelvinParaCelcius(_ATemperatura: Double): integer;
    function PontoParaVirgula(_AString: string): string;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses Clientes, Livro, Constantes;

procedure TFrmPrincipal.ClienteClick(Sender: TObject);
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

procedure TFrmPrincipal.imgClienteClick(Sender: TObject);
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

function TFrmPrincipal.KelvinParaCelcius(_ATemperatura: Double): integer;
const
  ESCALA_KELVIN = 273.15;
begin
  Result := Floor(_ATemperatura - ESCALA_KELVIN);
end;

procedure TFrmPrincipal.LivroClick(Sender: TObject);
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

function TFrmPrincipal.PontoParaVirgula(_AString: string): string;
var
  AString: String;
begin
  AString := _AString;
  Result := StringReplace(AString, '.', ',',  [rfReplaceAll, rfIgnoreCase]);
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
const
  CAPTION = 'Temperatura em Joaçaba: ';
  CELCIUS = ' ºC';
var
  Request: TIdHTTP;
  ARequest, ATemp: String;
  AJson : TJsonValue;
begin
  TThread.CreateAnonymousThread(procedure begin
    try
      Request := TIdHTTP.Create;
      try
        ARequest := Request.Get(URL_OPENWEATHER);
        AJson := TJSONObject.ParseJSONValue(ARequest);
        ATemp := PontoParaVirgula(AJson.GetValue<string>('main.temp'));
        TThread.Synchronize(nil, procedure begin
          lblTemp.Caption := CAPTION +
            IntToStr(KelvinParaCelcius(ATemp.ToDouble)) +
            CELCIUS;
        end);
      except
        On E: Exception do Exit;
      end;
      if TThread.CheckTerminated then Exit;
    finally
      if not TThread.CheckTerminated then begin
        Request.Free;
        AJson.Free;
      end;
    end;
  end).Start;
end;

end.