unit NewPurchase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.ImageList,
  Vcl.ImgList, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  Vcl.WinXPickers;

type
  TfmNewPurchase = class(TForm)
    beTitle: TButtonedEdit;
    ImageList1: TImageList;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DatePicker1: TDatePicker;
    Label2: TLabel;
    DataSource1: TDataSource;
    procedure beTitleRightButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    movieID:integer;
    purtypeID:integer;
  end;

var
  fmNewPurchase: TfmNewPurchase;

implementation

{$R *.dfm}
uses Movies, dm;



procedure TfmNewPurchase.beTitleRightButtonClick(Sender: TObject);
begin
  fmMovies.ShowModal;
  movieID:= fmMovies.SelectedMovieID;
  beTitle.Text:= fmMovies.SelectedMovieTITLE;

  DataSource1.DataSet:= dm.clmovdm.cdsPrices;

  clmovdm.cdsPrices.MasterSource:=fmMovies.DataSourceMovies;
  clmovdm.cdsPrices.MasterFields:='MOVIE_ID';  // будет выводить цены только соотв movie_id
  purtypeID:= DataSource1.DataSet.FieldByName('PURTYPE_ID').Value;
  fmNewPurchase.DBGrid1.Enabled:=False;
  {
  DBGrid1.DataSource:=fmMovies.DataSourcePrices;
  purtypeID:= DBGrid1.DataSource.DataSet.FieldByName('PURTYPE_ID').Value;
  //    dm.clmovdm.cdsPricesPURTYPE_ID.Value;      }
end;

end.
