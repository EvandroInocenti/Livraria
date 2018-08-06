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
    QCadastro: TIBQuery;
    GroupBox1: TGroupBox;
    RGBusca: TRadioGroup;
    Busca: TLabel;
    edBusca: TEdit;
    BtnBuscar: TButton;
    GroupBox2: TGroupBox;
    edCodigo: TEdit;
    lblCodigo: TLabel;
    edNome: TEdit;
    lblNome: TLabel;
    btnCadastrar: TButton;
    PopupMenu1: TPopupMenu;
    excluir1: TMenuItem;
    eChave: TEdit;
    procedure BtnBuscarClick(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure excluir1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCliente: TFrmCliente;

implementation

{$R *.dfm}

uses dmdados, Validador, ClienteDAO;

procedure TFrmCliente.BtnBuscarClick(Sender: TObject);
var
  clienteDao : TClienteDAO;
begin
  if RGBusca.ItemIndex = 0 then begin
    if edBusca.Text = EmptyStr then
      clienteDao.ConsultaCliente(DataModule1.IBDatabase1, QConsulta, RGBusca.ItemIndex, edBusca.Text);
    if not Validador.ValidarNumero(edBusca.Text) then begin
      ShowMessage('Valor informado não é numérico');
      Exit
    end;
  end;
  if RGBusca.ItemIndex = 1 then
    clienteDao.ConsultaCliente(DataModule1.IBDatabase1, QConsulta, RGBusca.ItemIndex, edBusca.Text);
end;

procedure TFrmCliente.btnCadastrarClick(Sender: TObject);
var
  AQuery : TIBQuery;
begin
  if eChave.Text = EmptyStr then begin
    AQuery := TIBQuery.Create(nil);
    try
      With AQuery do begin
        Close;
        SQL.Clear;
        Database := DataModule1.IBDatabase1;
        sql.Add('select coalesce(max(codigo),0)+1 as maxCodigo from clientes');
        Open;
      end;

      with QCadastro do begin
        Close;
        SQL.Clear;
        SQL.Add('INSERT INTO CLIENTES(CODIGO, NOME)');
        SQL.Add('VALUES(:xcodigo, :xnome)');
        ParamByName('xcodigo').AsInteger := AQuery.FieldByName('maxCodigo').AsInteger;
        ParamByName('xnome').AsString := AnsiUpperCase(edNome.Text);
        ExecSQL;
        DataModule1.IBTransaction1.CommitRetaining;
      end;
      edCodigo.Text := '';
      edNome.Text := '';
    finally
      FreeAndNil(AQuery);
    end;
  end else begin
    try
      with QCadastro do begin
        Close;
        SQL.Clear;
        SQL.Add('UPDATE CLIENTE SET nome = :xnome where chave = :xchave');
        ParamByName('xchave').AsString := eChave.Text;
        ParamByName('xnome').AsString := edNome.Text;
        ExecSQL;
        DataModule1.IBTransaction1.CommitRetaining;
      end;
    except
      on e: Exception do begin
        DataModule1.IBTransaction1.RollbackRetaining;
        ShowMessage('Ocorreu uma exceção informe o suporte.');
      end;
    end;

  end;



end;

procedure TFrmCliente.DBGrid1DblClick(Sender: TObject);
begin
  if (QConsulta.Active) and (not QConsulta.IsEmpty) then begin
    eChave.Text := QConsulta.FieldByName('chave').Text;
    edCodigo.Text := QConsulta.FieldByName('codigo').Text;
    edNome.Text := QConsulta.FieldByName('nome').Text;
  end;
end;

procedure TFrmCliente.excluir1Click(Sender: TObject);
begin
  With QCadastro do begin
    Close;
    SQL.Clear;
    SQL.Add('delete from clientes where chave = :xchave');
    ParamByName('xchave').AsInteger := QConsulta.FieldByName('chave').AsInteger;
    ExecSQL;
    DataModule1.IBTransaction1.CommitRetaining;
  end;
  BtnBuscarClick(self);
end;

end.
