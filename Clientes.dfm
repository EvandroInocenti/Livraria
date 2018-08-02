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
  PixelsPerInch = 96
  TextHeight = 13
  object Busca: TLabel
    Left = 8
    Top = 73
    Width = 32
    Height = 13
    Caption = 'Buscar'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 128
    Width = 926
    Height = 169
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object edBusca: TEdit
    Left = 41
    Top = 70
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object BtnBuscar: TButton
    Left = 170
    Top = 68
    Width = 75
    Height = 25
    Caption = 'Consultar'
    TabOrder = 2
    OnClick = BtnBuscarClick
  end
  object RGBusca: TRadioGroup
    Left = 8
    Top = 8
    Width = 237
    Height = 54
    Caption = 'Busca por '#237'ndice'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'C'#243'digo'
      'Nome')
    TabOrder = 3
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
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 35
    Top = 482
  end
end
