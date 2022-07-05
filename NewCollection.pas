unit NewCollection;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, System.ImageList, Vcl.ImgList;

type
  TfmNewCollection = class(TForm)
    Label3: TLabel;
    RadioGroup1: TRadioGroup;
    MemoReview: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    beTitle: TButtonedEdit;
    ImageList1: TImageList;
    Label1: TLabel;
    procedure beTitleRightButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    movieID:integer;
  end;

var
  fmNewCollection: TfmNewCollection;

implementation

{$R *.dfm}

uses Movies;

procedure TfmNewCollection.beTitleRightButtonClick(Sender: TObject);
begin
  fmMovies.ShowModal;
  movieID:= fmMovies.SelectedMovieID;
  beTitle.Text:= fmMovies.SelectedMovieTITLE;
end;

end.
