object clmovdm: Tclmovdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 487
  Width = 384
  object DCOMConnection1: TDCOMConnection
    Connected = True
    ServerGUID = '{656B0B16-6A52-4E2E-B0E9-AC0A5DC0481E}'
    ServerName = 'Project2.MyServer1'
    Left = 240
    Top = 24
  end
  object cdsMovies: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMovies'
    RemoteServer = DCOMConnection1
    Left = 40
    Top = 24
    object cdsMoviesMOVIE_ID: TLargeintField
      FieldName = 'MOVIE_ID'
      Required = True
      Visible = False
    end
    object cdsMoviesTITLE: TWideStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      DisplayWidth = 30
      FieldName = 'TITLE'
      Size = 50
    end
    object cdsMoviesRELEASE_YEAR: TWideStringField
      DisplayLabel = #1043#1086#1076
      DisplayWidth = 5
      FieldName = 'RELEASE_YEAR'
      FixedChar = True
      Size = 4
    end
    object cdsMoviesBRIEF_DESCRIPTION: TWideStringField
      DisplayLabel = #1050#1088#1072#1090#1082#1086#1077' '#1086#1087#1080#1089#1072#1085#1080#1077
      DisplayWidth = 40
      FieldName = 'BRIEF_DESCRIPTION'
      Size = 1000
    end
    object cdsMoviesDESCRIPTION_LINK: TWideStringField
      DisplayLabel = #1057#1089#1099#1083#1082#1072' '#1085#1072' '#1086#1087#1080#1089#1072#1085#1080#1077
      DisplayWidth = 40
      FieldName = 'DESCRIPTION_LINK'
      Size = 300
    end
    object cdsMoviesADD_DATE: TDateField
      DisplayLabel = #1044#1072#1090#1072' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103
      FieldName = 'ADD_DATE'
    end
  end
  object cdsUsers: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsers'
    RemoteServer = DCOMConnection1
    Left = 40
    Top = 248
    object cdsUsersUSER_ID: TLargeintField
      FieldName = 'USER_ID'
      Required = True
      Visible = False
    end
    object cdsUsersNICKNAME: TWideStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'NICKNAME'
      Required = True
    end
    object cdsUsersROLE: TWideStringField
      DisplayLabel = #1055#1088#1072#1074#1072
      FieldName = 'ROLE'
    end
    object cdsUsersEMAIL: TWideStringField
      DisplayLabel = #1069#1083'. '#1087#1086#1095#1090#1072
      FieldName = 'EMAIL'
      Size = 30
    end
    object cdsUsersPHONE_NUMBER: TWideStringField
      DisplayLabel = #1058#1077#1083'. '#1085#1086#1084#1077#1088
      FieldName = 'PHONE_NUMBER'
      Size = 15
    end
    object cdsUsersPASSWORD_HASH: TWideStringField
      FieldName = 'PASSWORD_HASH'
      Required = True
      Visible = False
      FixedChar = True
      Size = 32
    end
    object cdsUsersREGISTER_DATE: TDateField
      DisplayLabel = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
      FieldName = 'REGISTER_DATE'
    end
  end
  object cdsPurtypes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPurtypes'
    RemoteServer = DCOMConnection1
    Left = 200
    Top = 96
    object cdsPurtypesPURTYPE_ID: TIntegerField
      FieldName = 'PURTYPE_ID'
      Required = True
      Visible = False
    end
    object cdsPurtypesMAX_QUALITY: TWideStringField
      DisplayLabel = #1052#1072#1082#1089'. '#1082#1072#1095#1077#1089#1090#1074#1086
      FieldName = 'MAX_QUALITY'
      FixedChar = True
      Size = 5
    end
    object cdsPurtypesDURATION: TIntegerField
      DisplayLabel = #1044#1083#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100
      DisplayWidth = 4
      FieldName = 'DURATION'
    end
  end
  object cdsTagNames: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTagNames'
    RemoteServer = DCOMConnection1
    Left = 40
    Top = 96
    object cdsTagNamesTAG_ID: TLargeintField
      DisplayLabel = #1048#1044
      FieldName = 'TAG_ID'
      Required = True
    end
    object cdsTagNamesTAG_NAME: TWideStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1077#1075#1072
      FieldName = 'TAG_NAME'
      Size = 30
    end
  end
  object cdsTags: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTags'
    RemoteServer = DCOMConnection1
    Left = 40
    Top = 168
    object cdsTagsMOVIE_ID: TLargeintField
      FieldName = 'MOVIE_ID'
      Required = True
      Visible = False
    end
    object cdsTagsTAG_ID: TLargeintField
      FieldName = 'TAG_ID'
      Required = True
      Visible = False
    end
    object cdsTagsTAG_NAME: TStringField
      DisplayLabel = #1058#1077#1075
      FieldKind = fkLookup
      FieldName = 'TAG_NAME'
      LookupDataSet = cdsTagNames
      LookupKeyFields = 'TAG_ID'
      LookupResultField = 'TAG_NAME'
      KeyFields = 'TAG_ID'
      Size = 30
      Lookup = True
    end
    object cdsTagsMOVIE_TITLE: TStringField
      DisplayLabel = #1060#1080#1083#1100#1084
      FieldKind = fkLookup
      FieldName = 'MOVIE_TITLE'
      LookupDataSet = cdsMovies
      LookupKeyFields = 'MOVIE_ID'
      LookupResultField = 'TITLE'
      KeyFields = 'MOVIE_ID'
      Visible = False
      Size = 50
      Lookup = True
    end
  end
  object cdsUserCollections: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUserCollections'
    RemoteServer = DCOMConnection1
    Left = 40
    Top = 328
    object cdsUserCollectionsUSER_ID: TLargeintField
      FieldName = 'USER_ID'
      Required = True
      Visible = False
    end
    object cdsUserCollectionsMOVIE_ID: TLargeintField
      FieldName = 'MOVIE_ID'
      Required = True
      Visible = False
    end
    object cdsUserCollectionsMOVIE_TITLE: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1092#1080#1083#1100#1084#1072
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'MOVIE_TITLE'
      LookupDataSet = cdsMovies
      LookupKeyFields = 'MOVIE_ID'
      LookupResultField = 'TITLE'
      KeyFields = 'MOVIE_ID'
      Size = 50
      Lookup = True
    end
    object cdsUserCollectionsUSER_NAME: TStringField
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'USER_NAME'
      LookupDataSet = cdsUsers
      LookupKeyFields = 'USER_ID'
      LookupResultField = 'NICKNAME'
      KeyFields = 'USER_ID'
      Visible = False
      Lookup = True
    end
    object cdsUserCollectionsRATING: TSmallintField
      DisplayLabel = #1054#1094#1077#1085#1082#1072
      FieldName = 'RATING'
    end
    object cdsUserCollectionsREVIEW: TWideStringField
      DisplayLabel = #1054#1090#1079#1099#1074
      DisplayWidth = 60
      FieldName = 'REVIEW'
      Size = 1000
    end
    object cdsUserCollectionsADD_DATE: TDateField
      DisplayLabel = #1044#1072#1090#1072' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103
      FieldName = 'ADD_DATE'
    end
    object cdsUserCollectionsEDIT_DATE: TDateField
      DisplayLabel = #1044#1072#1090#1072' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      FieldName = 'EDIT_DATE'
    end
  end
  object cdsPurchases: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPurchases'
    RemoteServer = DCOMConnection1
    Left = 200
    Top = 248
    object cdsPurchasesUSER_ID: TLargeintField
      FieldName = 'USER_ID'
      Required = True
      Visible = False
    end
    object cdsPurchasesMOVIE_ID: TLargeintField
      FieldName = 'MOVIE_ID'
      Required = True
      Visible = False
    end
    object cdsPurchasesPURTYPE_ID: TIntegerField
      FieldName = 'PURTYPE_ID'
      Required = True
      Visible = False
    end
    object cdsPurchasesUSER_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'USER_NAME'
      LookupDataSet = cdsUsers
      LookupKeyFields = 'USER_ID'
      LookupResultField = 'NICKNAME'
      KeyFields = 'USER_ID'
      Visible = False
      Lookup = True
    end
    object cdsPurchasesMOVIE_TITLE: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1092#1080#1083#1100#1084#1072
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'MOVIE_TITLE'
      LookupDataSet = cdsMovies
      LookupKeyFields = 'MOVIE_ID'
      LookupResultField = 'TITLE'
      KeyFields = 'MOVIE_ID'
      Size = 50
      Lookup = True
    end
    object cdsPurchasesPT_MAX_QUALITY: TStringField
      DisplayLabel = #1052#1072#1082#1089'. '#1082#1072#1095#1077#1089#1090#1074#1086
      FieldKind = fkLookup
      FieldName = 'PT_MAX_QUALITY'
      LookupDataSet = cdsPurtypes
      LookupKeyFields = 'PURTYPE_ID'
      LookupResultField = 'MAX_QUALITY'
      KeyFields = 'PURTYPE_ID'
      Size = 5
      Lookup = True
    end
    object cdsPurchasesPT_DURATION: TIntegerField
      DisplayLabel = #1044#1083#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100
      DisplayWidth = 5
      FieldKind = fkLookup
      FieldName = 'PT_DURATION'
      LookupDataSet = cdsPurtypes
      LookupKeyFields = 'PURTYPE_ID'
      LookupResultField = 'DURATION'
      KeyFields = 'PURTYPE_ID'
      Lookup = True
    end
    object cdsPurchasesPRICE: TCurrencyField
      DisplayLabel = #1062#1077#1085#1072
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'PRICE'
      LookupDataSet = cdsPrices
      LookupKeyFields = 'PURTYPE_ID'
      LookupResultField = 'PRICE'
      KeyFields = 'PURTYPE_ID'
      Precision = 9
      Lookup = True
    end
    object cdsPurchasesSTART_DATE: TDateField
      DisplayLabel = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
      FieldName = 'START_DATE'
      Required = True
    end
  end
  object cdsPrices: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPrices'
    RemoteServer = DCOMConnection1
    Left = 200
    Top = 168
    object cdsPricesMOVIE_ID: TLargeintField
      FieldName = 'MOVIE_ID'
      Required = True
      Visible = False
    end
    object cdsPricesPURTYPE_ID: TIntegerField
      FieldName = 'PURTYPE_ID'
      Required = True
      Visible = False
    end
    object cdsPricesMOVIE_TITLE: TStringField
      FieldKind = fkLookup
      FieldName = 'MOVIE_TITLE'
      LookupDataSet = cdsMovies
      LookupKeyFields = 'MOVIE_ID'
      LookupResultField = 'TITLE'
      KeyFields = 'MOVIE_ID'
      Visible = False
      Size = 50
      Lookup = True
    end
    object cdsPricesPT_MAX_QUALITY: TStringField
      DisplayLabel = #1052#1072#1082#1089'. '#1082#1072#1095#1077#1089#1090#1074#1086
      FieldKind = fkLookup
      FieldName = 'PT_MAX_QUALITY'
      LookupDataSet = cdsPurtypes
      LookupKeyFields = 'PURTYPE_ID'
      LookupResultField = 'MAX_QUALITY'
      KeyFields = 'PURTYPE_ID'
      Size = 5
      Lookup = True
    end
    object cdsPricesPT_DURATION: TIntegerField
      DisplayLabel = #1044#1083#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100
      FieldKind = fkLookup
      FieldName = 'PT_DURATION'
      LookupDataSet = cdsPurtypes
      LookupKeyFields = 'PURTYPE_ID'
      LookupResultField = 'DURATION'
      KeyFields = 'PURTYPE_ID'
      Lookup = True
    end
    object cdsPricesPRICE: TBCDField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'PRICE'
      Precision = 9
      Size = 2
    end
  end
  object cdsTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTemp'
    RemoteServer = DCOMConnection1
    Left = 200
    Top = 328
    object cdsTempID: TIntegerField
      FieldName = 'ID'
      Required = True
      Visible = False
    end
    object cdsTempNAME: TStringField
      FieldKind = fkLookup
      FieldName = 'NAME'
      Size = 30
      Lookup = True
    end
    object cdsTempSUM: TIntegerField
      FieldName = 'SUM'
    end
  end
end
