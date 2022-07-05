object fmReportMoviePurchase: TfmReportMoviePurchase
  Left = 0
  Top = 0
  Caption = #1054#1090#1095#1077#1090' '#1086' '#1087#1086#1082#1091#1087#1082#1072#1093
  ClientHeight = 748
  ClientWidth = 897
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 21
    Top = 42
    Width = 20
    Height = 22
    Caption = #1089': '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 21
    Top = 98
    Width = 32
    Height = 22
    Caption = #1087#1086': '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LabelResult: TLabel
    Left = 288
    Top = 616
    Width = 103
    Height = 16
    Caption = #1044#1077#1085#1077#1075' '#1087#1086#1083#1091#1095#1077#1085#1086': '
  end
  object LabelSelectedMovies: TLabel
    Left = 21
    Top = 479
    Width = 217
    Height = 106
    Caption = #1042#1099#1073#1088#1072#1085#1085#1099#1077' '#1092#1080#1083#1100#1084#1099': '
    WordWrap = True
  end
  object Label3: TLabel
    Left = 21
    Top = 168
    Width = 114
    Height = 16
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1092#1080#1083#1100#1084#1099':'
  end
  object DatePicker2: TDatePicker
    Left = 59
    Top = 88
    Date = 43964.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 0
  end
  object DatePicker1: TDatePicker
    Left = 59
    Top = 32
    Date = 43964.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 280
    Top = 56
    Width = 553
    Height = 529
    DataSource = DataSourcePurchases
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGrid2: TDBGrid
    Left = 21
    Top = 198
    Width = 217
    Height = 203
    DataSource = DataSourceMovies
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnAddMovie: TButton
    Left = 21
    Top = 415
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 4
    OnClick = btnAddMovieClick
  end
  object btnReport: TButton
    Left = 72
    Top = 680
    Width = 104
    Height = 25
    Caption = #1057#1076#1077#1083#1072#1090#1100' '#1086#1090#1095#1077#1090
    TabOrder = 5
    OnClick = btnReportClick
  end
  object DataSourcePurchases: TDataSource
    Left = 560
    Top = 240
  end
  object DataSourceMovies: TDataSource
    Left = 113
    Top = 240
  end
end
