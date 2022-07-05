object fmNewPrice: TfmNewPrice
  Left = 0
  Top = 0
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1094#1077#1085#1091
  ClientHeight = 419
  ClientWidth = 533
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 32
    Top = 35
    Width = 60
    Height = 32
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1092#1080#1083#1100#1084#1072
    WordWrap = True
  end
  object Label2: TLabel
    Left = 32
    Top = 104
    Width = 39
    Height = 16
    Caption = #1058#1072#1088#1080#1092
  end
  object Label3: TLabel
    Left = 32
    Top = 264
    Width = 30
    Height = 16
    Caption = #1062#1077#1085#1072
  end
  object eTitle: TEdit
    Left = 112
    Top = 32
    Width = 121
    Height = 24
    TabOrder = 0
    Text = 'eTitle'
  end
  object ePrice: TEdit
    Left = 112
    Top = 261
    Width = 121
    Height = 24
    TabOrder = 1
    Text = 'ePrice'
  end
  object BitBtn1: TBitBtn
    Left = 103
    Top = 352
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
  end
  object BitBtn2: TBitBtn
    Left = 343
    Top = 352
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 3
  end
  object DBGrid1: TDBGrid
    Left = 111
    Top = 104
    Width = 346
    Height = 120
    DataSource = DataSource1
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    Left = 272
    Top = 144
  end
end
