unit Movies;

interface

uses
  Winapi.Windows, Winapi.Messages, System.DateUtils, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Menus, dm, NewMovie, NewPrice, NewPurchase, Vcl.StdCtrls;

type
  TfmMovies = class(TForm)
    MainMenu1: TMainMenu;
    miMovieAdd: TMenuItem;
    miMovieEdit: TMenuItem;
    miMovieDelete: TMenuItem;
    DBGridMovies: TDBGrid;
    DataSourceMovies: TDataSource;
    N4: TMenuItem;
    N5: TMenuItem;
    miPriceAdd: TMenuItem;
    miPriceEdit: TMenuItem;
    miPriceDelete: TMenuItem;
    GroupBox1: TGroupBox;
    DBGridPrices: TDBGrid;
    GroupBox2: TGroupBox;
    DBGridTags: TDBGrid;
    DataSourcePrices: TDataSource;
    DataSourceTags: TDataSource;
    Label1: TLabel;
    eTag: TEdit;
    btnTagAdd: TButton;
    btnTagDelete: TButton;
    procedure FormActivate(Sender: TObject);
    procedure miMovieAddClick(Sender: TObject);
    procedure miMovieEditClick(Sender: TObject);
    procedure miMovieDeleteClick(Sender: TObject);
    procedure miPriceAddClick(Sender: TObject);
    procedure miPriceEditClick(Sender: TObject);
    procedure miPriceDeleteClick(Sender: TObject);
    procedure btnTagAddClick(Sender: TObject);
    procedure btnTagDeleteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    SelectedMovieID: Integer;
    SelectedMovieTITLE: string;
    SelectedPurtypeID: Integer;
  end;

var
  fmMovies: TfmMovies;

implementation

{$R *.dfm}

procedure TfmMovies.btnTagAddClick(Sender: TObject);
begin

  if not (eTag.Text = '') then begin
    try
      dm.clmovdm.DCOMConnection1.AppServer.smAddTag(
        dm.clmovdm.cdsMoviesMOVIE_ID.Value,
        eTag.Text
      );
    except
      MessageDlg('с AddTag что-то не так', mtError, [mbOK], 0);
    end;
  end;

  dm.clmovdm.cdsTagNames.Refresh;
  dm.clmovdm.cdsTags.Refresh;
end;

procedure TfmMovies.btnTagDeleteClick(Sender: TObject);
var ind:integer;
begin

  ind:= dm.clmovdm.cdsTagsTAG_ID.Index;

  if MessageDlg('Удалить у '+DM.clmovdm.cdsTagsMOVIE_TITLE.Value+
  ' тег '+dm.clmovdm.cdsTagsTAG_NAME.Value+'?',
  mtConfirmation, [mbYes, mbNo], 0)=mrYes then
        dm.clmovdm.DCOMConnection1.AppServer.smDeleteTag(
            dm.clmovdm.cdsTagsMOVIE_ID.Value,
            dm.clmovdm.cdsTagsTAG_ID.Value
        );

  dm.clmovdm.cdsTags.Refresh;
end;


procedure DeleteTests;
begin

  dm.clmovdm.cdsMovies.Open;
  dm.clmovdm.cdsMovies.First;
  while not dm.clmovdm.cdsMovies.Eof do
    begin

      if dm.clmovdm.cdsMoviesTITLE.Value = 'aaaaaaaaaa' then
          dm.clmovdm.DCOMConnection1.AppServer.smDeleteMovies(
              dm.clmovdm.cdsMoviesMOVIE_ID.Value
          );

      dm.clmovdm.cdsMovies.Next;

  end;
    dm.clmovdm.cdsMovies.Refresh;
end;

function Test(n:integer):Int64;
var i:integer;
    time1, time2:TDateTime;
begin
  time1:=Time;
  for i := 1 to n do begin
    try
      dm.clmovdm.DCOMConnection1.AppServer.smAddMovies(
        0,
        'aaaaaaaaaa',
        'aaaaaaaaaa',
        'aaaaaaaaaa',
        '1111'
      );
    except
      MessageDlg('с AddMovies что-то не так', mtError, [mbOK], 0);
    end;
  end;
  dm.clmovdm.cdsMovies.Refresh;

  DeleteTests;

  time2:=Time;
  result:=MilliSecondsBetween(time1, time2);
  MessageDlg('Время работы: '+FloatToStr(result/1000)+' секунд. '
              +TimeToStr(time1)+'-'+TimeToStr(time2),
               mtInformation, [mbOK], 0);
  //dm.clmovdm.cdsMovies.Refresh;

end;



procedure Tests;
var outfile: TextFile;
    i:integer;
    mytime:Int64;
    counts:array[1..6] of integer;
begin
  counts[1]:=10; counts[2]:=50; counts[3]:=100;
  counts[4]:=500; counts[5]:=1000; counts[6]:=2000;

  AssignFile(outfile, 'd:\outfile.txt');
  Rewrite(outfile);
  for i := 1 to 6 do begin
    mytime:= Test(counts[i]);
    writeln(outfile, 'records: ', counts[i]);
    writeln(outfile, mytime);
  end;

  CloseFile(outfile);
end;

