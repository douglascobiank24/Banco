unit DataMobile;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, IBDatabase, IBTable,
  RpDefine, RpCon, RpConDS, RpRave;

type
  TDM = class(TDataModule)
    ibdbconexao: TIBDatabase;
    ibtTransacoes: TIBTransaction;
    ibqCRUD: TIBQuery;
    ibtTabela: TIBTable;
    dsTabelaCliente: TDataSource;
    ibtFiltro: TIBQuery;
    dsFiltro: TDataSource;
    rdscRelatorio: TRvDataSetConnection;
    rpRelatorio: TRvProject;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
