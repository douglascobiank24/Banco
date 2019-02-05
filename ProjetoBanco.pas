unit ProjetoBanco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DataMobile, StdCtrls;

type
  TF_Cadastro = class(TForm)
    Lnome: TLabel;
    tnome: TEdit;
    gbSexo: TGroupBox;
    rbMasculino: TRadioButton;
    rbFeminino: TRadioButton;
    lCpf: TLabel;
    tcpf: TEdit;
    lEstadoCivil: TLabel;
    cbEstadoCivil: TComboBox;
    bCadastrar: TButton;
    bCancelar: TButton;
    bEditar: TButton;
    procedure bCadastrarClick(Sender: TObject);
    procedure bEditarClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  F_Cadastro: TF_Cadastro;
  codigoCliente:Integer;
implementation

{$R *.dfm}

procedure cadastroCliente(nome:String;cpf:String;estadoCivil:String;sexo:TRadioButton);
begin
  try
    DM.ibdbConexao.Connected:=true;
    DM.ibqCRUD.Close;

    DM.ibqCRUD.SQL.Text := 'insert into cliente(nome,sexo,cpf,estado_civil) values(:nome,:sexo,:cpf,:estado_civil)';
    DM.ibqCRUD.ParamByName('nome').AsString := nome;
    DM.ibqCRUD.ParamByName('cpf').AsInteger := StrToInt(cpf);
    DM.ibqCRUD.ParamByName('estado_civil').AsString := estadoCivil;
    if(sexo.Checked)then
      DM.ibqCRUD.ParamByName('sexo').AsString:='Masculino'
    else
      DM.ibqCRUD.ParamByName('sexo').AsString:='Feminino';
    DM.ibqCRUD.ExecSQL;
    DM.ibqCRUD.Close;
    DM.ibdbConexao.Connected:=false;
    DM.ibtTabela.Active:=false;
    DM.ibtTabela.Active:=true;
    ShowMessage('Cadastro efetuado com sucesso');
  Except
    ShowMessage('Não foi possivel cadastrar um novo cliente!');
  end;
end;

procedure editarCliente(nome:String;cpf:String;estadoCivil:String;sexo:TRadioButton);
begin
  try
    DM.ibdbconexao.Connected:=true;
    DM.ibqCRUD.Close;
    DM.ibqCRUD.SQL.Text:='update cliente set cliente.nome =:nome,cliente.sexo=:sexo,cliente.cpf=:cpf,cliente.estado_civil=:estado_civil where cliente.codigo=:codigo';
    DM.ibqCRUD.ParamByName('codigo').AsInteger:=codigoCliente;
    DM.ibqCRUD.ParamByName('nome').AsString := nome;
    DM.ibqCRUD.ParamByName('cpf').AsInteger := StrToInt(cpf);
    DM.ibqCRUD.ParamByName('estado_civil').AsString := estadoCivil;
    if(sexo.Checked)then
     DM.ibqCRUD.ParamByName('sexo').AsString:='Masculino'
    else
     DM.ibqCRUD.ParamByName('sexo').AsString:='Feminino';
    DM.ibqCRUD.ExecSQL;
    DM.ibqCRUD.Close;
    DM.ibdbConexao.Connected:=false;
    DM.ibtTabela.Active:=false;
    DM.ibtTabela.Active:=true;
    ShowMessage('Os dados foram editados com sucesso');
  Except
    ShowMessage('Não foi possivel editar os dados do cliente');
  end;
  //Close;
end;

procedure TF_Cadastro.bCadastrarClick(Sender: TObject);
begin
  cadastroCliente(tnome.Text,tcpf.Text,cbEstadoCivil.Text,rbMasculino);
  Close;
end;


procedure TF_Cadastro.bEditarClick(Sender: TObject);
begin
  editarCliente(tnome.Text,tcpf.Text,cbEstadoCivil.Text,rbMasculino);
end;

end.