procedure TfmMovies.FormActivate(Sender: TObject);
begin
  DataSourceMovies.DataSet:=clmovdm.cdsMovies;
  DataSourcePrices.DataSet:=clmovdm.cdsPrices;
  DataSourceTags.DataSet:=clmovdm.cdsTags;

  clmovdm.cdsPrices.MasterSource:=DataSourceMovies;
  clmovdm.cdsPrices.MasterFields:='MOVIE_ID';  // будет выводить цены только соотв movie_id

  clmovdm.cdsTags.MasterSource:=DataSourceMovies;
  clmovdm.cdsTags.MasterFields:='MOVIE_ID';  // будет выводить теги только соотв movie_id


  eTag.Text:='';
  //ind:= dm.clmovdm.cdsTagsTAG_ID.Index;
  //btnTagDelete.Enabled:=False;

  //DeleteTests;
  //Tests;
end;

procedure TfmMovies.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // сохраняем выбранный фильм для NewCollection
  SelectedMovieID:=dm.clmovdm.cdsMoviesMOVIE_ID.Value;
  SelectedMovieTITLE:=dm.clmovdm.cdsMoviesTITLE.Value;
  SelectedPurtypeID:=dm.clmovdm.cdsPricesPURTYPE_ID.Value;

end;

procedure TfmMovies.miMovieAddClick(Sender: TObject);
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

procedure TfmMovies.miMovieEditClick(Sender: TObject);
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


procedure TfmMovies.miMovieDeleteClick(Sender: TObject);
begin
// удалить
  if MessageDlg('Удалить '+DM.clmovdm.cdsMoviesTITLE.Value+'?',
  mtConfirmation, [mbYes, mbNo], 0)=mrYes then
        dm.clmovdm.DCOMConnection1.AppServer.smDeleteMovies(
            dm.clmovdm.cdsMoviesMOVIE_ID.Value
        );

  dm.clmovdm.cdsMovies.Refresh;
end;



procedure TfmMovies.miPriceAddClick(Sender: TObject);
begin
  fmNewPrice.eTitle.Text:=dm.clmovdm.cdsMoviesTITLE.Value;
  fmNewPrice.DataSource1.DataSet:=dm.clmovdm.cdsPurtypes;
  fmNewPrice.DBGrid1.Enabled:=True;
  fmNewPrice.ePrice.Text:='0,00';
  fmNewPrice.ShowModal;

  //dm.clmovdm.cdsMovies.FindKey([movieID]); // глоб. перем. movieID в Public
  // FindKey - метод, появившийся в TClientDataSet, ищет по ключевым индексированным полям,
  // кстати он переходит тоже на найденную запись. Т.е. поиск по ключам.

  if fmNewPrice.ModalResult=mrOK then
  begin
    try
      dm.clmovdm.DCOMConnection1.AppServer.smAddPrice(
        dm.clmovdm.cdsMoviesMOVIE_ID.Value,  // либо через FindKey
        fmNewPrice.purtypeID,
        StrToFloat(fmNewPrice.ePrice.Text)
      );
    except
      MessageDlg('с AddPrice что-то не так', mtError, [mbOK], 0);
    end;

  end;
  dm.clmovdm.cdsPrices.Refresh;

end;

procedure TfmMovies.miPriceEditClick(Sender: TObject);
begin
  fmNewPrice.eTitle.Text:=dm.clmovdm.cdsMoviesTITLE.Value;
  fmNewPrice.DataSource1.DataSet:=dm.clmovdm.cdsPurtypes;
  dm.clmovdm.cdsPurtypes.FindKey([dm.clmovdm.cdsPricesPURTYPE_ID.Value]);
  fmNewPrice.DBGrid1.Enabled:=False;
  fmNewPrice.ePrice.Text:=FloatToStr(dm.clmovdm.cdsPricesPRICE.Value);
  fmNewPrice.ShowModal;

  //dm.clmovdm.cdsMovies.FindKey([movieID]); // глоб. перем. movieID в Public
  // FindKey - метод, появившийся в TClientDataSet, ищет по ключевым индексированным полям,
  // кстати он переходит тоже на найденную запись. Т.е. поиск по ключам.

  if fmNewPrice.ModalResult=mrOK then
  begin
    try
      dm.clmovdm.DCOMConnection1.AppServer.smAddPrice(
        dm.clmovdm.cdsMoviesMOVIE_ID.Value,  // либо через FindKey
        fmNewPrice.purtypeID,
        StrToFloat(fmNewPrice.ePrice.Text)
      );
    except
      MessageDlg('с AddPrice что-то не так', mtError, [mbOK], 0);
    end;

  end;
  dm.clmovdm.cdsPrices.Refresh;

end;

procedure TfmMovies.miPriceDeleteClick(Sender: TObject);
begin
  dm.clmovdm.cdsPurtypes.FindKey([fmNewPrice.purtypeID]);

  if MessageDlg('Удалить цену '+DM.clmovdm.cdsPricesMOVIE_TITLE.Value+
  ' '+DM.clmovdm.cdsPricesPT_MAX_QUALITY.Value+
  'p на '+IntToStr(DM.clmovdm.cdsPricesPT_DURATION.Value)+' дней?',
  mtConfirmation, [mbYes, mbNo], 0)=mrYes then
        dm.clmovdm.DCOMConnection1.AppServer.smDeletePrice(
            dm.clmovdm.cdsPricesMOVIE_ID.Value,
            dm.clmovdm.cdsPricesPURTYPE_ID.Value
        );

  dm.clmovdm.cdsPrices.Refresh;
end;

end.
