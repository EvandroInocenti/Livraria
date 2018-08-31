unit Clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Menus;

type
  TFrmCliente = class(TForm)
    QConsulta: TIBQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    GroupBox1: TGroupBox;
    RGBusca: TRadioGroup;
    Busca: TLabel;
    edBusca: TEdit;
    BtnBuscar: TButton;
    PopupMenu1: TPopupMenu;
    excluir1: TMenuItem;
    btnNovo: TButton;
    procedure BtnBuscarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure excluir1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
//    procedure btnLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
//    procedure Cadastrar;
    function ValidarNome: Boolean;
  public
    procedure Consultar;
  end;

var
  FrmCliente: TFrmCliente;

implementation

{$R *.dfm}

uses dmdados, Validador, ClienteDAO, model.Cliente, cadCliente;

procedure TFrmCliente.BtnBuscarClick(Sender: TObject);
begin
  if edBusca.Text = EmptyStr then begin
    Consultar;
    Exit;
  end;

  if RGBusca.ItemIndex = 0 then begin
    if not Validador.ValidarNumero(edBusca.Text) then begin
      ShowMessage('Valor informado não é numérico.');
      Exit
    end;
    TClienteDAO.ConsultaCliente(DataModule1.IBDatabase1, QConsulta, RGBusca.ItemIndex, edBusca.Text);
  end;
  if RGBusca.ItemIndex = 1 then
    TClienteDao.ConsultaCliente(DataModule1.IBDatabase1, QConsulta, RGBusca.ItemIndex, edBusca.Text);
end;

procedure TFrmCliente.btnNovoClick(Sender: TObject);
var
  AQuery : TIBQuery;
  ACadCliente : TFrmCadCliente;

begin
  ACadCliente := TFrmCadCliente.Create(nil);
  ACadCliente.ShowModal;
end;

procedure TFrmCliente.Consultar;
begin
  TClienteDAO.ConsultaClientes(DataModule1.IBDatabase1, QConsulta);
end;

procedure TFrmCliente.DBGrid1DblClick(Sender: TObject);
var
  ACadCliente : TFrmCadCliente;
begin
  if (QConsulta.Active) and (not QConsulta.IsEmpty) then begin
    ACadCliente := TFrmCadCliente.Create(nil);
    ACadCliente.editarCliente(QConsulta.FieldByName('nome').asString, QConsulta.FieldByName('codigo').AsInteger);
  end;
end;

procedure TFrmCliente.excluir1Click(Sender: TObject);
var
  ACadCliDao : TClienteDAO;
begin
  ACadCliDao := TClienteDAO.Create;
  ACadCliDao.ExcluirCliente(dmdados.DataModule1.IBDatabase1, QConsulta, QConsulta.FieldByName('codigo').AsInteger);
  BtnBuscarClick(self);
end;

procedure TFrmCliente.FormActivate(Sender: TObject);
begin
  Consultar;
end;

procedure TFrmCliente.FormShow(Sender: TObject);
begin
//  Consultar;
end;

function TFrmCliente.ValidarNome: Boolean;
begin
//  if edNome.Text = EmptyStr then begin
//    ShowMessage('Informe um nome.');
//    edNome.SetFocus;
    Result := False;
    Exit;
//  end;
  Result := True;
end;

end.
