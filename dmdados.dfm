object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 333
  Width = 510
  object IBDatabase1: TIBDatabase
    DatabaseName = 'E:\CURSOS\Delphi\Dados\LIVRARIA.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    ServerType = 'IBServer'
    Left = 24
    Top = 24
  end
  object IBTransaction1: TIBTransaction
    Left = 104
    Top = 24
  end
end
