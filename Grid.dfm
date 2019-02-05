object Form1: TForm1
  Left = 267
  Top = 121
  Width = 732
  Height = 457
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lFiltrar: TLabel
    Left = 16
    Top = 8
    Width = 28
    Height = 13
    Caption = 'Filtrar:'
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 56
    Width = 697
    Height = 289
    Caption = 'Clientes'
    TabOrder = 1
    object Button1: TButton
      Left = 312
      Top = 160
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
    end
  end
  object dgCliente: TDBGrid
    Left = 32
    Top = 80
    Width = 665
    Height = 241
    DataSource = DM.dsTabelaCliente
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object bNovo: TButton
    Left = 32
    Top = 368
    Width = 75
    Height = 25
    Caption = 'Novo'
    TabOrder = 2
    OnClick = bNovoClick
  end
  object bEditar: TButton
    Left = 424
    Top = 368
    Width = 75
    Height = 25
    Caption = 'Editar'
    TabOrder = 3
    OnClick = bEditarClick
  end
  object bExcluir: TButton
    Left = 528
    Top = 368
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 4
    OnClick = bExcluirClick
  end
  object bFechar: TButton
    Left = 632
    Top = 368
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 5
    OnClick = bFecharClick
  end
  object tFiltro: TEdit
    Left = 56
    Top = 8
    Width = 193
    Height = 21
    TabOrder = 6
    OnChange = tFiltroChange
  end
  object bBuscar: TButton
    Left = 272
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 7
    OnClick = bBuscarClick
  end
  object MainMenu1: TMainMenu
    Left = 680
    Top = 65528
    object A1: TMenuItem
      Caption = 'Arquivo'
      object GerarRelatorio1: TMenuItem
        Caption = 'Gerar Relatorio'
        OnClick = GerarRelatorio1Click
      end
    end
    object Ajuda1: TMenuItem
      Caption = 'Ajuda'
    end
  end
end
