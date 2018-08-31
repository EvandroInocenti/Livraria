object FrmCadCliente: TFrmCadCliente
  Left = 0
  Top = 0
  Caption = 'FrmCadCliente'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblNome: TLabel
    Left = 8
    Top = 16
    Width = 31
    Height = 13
    AutoSize = False
    Caption = 'Nome:'
  end
  object Label1: TLabel
    Left = 8
    Top = 43
    Width = 57
    Height = 13
    AutoSize = False
    Caption = 'Telefone:'
  end
  object Label2: TLabel
    Left = 8
    Top = 70
    Width = 31
    Height = 13
    AutoSize = False
    Caption = 'CPF:'
  end
  object Label3: TLabel
    Left = 8
    Top = 97
    Width = 31
    Height = 13
    AutoSize = False
    Caption = 'RG:'
  end
  object Label4: TLabel
    Left = 8
    Top = 124
    Width = 31
    Height = 13
    AutoSize = False
    Caption = 'Email:'
  end
  object Label5: TLabel
    Left = 8
    Top = 151
    Width = 52
    Height = 13
    AutoSize = False
    Caption = 'Endere'#231'o:'
  end
  object Label6: TLabel
    Left = 8
    Top = 178
    Width = 31
    Height = 13
    AutoSize = False
    Caption = 'Bairro:'
  end
  object Label7: TLabel
    Left = 8
    Top = 205
    Width = 41
    Height = 13
    AutoSize = False
    Caption = 'Cidade:'
  end
  object EdNome: TEdit
    Left = 64
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object EdTelefone: TEdit
    Left = 64
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
  end
  object edCPF: TEdit
    Left = 64
    Top = 67
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'Edit1'
  end
  object edRG: TEdit
    Left = 64
    Top = 94
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'Edit1'
  end
  object edEmail: TEdit
    Left = 64
    Top = 121
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'Edit1'
  end
  object edEndereco: TEdit
    Left = 64
    Top = 148
    Width = 121
    Height = 21
    TabOrder = 5
    Text = 'Edit1'
  end
  object edBairro: TEdit
    Left = 64
    Top = 175
    Width = 121
    Height = 21
    TabOrder = 6
    Text = 'Edit1'
  end
  object edCidade: TEdit
    Left = 64
    Top = 202
    Width = 121
    Height = 21
    TabOrder = 7
    Text = 'Edit1'
  end
  object btnCadastrar: TButton
    Left = 24
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 8
    OnClick = btnCadastrarClick
  end
  object btnLimpar: TButton
    Left = 120
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Limpar'
    TabOrder = 9
    OnClick = btnLimparClick
  end
  object QCadastro: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DataModule1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 243
    Top = 178
  end
end
