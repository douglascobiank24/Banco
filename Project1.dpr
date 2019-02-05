program Project1;

uses
  Forms,
  ProjetoBanco in 'ProjetoBanco.pas' {F_Cadastro},
  DataMobile in 'DataMobile.pas' {DM: TDataModule},
  Grid in 'Grid.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TF_Cadastro, F_Cadastro);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
