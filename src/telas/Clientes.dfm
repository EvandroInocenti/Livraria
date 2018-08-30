object FrmCliente: TFrmCliente
  Left = 0
  Top = 0
  Caption = 'FrmCliente'
  ClientHeight = 580
  ClientWidth = 942
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 128
    Width = 926
    Height = 169
    DataSource = DataSource1
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CHAVE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 265
    Height = 114
    Caption = 'Consulta '
    TabOrder = 1
    object Busca: TLabel
      Left = 11
      Top = 79
      Width = 32
      Height = 13
      Caption = 'Buscar'
    end
    object RGBusca: TRadioGroup
      Left = 11
      Top = 15
      Width = 237
      Height = 54
      Caption = 'Busca por '#237'ndice'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'C'#243'digo'
        'Nome')
      TabOrder = 0
    end
    object edBusca: TEdit
      Left = 44
      Top = 74
      Width = 121
      Height = 21
      MaxLength = 100
      TabOrder = 1
    end
    object BtnBuscar: TButton
      Left = 173
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Consultar'
      TabOrder = 2
      OnClick = BtnBuscarClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 312
    Width = 313
    Height = 113
    Caption = 'Cadastro '
    TabOrder = 2
    object lblNome: TLabel
      Left = 15
      Top = 75
      Width = 34
      Height = 13
      Caption = 'Nome: '
    end
    object edNome: TEdit
      Left = 55
      Top = 72
      Width = 150
      Height = 21
      TabOrder = 0
    end
    object btnCadastrar: TButton
      Left = 230
      Top = 70
      Width = 70
      Height = 25
      Caption = 'Cadastrar'
      TabOrder = 1
      OnClick = btnCadastrarClick
    end
    object btnLimpar: TButton
      Left = 230
      Top = 16
      Width = 70
      Height = 25
      Caption = 'Limpar'
      Enabled = False
      TabOrder = 2
      OnClick = btnLimparClick
    end
  end
  object QConsulta: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DataModule1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 32
    Top = 248
  end
  object DataSource1: TDataSource
    DataSet = QConsulta
    Left = 96
    Top = 248
  end
  object QCadastro: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DataModule1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 195
    Top = 330
  end
  object PopupMenu1: TPopupMenu
    Left = 368
    Top = 320
    object excluir1: TMenuItem
      Caption = 'excluir'
      OnClick = excluir1Click
    end
  end
end
