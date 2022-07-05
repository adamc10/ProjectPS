object fmUsers: TfmUsers
  Left = 0
  Top = 0
  Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
  ClientHeight = 572
  ClientWidth = 943
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 120
  TextHeight = 16
  object DBGridUsers: TDBGrid
    Left = 0
    Top = 0
    Width = 943
    Height = 305
    Align = alTop
    DataSource = DataSourceUsers
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 305
    Width = 943
    Height = 267
    Align = alClient
    Caption = #1054#1094#1077#1085#1082#1080
    TabOrder = 1
    object DBGridCollections: TDBGrid
      Left = 2
      Top = 18
      Width = 939
      Height = 247
      Align = alClient
      DataSource = DataSourceCollections
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object MainMenu1: TMainMenu
    Left = 104
    Top = 16
    object N4: TMenuItem
      Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      object miUserAdd: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        OnClick = miUserAddClick
      end
      object miUserEdit: TMenuItem
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        OnClick = miUserEditClick
      end
      object miUserDelete: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100
        OnClick = miUserDeleteClick
      end
    end
    object N1: TMenuItem
      Caption = #1054#1094#1077#1085#1082#1072
      object miCollectionAdd: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        OnClick = miCollectionAddClick
      end
      object miCollectionEdit: TMenuItem
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        OnClick = miCollectionEditClick
      end
      object miCollectionDelete: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100
        OnClick = miCollectionDeleteClick
      end
    end
    object miPurchases: TMenuItem
      Caption = #1055#1086#1082#1091#1087#1082#1080'...'
      OnClick = miPurchasesClick
    end
  end
  object DataSourceUsers: TDataSource
    Left = 296
    Top = 48
  end
  object DataSourceCollections: TDataSource
    Left = 192
    Top = 392
  end
end
