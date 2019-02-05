object DM: TDM
  OldCreateOrder = False
  Left = 322
  Top = 172
  Height = 296
  Width = 484
  object ibdbconexao: TIBDatabase
    Connected = True
    DatabaseName = 
      'localhost:C:\Users\dougl\Desktop\ProgramacaoDeAplicativos\Banco\' +
      'BD.FDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = ibtTransacoes
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 16
    Top = 24
  end
  object ibtTransacoes: TIBTransaction
    Active = True
    DefaultDatabase = ibdbconexao
    AutoStopAction = saNone
    Left = 88
    Top = 24
  end
  object ibqCRUD: TIBQuery
    Database = ibdbconexao
    Transaction = ibtTransacoes
    BufferChunks = 1000
    CachedUpdates = False
    Left = 160
    Top = 24
  end
  object ibtTabela: TIBTable
    Database = ibdbconexao
    Transaction = ibtTransacoes
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NOME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'SEXO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CPF'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ESTADO_CIVIL'
        Attributes = [faRequired]
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <
      item
        Name = 'PK_CLIENTE'
        Fields = 'CODIGO'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'CLIENTE'
    Left = 216
    Top = 24
  end
  object dsTabelaCliente: TDataSource
    DataSet = ibtTabela
    Left = 280
    Top = 24
  end
  object ibtFiltro: TIBQuery
    Database = ibdbconexao
    Transaction = ibtTransacoes
    BufferChunks = 1000
    CachedUpdates = False
    Left = 16
    Top = 104
  end
  object dsFiltro: TDataSource
    DataSet = ibtFiltro
    Left = 64
    Top = 104
  end
  object rdscRelatorio: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = ibtTabela
    Left = 32
    Top = 176
  end
  object rpRelatorio: TRvProject
    ProjectFile = 
      'C:\Users\dougl\Desktop\ProgramacaoDeAplicativos\Banco\RelatorioC' +
      'liente.rav'
    Left = 104
    Top = 184
  end
end
