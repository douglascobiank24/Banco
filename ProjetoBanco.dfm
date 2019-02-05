object F_Cadastro: TF_Cadastro
  Left = 516
  Top = 172
  Width = 442
  Height = 194
  Caption = 'Cadastrar Cliente'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Lnome: TLabel
    Left = 16
    Top = 16
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object lCpf: TLabel
    Left = 208
    Top = 48
    Width = 20
    Height = 13
    Caption = 'CPF'
  end
  object lEstadoCivil: TLabel
    Left = 168
    Top = 88
    Width = 55
    Height = 13
    Caption = 'Estado Civil'
  end
  object tnome: TEdit
    Left = 64
    Top = 16
    Width = 361
    Height = 21
    TabOrder = 0
  end
  object gbSexo: TGroupBox
    Left = 16
    Top = 48
    Width = 137
    Height = 105
    Caption = 'Sexo'
    TabOrder = 1
    object rbMasculino: TRadioButton
      Left = 16
      Top = 24
      Width = 113
      Height = 17
      Caption = 'Masculino'
      TabOrder = 0
    end
    object rbFeminino: TRadioButton
      Left = 16
      Top = 64
      Width = 113
      Height = 17
      Caption = 'Feminino'
      TabOrder = 1
    end
  end
  object tcpf: TEdit
    Left = 240
    Top = 48
    Width = 185
    Height = 21
    TabOrder = 2
  end
  object cbEstadoCivil: TComboBox
    Left = 240
    Top = 80
    Width = 185
    Height = 21
    ItemHeight = 13
    TabOrder = 3
    Text = 'Selecione...'
    Items.Strings = (
      'Casado(a)'
      'Divorciado(a)'
      'Solteiro(a)'
      'Viuvo(a)')
  end
  object bCadastrar: TButton
    Left = 264
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 4
    OnClick = bCadastrarClick
  end
  object bCancelar: TButton
    Left = 352
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 5
  end
  object bEditar: TButton
    Left = 176
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Editar'
    TabOrder = 6
    OnClick = bEditarClick
  end
end
