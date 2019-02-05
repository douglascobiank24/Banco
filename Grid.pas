unit Grid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,DataMobile, Grids, DBGrids, Menus, StdCtrls,ProjetoBanco;

type
  TForm1 = class(TForm)
    dgCliente: TDBGrid;
    MainMenu1: TMainMenu;
    A1: TMenuItem;
    Ajuda1: TMenuItem;
    GroupBox1: TGroupBox;
    Button1: TButton;
    bNovo: TButton;
    bEditar: TButton;
    bExcluir: TButton;
    bFechar: TButton;
    lFiltrar: TLabel;
    tFiltro: TEdit;
    bBuscar: TButton;
    GerarRelatorio1: TMenuItem;
    procedure bEditarClick(Sender: TObject);
    procedure bExcluirClick(Sender: TObject);
    procedure bNovoClick(Sender: TObject);
    procedure bFecharClick(Sender: TObject);
    procedure bBuscarClick(Sender: TObject);
    procedure GerarRelatorio1Click(Sender: TObject);
    procedure tFiltroChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  Form1: TForm1;
  codigoCliente : integer;
implementation

{$R *.dfm}

procedure TForm1.bEditarClick(Sender: TObject);
begin
  Application.CreateForm(TF_Cadastro,F_Cadastro);
  F_Cadastro.bCadastrar.Enabled:=False;
  F_Cadastro.tnome.Text:= dgCliente.Fields[1].AsString;
  F_Cadastro.tcpf.Text:= dgCliente.Fields[3].AsString;
  if(dgCliente.Fields[2].AsString = 'Masculino')then
    F_Cadastro.rbMasculino.Checked:= true
  else
    F_Cadastro.rbFeminino.Checked:=false;

  if(dgCliente.Fields[4].AsString = 'Casado(a)')then
    F_Cadastro.cbEstadoCivil.ItemIndex:=0
  else if(dgCliente.Fields[4].AsString = 'Divorciado(a)')then
    F_Cadastro.cbEstadoCivil.ItemIndex:=1
  else if(dgCliente.Fields[4].AsString = 'Solteiro(a)')then
    F_Cadastro.cbEstadoCivil.ItemIndex:=2
  else if(dgCliente.Fields[4].AsString = 'Viuvo(a)')then
    F_Cadastro.cbEstadoCivil.ItemIndex:=3;
  F_Cadastro.ShowModal;
  F_Cadastro.Free;
end;

procedure excluirRegistro(codigoCliente:Integer);
begin
  try
    DM.ibdbconexao.Connected:=true;
    Dm.ibqCRUD.Close;
    DM.ibqCRUD.SQL.Text:='delete from cliente where cliente.codigo =:codigo';
    DM.ibqCRUD.ParamByName('codigo').AsInteger:= codigoCliente;
    DM.ibqCRUD.ExecSQL;
    DM.ibqCRUD.Close;
    DM.ibdbConexao.Connected:=false;
    DM.ibtTabela.Active:=false;
    DM.ibtTabela.Active:=true;
    ShowMessage('Cadastro removido com sucesso !!!');
  Except
    ShowMessage('Não foi possivel efetuar a remoção do cliente!');
  End;
end;

procedure TForm1.bExcluirClick(Sender: TObject);
begin
   excluirRegistro(StrToInt(dgCliente.Fields[0].AsString));
end;

procedure TForm1.bNovoClick(Sender: TObject);
begin
   Application.CreateForm(TF_Cadastro,F_Cadastro);
   F_Cadastro.bEditar.Enabled:=False;
   F_Cadastro.ShowModal;
   F_Cadastro.Free;
end;

procedure TForm1.bFecharClick(Sender: TObject);
begin
  Close;
end;

procedure buscarCliente(nome:String);
begin
  try
    DM.ibtFiltro.SQL.Clear;
    DM.ibdbconexao.Connected:=true;
    DM.ibtFiltro.Close;
    DM.ibtFiltro.SQL.text:='select * from cliente where cliente.nome like '+ QuotedStr('%' +nome +'%');
    DM.ibtFiltro.Close;
    DM.ibdbconexao.Connected:=false;
    DM.ibtFiltro.Active:=false;
    DM.ibtFiltro.Active:=true;
  Except
    MessageDlg('Erro ao efetuar busca',mtError,[mbOk],0);
  End;
end;

procedure TForm1.bBuscarClick(Sender: TObject);
begin
  buscarCliente(tFiltro.Text);
end;

procedure TForm1.GerarRelatorio1Click(Sender: TObject);
begin
  DM.rpRelatorio.Execute;
end;

procedure TForm1.tFiltroChange(Sender: TObject);
begin
  if(tFiltro.Text <> '')then
    dgCliente.DataSource:= DM.dsFiltro;
    buscarCliente(tFiltro.Text)
  else if(tFiltro.Text = '')then
    dgCliente.DataSource:= DM.dsTabelaCliente;
  end;
end;

end.
