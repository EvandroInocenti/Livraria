unit Clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TFrmCliente = class(TForm)
    QConsulta: TIBQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    QCadastro: TIBQuery;
    Busca: TLabel;
    edBusca: TEdit;
    BtnBuscar: TButton;
    RGBusca: TRadioGroup;
    procedure BtnBuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCliente: TFrmCliente;

implementation

{$R *.dfm}

uses dmdados;

procedure TFrmCliente.BtnBuscarClick(Sender: TObject);
var
  ACodigo : Integer;
  ANome : String;
begin
  with QConsulta do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM CLIENTES WHERE');
    case RGBusca.ItemIndex of
      0: begin
         SQL.Add('codigo = :xcodigo');
         Acodigo := StrToInt(edBusca.Text);
         ParamByName('xcodigo').AsInteger := ACodigo;
      end;
      1: begin
        SQL.Add('nome = :xparam');
        ParamByName('xparam').AsString := AnsiUpperCase(edBusca.Text);
      end;

    end;
    Open;
  end;

end;

end.
