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
    btnLimpar: TButton;
    procedure BtnBuscarClick(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure excluir1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure Limpar;
    procedure Consultar;
    procedure Cadastrar;
    function ValidarNome: Boolean;
  end;

var
  FrmCliente: TFrmCliente;

const
  CADASTRAR_BUTTON_CAPTION = 'Cadastrar';
  ATUALIZAR_BUTTON_CAPTION = 'Atualizar';
implementation

{$R *.dfm}

uses dmdados, Validador, ClienteDAO, model.Cliente;

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

procedure TFrmCliente.btnCadastrarClick(Sender: TObject);
var
  AQuery : TIBQuery;
begin
  if btnCadastrar.Caption = CADASTRAR_BUTTON_CAPTION then Cadastrar;

  if btnCadastrar.Caption = ATUALIZAR_BUTTON_CAPTION then begin
    if edNome.Text = EmptyStr then begin
      Show
    end;
  end;

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

  end;
end;

procedure TFrmCliente.btnLimparClick(Sender: TObject);
begin
  Limpar;
end;

procedure TFrmCliente.Cadastrar;
var
  ACliente : TCliente;
begin
  if ValidarNome then begin
    ACliente := TCliente.Create(edNome.Text);
    TClienteDAO.CadastrarCliente(DataModule1.IBTransaction1, QCadastro, ACliente);
    ACliente.Cadastrar;
    Limpar;
    Consultar;
  end;
end;

procedure TFrmCliente.Consultar;
begin
  TClienteDAO.ConsultaClientes(DataModule1.IBDatabase1, QConsulta);
end;

procedure TFrmCliente.DBGrid1DblClick(Sender: TObject);
begin
  if (QConsulta.Active) and (not QConsulta.IsEmpty) then begin
    eChave.Text := QConsulta.FieldByName('chave').Text;
    edCodigo.Text := QConsulta.FieldByName('codigo').Text;
    btnCadastrar.Caption := ATUALIZAR_BUTTON_CAPTION;
    edNome.Text := QConsulta.FieldByName('nome').Text;
    btnLimpar.Enabled := True;
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

procedure TFrmCliente.FormShow(Sender: TObject);
begin
  Consultar;
end;

procedure TFrmCliente.Limpar;
begin
  edCodigo.Text := EmptyStr;
  edNome.Text := EmptyStr;
  btnCadastrar.Caption := CADASTRAR_BUTTON_CAPTION;
  btnLimpar.Enabled := false;
end;

function TFrmCliente.ValidarNome: Boolean;
begin
  if edNome.Text = EmptyStr then begin
    ShowMessage('Informe um nome.');
    edNome.SetFocus;
    Result := False;
    Exit;
  end;
  Result := True;
end;

end.
