object fmMovies: TfmMovies
  Left = 0
  Top = 0
  Caption = #1060#1080#1083#1100#1084#1099
  ClientHeight = 675
  ClientWidth = 734
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 120
  TextHeight = 16
  object DBGridMovies: TDBGrid
    Left = 0
    Top = 0
    Width = 734
    Height = 281
    Align = alTop
    DataSource = DataSourceMovies
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 281
    Width = 353
    Height = 394
    Align = alLeft
    Caption = #1062#1077#1085#1099
    TabOrder = 1
    object DBGridPrices: TDBGrid
      Left = 2
      Top = 18
      Width = 349
      Height = 374
      Align = alClient
      DataSource = DataSourcePrices
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object GroupBox2: TGroupBox
    Left = 353
    Top = 281
    Width = 381
    Height = 394
    Align = alClient
    Caption = #1058#1077#1075#1080
    TabOrder = 2
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 84
      Height = 16
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1077#1075':'
    end
    object DBGridTags: TDBGrid
      Left = 2
      Top = 136
      Width = 377
      Height = 256
      Align = alBottom
      DataSource = DataSourceTags
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object eTag: TEdit
      Left = 24
      Top = 46
      Width = 209
      Height = 24
      TabOrder = 1
      Text = 'eTag'
    end
    object btnTagAdd: TButton
      Left = 264
      Top = 46
      Width = 75
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 2
      OnClick = btnTagAddClick
    end
    object btnTagDelete: TButton
      Left = 24
      Top = 88
      Width = 75
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1090#1077#1075
      TabOrder = 3
      OnClick = btnTagDeleteClick
    end
  end
  object MainMenu1: TMainMenu
    Left = 104
    Top = 32
    object N4: TMenuItem
      Caption = #1060#1080#1083#1100#1084#1099
      object miMovieAdd: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        OnClick = miMovieAddClick
      end
      object miMovieEdit: TMenuItem
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        OnClick = miMovieEditClick
      end
      object miMovieDelete: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100
        OnClick = miMovieDeleteClick
      end
    end
    object N5: TMenuItem
      Caption = #1062#1077#1085#1099
      object miPriceAdd: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        OnClick = miPriceAddClick
      end
      object miPriceEdit: TMenuItem
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        OnClick = miPriceEditClick
      end
      object miPriceDelete: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100
        OnClick = miPriceDeleteClick
      end
    end
  end
  object DataSourceMovies: TDataSource
    Left = 504
    Top = 144
  end
  object DataSourcePrices: TDataSource
    Left = 168
    Top = 489
  end
  object DataSourceTags: TDataSource
    Left = 457
    Top = 481
  end
end
