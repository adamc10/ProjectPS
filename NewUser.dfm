object fmNewUser: TfmNewUser
  Left = 0
  Top = 0
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
  ClientHeight = 361
  ClientWidth = 480
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
  object Имя: TLabel
    Left = 32
    Top = 27
    Width = 23
    Height = 16
    Caption = #1048#1084#1103
  end
  object Label2: TLabel
    Left = 32
    Top = 131
    Width = 57
    Height = 16
    Caption = #1069#1083'. '#1087#1086#1095#1090#1072
  end
  object Label3: TLabel
    Left = 32
    Top = 187
    Width = 53
    Height = 16
    Caption = #1058#1077#1083#1077#1092#1086#1085
  end
  object Label1: TLabel
    Left = 32
    Top = 80
    Width = 36
    Height = 16
    Caption = #1055#1088#1072#1074#1072
  end
  object Label4: TLabel
    Left = 32
    Top = 238
    Width = 43
    Height = 16
    Caption = #1055#1072#1088#1086#1083#1100
  end
  object ePassword: TEdit
    Left = 160
    Top = 235
    Width = 185
    Height = 24
    MaxLength = 20
    PasswordChar = '*'
    TabOrder = 4
    Text = 'ePassword'
  end
  object eName: TEdit
    Left = 160
    Top = 24
    Width = 185
    Height = 24
    TabOrder = 0
  end
  object eEmail: TEdit
    Left = 160
    Top = 128
    Width = 185
    Height = 24
    TabOrder = 1
  end
  object ePhone: TEdit
    Left = 160
    Top = 184
    Width = 185
    Height = 24
    TabOrder = 2
  end
  object cboxRole: TComboBox
    Left = 160
    Top = 77
    Width = 185
    Height = 24
    AutoCloseUp = True
    TabOrder = 3
    Text = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
    Items.Strings = (
      #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      #1054#1087#1077#1088#1072#1090#1086#1088
      #1056#1077#1076#1072#1082#1090#1086#1088
      #1040#1085#1072#1083#1080#1090#1080#1082
      #1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088)
  end
  object CheckBox1: TCheckBox
    Left = 368
    Top = 239
    Width = 81
    Height = 17
    Caption = #1055#1086#1082#1072#1079#1072#1090#1100
    TabOrder = 5
    OnClick = CheckBox1Click
  end
  object BitBtn1: TBitBtn
    Left = 80
    Top = 304
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 6
  end
  object BitBtn2: TBitBtn
    Left = 320
    Top = 304
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 7
  end
  object Button1: TButton
    Left = 368
    Top = 235
    Width = 89
    Height = 25
    Caption = #1053#1086#1074#1099#1081' '#1087#1072#1088#1086#1083#1100
    TabOrder = 8
    OnClick = Button1Click
  end
end
