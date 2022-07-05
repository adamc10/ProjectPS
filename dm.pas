unit dm;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient,
  Datasnap.Win.MConnect;

type
  Tclmovdm = class(TDataModule)
    DCOMConnection1: TDCOMConnection;
    cdsMovies: TClientDataSet;
    cdsUsers: TClientDataSet;
    cdsPurtypes: TClientDataSet;
    cdsMoviesMOVIE_ID: TLargeintField;
    cdsMoviesTITLE: TWideStringField;
    cdsMoviesBRIEF_DESCRIPTION: TWideStringField;
    cdsMoviesDESCRIPTION_LINK: TWideStringField;
    cdsMoviesRELEASE_YEAR: TWideStringField;
    cdsUsersUSER_ID: TLargeintField;
    cdsUsersNICKNAME: TWideStringField;
    cdsUsersROLE: TWideStringField;
    cdsUsersEMAIL: TWideStringField;
    cdsUsersPHONE_NUMBER: TWideStringField;
    cdsUsersPASSWORD_HASH: TWideStringField;
    cdsPurtypesPURTYPE_ID: TIntegerField;
    cdsPurtypesMAX_QUALITY: TWideStringField;
    cdsPurtypesDURATION: TIntegerField;
    cdsTagNames: TClientDataSet;
    cdsTags: TClientDataSet;
    cdsUserCollections: TClientDataSet;
    cdsPurchases: TClientDataSet;
    cdsPrices: TClientDataSet;
    cdsPricesPRICE: TBCDField;
    cdsPricesMOVIE_ID: TLargeintField;
    cdsPricesPURTYPE_ID: TIntegerField;
    cdsPurchasesUSER_ID: TLargeintField;
    cdsPurchasesMOVIE_ID: TLargeintField;
    cdsPurchasesPURTYPE_ID: TIntegerField;
    cdsPurchasesSTART_DATE: TDateField;
    cdsTagNamesTAG_ID: TLargeintField;
    cdsTagNamesTAG_NAME: TWideStringField;
    cdsTagsMOVIE_ID: TLargeintField;
    cdsTagsTAG_ID: TLargeintField;
    cdsUserCollectionsUSER_ID: TLargeintField;
    cdsUserCollectionsMOVIE_ID: TLargeintField;
    cdsUserCollectionsRATING: TSmallintField;
    cdsUserCollectionsREVIEW: TWideStringField;
    cdsUserCollectionsMOVIE_TITLE: TStringField;
    cdsUserCollectionsUSER_NAME: TStringField;
    cdsTagsTAG_NAME: TStringField;
    cdsPricesPT_MAX_QUALITY: TStringField;
    cdsPricesPT_DURATION: TIntegerField;
    cdsPurchasesUSER_NAME: TStringField;
    cdsPurchasesMOVIE_TITLE: TStringField;
    cdsPurchasesPT_MAX_QUALITY: TStringField;
    cdsPurchasesPT_DURATION: TIntegerField;
    cdsTagsMOVIE_TITLE: TStringField;
    cdsPurchasesPRICE: TCurrencyField;
    cdsPricesMOVIE_TITLE: TStringField;
    cdsMoviesADD_DATE: TDateField;
    cdsUsersREGISTER_DATE: TDateField;
    cdsUserCollectionsADD_DATE: TDateField;
    cdsUserCollectionsEDIT_DATE: TDateField;
    cdsTemp: TClientDataSet;
    cdsTempID: TIntegerField;
    cdsTempSUM: TIntegerField;
    cdsTempNAME: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  clmovdm: Tclmovdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure Tclmovdm.DataModuleCreate(Sender: TObject);
begin
	cdsMovies.Open;
	cdsTagNames.Open;
	cdsTags.Open;
	cdsUsers.Open;
	cdsUserCollections.Open;
	cdsPurtypes.Open;
	cdsPrices.Open;
	cdsPurchases.Open;

  cdsMovies.AddIndex('INDX','MOVIE_ID', [], '', '');
  cdsMovies.IndexFieldNames:= 'MOVIE_ID';

  cdsPrices.AddIndex('INDX','MOVIE_ID;PURTYPE_ID', [], '', '');
  cdsPrices.IndexFieldNames:= 'MOVIE_ID;PURTYPE_ID';

  cdsTags.AddIndex('INDX','MOVIE_ID;TAG_ID', [], '', '');
  cdsTags.IndexFieldNames:= 'MOVIE_ID;TAG_ID';

  cdsUsers.AddIndex('INDX','USER_ID', [], '', '');
  cdsUsers.IndexFieldNames:= 'USER_ID';

  cdsUserCollections.AddIndex('INDX','USER_ID;MOVIE_ID', [], '', '');
  cdsUserCollections.IndexFieldNames:= 'USER_ID;MOVIE_ID';

  cdsPurchases.AddIndex('INDX','USER_ID;MOVIE_ID;PURTYPE_ID', [], '', '');
  cdsPurchases.IndexFieldNames:= 'USER_ID;MOVIE_ID;PURTYPE_ID';
end;

procedure Tclmovdm.DataModuleDestroy(Sender: TObject);
begin
  DCOMConnection1.Close;
end;

end.
