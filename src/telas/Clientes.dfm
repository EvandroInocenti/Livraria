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
        FieldName = 'CODIGO'
        Title.Caption = 'C'#211'DIGO'
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
    Width = 385
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
      Width = 371
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
      Width = 181
      Height = 21
      MaxLength = 100
      TabOrder = 1
    end
    object BtnBuscar: TButton
      Left = 231
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Consultar'
      TabOrder = 2
      OnClick = BtnBuscarClick
    end
    object btnNovo: TButton
      Left = 312
      Top = 72
      Width = 70
      Height = 25
      Caption = 'Novo'
      TabOrder = 3
      OnClick = btnNovoClick
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
  object PopupMenu1: TPopupMenu
    Left = 232
    Top = 249
    object excluir1: TMenuItem
      Caption = 'excluir'
      OnClick = excluir1Click
    end
  end
end
