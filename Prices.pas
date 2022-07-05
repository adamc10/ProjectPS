unit Prices;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Menus, Vcl.Grids,
  Vcl.DBGrids, dm, NewPrice;

type
  TfmPrices = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPrices: TfmPrices;

implementation

{$R *.dfm}
       {
procedure TfmMovies.N1Click(Sender: TObject);
// добавить
begin
  fmNewMovie.eTitle.Text:='';
  fmNewMovie.eBriefDescr.Text:='';
  fmNewMovie.eDescrLink.Text:='';
  fmNewMovie.eYear.Text:='';
  fmNewMovie.ShowModal;

  if fmNewMovie.ModalResult=mrOK then
  begin
    try
      dm.clmovdm.DCOMConnection1.AppServer.smAddMovies(
        0,
        fmNewMovie.eTitle.Text,
        fmNewMovie.eBriefDescr.Text,
        fmNewMovie.eDescrLink.Text,
        fmNewMovie.eYear.Text
      );
    except
      MessageDlg('с AddMovies что-то не так', mtError, [mbOK], 0);
    end;

  end;
  dm.clmovdm.cdsMovies.Refresh;
end;

procedure TfmMovies.N2Click(Sender: TObject);
// изменить
begin
  fmNewMovie.eTitle.Text:=dm.clmovdm.cdsMoviesTITLE.Value;
  fmNewMovie.eBriefDescr.Text:=dm.clmovdm.cdsMoviesBRIEF_DESCRIPTION.Value;
  fmNewMovie.eDescrLink.Text:=dm.clmovdm.cdsMoviesDESCRIPTION_LINK.Value;
  fmNewMovie.eYear.Text:=dm.clmovdm.cdsMoviesRELEASE_YEAR.Value;
  fmNewMovie.ShowModal;

  if fmNewMovie.ModalResult=mrOK then
  begin
    try
      dm.clmovdm.DCOMConnection1.AppServer.smAddMovies(
        dm.clmovdm.cdsMoviesMOVIE_ID.Value,
        fmNewMovie.eTitle.Text,
        fmNewMovie.eBriefDescr.Text,
        fmNewMovie.eDescrLink.Text,
        fmNewMovie.eYear.Text
      );
    except
      MessageDlg('с AddMovies что-то не так', mtError, [mbOK], 0);
    end;

  end;
  dm.clmovdm.cdsMovies.Refresh;
end;

procedure TfmMovies.N3Click(Sender: TObject);
begin
// удалить
  if MessageDlg('”далить '+DM.clmovdm.cdsMoviesTITLE.Value+'?',
  mtConfirmation, [mbYes, mbNo], 0)=mrYes then
        dm.clmovdm.DCOMConnection1.AppServer.smDeleteMovies(
            dm.clmovdm.cdsMoviesMOVIE_ID.Value
        );

  dm.clmovdm.cdsMovies.Refresh;
end;   }

procedure TfmPrices.FormActivate(Sender: TObject);
begin
  DataSource1.DataSet:=clmovdm.cdsPrices;
end;

procedure TfmPrices.N1Click(Sender: TObject);
begin
  //add
  //!!!
  fmNewPrice.eTitle:='';
  //fmNewPrice.cboxPurtype.Items.Add;

  fmNewPrice.ePrice:='';
  fmNewPrice.ShowModal;

  if fmNewPrice.ModalResult=mrOK then
  begin
    try
      dm.clmovdm.DCOMConnection1.AppServer.smAddPrice(


      );
    except
      MessageDlg('с AddMovies что-то не так', mtError, [mbOK], 0);
    end;

end;

procedure TfmPrices.N2Click(Sender: TObject);
begin
  //edit
  //!!!
  fmNewMovie.eTitle.Text:=dm.clmovdm.cdsMoviesTITLE.Value;
  fmNewMovie.eBriefDescr.Text:=dm.clmovdm.cdsMoviesBRIEF_DESCRIPTION.Value;
  fmNewMovie.eDescrLink.Text:=dm.clmovdm.cdsMoviesDESCRIPTION_LINK.Value;
  fmNewMovie.eYear.Text:=dm.clmovdm.cdsMoviesRELEASE_YEAR.Value;
  fmNewMovie.ShowModal;
end;

procedure TfmPrices.N3Click(Sender: TObject);
begin
  //delete
  //!!!
  if MessageDlg('”далить '+DM.clmovdm.cdsPricesMOVIE_TITLE.Value+
  ' '+DM.clmovdm.cdsPurtypesMAX_QUALITY.Value+
  'p на '+DM.clmovdm.cdsPurtypesDURATION.Value+' дней?',
  mtConfirmation, [mbYes, mbNo], 0)=mrYes then
        dm.clmovdm.DCOMConnection1.AppServer.smDeletePrice(
            dm.clmovdm.cdsPricesMOVIE_ID.Value,
            dm.clmovdm.cdsPricesPURTYPE_ID.Value
        );

  dm.clmovdm.cdsPrices.Refresh;
end;

end.

