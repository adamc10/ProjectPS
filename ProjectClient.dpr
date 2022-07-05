program ProjectClient;

uses
  Vcl.Forms,
  Main in 'Main.pas' {Form1},
  dm in 'dm.pas' {clmovdm: TDataModule},
  Movies in 'Movies.pas' {fmMovies},
  NewMovie in 'NewMovie.pas' {fmNewMovie},
  Users in 'Users.pas' {fmUsers},
  NewUser in 'NewUser.pas' {fmNewUser},
  Purtypes in 'Purtypes.pas' {fmPurtypes},
  NewPurtype in 'NewPurtype.pas' {fmNewPurtype},
  NewPrice in 'NewPrice.pas' {fmNewPrice},
  Purchases in 'Purchases.pas' {fmPurchases},
  NewCollection in 'NewCollection.pas' {fmNewCollection},
  NewPurchase in 'NewPurchase.pas' {fmNewPurchase},
  ReportUserPurchase in 'ReportUserPurchase.pas' {fmReportUserPurchase},
  ReportMoviePurchase in 'ReportMoviePurchase.pas' {fmReportMoviePurchase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tclmovdm, clmovdm);
  Application.CreateForm(TfmMovies, fmMovies);
  Application.CreateForm(TfmNewMovie, fmNewMovie);
  Application.CreateForm(TfmUsers, fmUsers);
  Application.CreateForm(TfmNewUser, fmNewUser);
  Application.CreateForm(TfmPurtypes, fmPurtypes);
  Application.CreateForm(TfmNewPurtype, fmNewPurtype);
  Application.CreateForm(TfmNewPrice, fmNewPrice);
  Application.CreateForm(TfmPurchases, fmPurchases);
  Application.CreateForm(TfmNewCollection, fmNewCollection);
  Application.CreateForm(TfmNewPurchase, fmNewPurchase);
  Application.CreateForm(TfmReportUserPurchase, fmReportUserPurchase);
  Application.CreateForm(TfmReportMoviePurchase, fmReportMoviePurchase);
  Application.Run;
end.
