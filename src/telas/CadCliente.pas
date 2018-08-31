unit CadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery;

type
  TFrmCadCliente = class(TForm)
    lblNome: TLabel;
    EdNome: TEdit;
    Label1: TLabel;
    EdTelefone: TEdit;
    Label2: TLabel;
    edCPF: TEdit;
    Label3: TLabel;
    edRG: TEdit;
    Label4: TLabel;
    edEmail: TEdit;
    Label5: TLabel;
    edEndereco: TEdit;
    Label6: TLabel;
    edBairro: TEdit;
    Label7: TLabel;
    edCidade: TEdit;
    btnCadastrar: TButton;
    QCadastro: TIBQuery;
    btnLimpar: TButton;
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
  private
    procedure Limpar;
    procedure Consultar;
    procedure Cadastrar;
    function ValidarNome: Boolean;
  public
    procedure editarCliente(_ANome: string; _ATag: Integer);
  end;

var
  FrmCadCliente: TFrmCadCliente;

const
  CADASTRAR_BUTTON_CAPTION = 'Cadastrar';
  ATUALIZAR_BUTTON_CAPTION = 'Atualizar';

implementation

{$R *.dfm}

uses dmdados, ClienteDAO;

procedure TFrmCadCliente.btnCadastrarClick(Sender: TObject);
begin
if btnCadastrar.Caption = CADASTRAR_BUTTON_CAPTION then Cadastrar;

  if btnCadastrar.Caption = ATUALIZAR_BUTTON_CAPTION then begin
    if edNome.Text = EmptyStr then begin
      Show
    end;
  end;

//  if eChave.Text = EmptyStr then begin
//    AQuery := TIBQuery.Create(nil);
//    try
//      With AQuery do begin
//        Close;
//        SQL.Clear;
//        Database := DataModule1.IBDatabase1;
//        sql.Add('select coalesce(max(codigo),0)+1 as maxCodigo from clientes');
//        Open;
//      end;
//
//      with QCadastro do begin
//        Close;
//        SQL.Clear;
//        SQL.Add('INSERT INTO CLIENTES(CODIGO, NOME)');
//        SQL.Add('VALUES(:xcodigo, :xnome)');
//        ParamByName('xcodigo').AsInteger := AQuery.FieldByName('maxCodigo').AsInteger;
//        ParamByName('xnome').AsString := AnsiUpperCase(edNome.Text);
//        ExecSQL;
//        DataModule1.IBTransaction1.CommitRetaining;
//      end;
//      edCodigo.Text := '';
//      edNome.Text := '';
//    finally
//      FreeAndNil(AQuery);
//    end;
//  end else begin
//
//  end;
end;

procedure TFrmCadCliente.btnLimparClick(Sender: TObject);
begin
  Limpar;
end;

procedure TFrmCadCliente.Cadastrar;
var
  ACadCliente : TFrmCadCliente;
begin
  if ValidarNome then begin
    ACadCliente := TFrmCadCliente.Create(Application);
//    TClienteDAO.CadastrarCliente(DataModule1.IBTransaction1, QCadastro, ACadCliente);
//    ACadCliente.Cadastrar;
    Limpar;
    Consultar;
  end;
end;

procedure TFrmCadCliente.Consultar;
begin

end;

procedure TFrmCadCliente.editarCliente(_ANome: string; _ATag: Integer);
begin
  EdNome.Text := _ANome;
  EdNome.Tag := _ATag;
  ShowModal;
end;

procedure TFrmCadCliente.Limpar;
begin
  edNome.Text := EmptyStr;
  btnCadastrar.Caption := CADASTRAR_BUTTON_CAPTION;
  btnLimpar.Enabled := false;
end;

function TFrmCadCliente.ValidarNome: Boolean;
begin
  result := (EdNome.Text <> EmptyStr);
end;

end.
