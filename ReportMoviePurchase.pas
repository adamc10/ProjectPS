unit ReportMoviePurchase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.WinXPickers;

type
  TfmReportMoviePurchase = class(TForm)
    DatePicker1: TDatePicker;
    Label1: TLabel;
    Label2: TLabel;
    DatePicker2: TDatePicker;
    DBGrid1: TDBGrid;
    DataSourcePurchases: TDataSource;
    DBGrid2: TDBGrid;
    DataSourceMovies: TDataSource;
    LabelResult: TLabel;
    LabelSelectedMovies: TLabel;
    btnAddMovie: TButton;
    Label3: TLabel;
    btnReport: TButton;
    procedure FormActivate(Sender: TObject);
    procedure btnAddMovieClick(Sender: TObject);
    procedure btnReportClick(Sender: TObject);
  private
    { Private declarations }
    SelMovieNames :string;
    SelMovieIDs :TStringList;
    count:integer;
    ResultSum:extended;
  public
    { Public declarations }
  end;

var
  fmReportMoviePurchase: TfmReportMoviePurchase;

implementation

{$R *.dfm}
uses dm;


//передаем ид клиента и провер¤ем, входит ли он в список выбранных
function IsSelected(x: integer): boolean;
var i: integer; c:boolean;
begin
  c:=false;
  for i:=0 to fmReportMoviePurchase.count - 1 do
     if x = StrToInt(fmReportMoviePurchase.SelMovieIDs[i]) then c:=true;
  IsSelected:=c;
end;

procedure TfmReportMoviePurchase.btnAddMovieClick(Sender: TObject);
begin
  if not IsSelected(dm.clmovdm.cdsMoviesMOVIE_ID.Value) then
  begin
   SelMovieIDs.Add(dm.clmovdm.cdsMoviesMOVIE_ID.AsString);
   SelMovieNames:= SelMovieNames + ' ' + dm.clmovdm.cdsMoviesTITLE.Value;
   count:= count + 1;
  end;
   LabelSelectedMovies.Caption:= 'Выбранные фильмы: ' + SelMovieNames;
end;


procedure TfmReportMoviePurchase.btnReportClick(Sender: TObject);
var d1, d2:TDate;  id: integer;
begin

  d1:=DatePicker1.Date;
  d2:=DatePicker2.Date;


  if dm.clmovdm.cdsTemp.Active then
  begin
    dm.clmovdm.cdsTemp.CancelUpdates;
    dm.clmovdm.cdsTemp.Close;
  end;


  dm.clmovdm.cdsTemp.FieldByName('NAME').FieldKind:=fkLookUp;
  dm.clmovdm.cdsTemp.FieldByName('NAME').KeyFields:='ID';
  dm.clmovdm.cdsTemp.FieldByName('NAME').LookupDataSet:=dm.clmovdm.cdsMovies;
  dm.clmovdm.cdsTemp.FieldByName('NAME').LookupKeyFields:='MOVIE_ID';
  dm.clmovdm.cdsTemp.FieldByName('NAME').LookupResultField:='TITLE';

  dm.clmovdm.cdsTemp.Open;
  dm.clmovdm.cdsPurchases.First;
  dm.clmovdm.cdsTemp.AddIndex('indxID','ID',[],'','');
  dm.clmovdm.cdsTemp.IndexFieldNames:='ID';


  ResultSum:=0;
  while not dm.clmovdm.cdsPurchases.Eof do
    begin

     if (dm.clmovdm.cdsPurchasesSTART_DATE.Value>=d1) and
        (dm.clmovdm.cdsPurchasesSTART_DATE.Value<=d2) and
        (IsSelected(dm.clmovdm.cdsPurchasesMOVIE_ID.Value))
     then
     begin
       id:=dm.clmovdm.cdsPurchasesMOVIE_ID.Value;

       if dm.clmovdm.cdsTemp.FindKey([id]) then
          dm.clmovdm.cdsTemp.Edit
       else
        begin
          dm.clmovdm.cdsTemp.Append;
          dm.clmovdm.cdsTemp.FieldByName('ID').Value:=id;
          dm.clmovdm.cdsTemp.FieldByName('SUM').Value:=0;
         { dm.clmovdm.cdsTemp.FieldByName('NAME').Value:=
                  dm.clmovdm.cdsPurchasesUSER_NAME.Value;  }
          dm.clmovdm.cdsTemp.Edit;

        end;

          dm.clmovdm.cdsTemp.fieldByName('SUM').Value:=
            dm.clmovdm.cdsTemp.FieldByName('SUM').Value+
            dm.clmovdm.cdsPurchasesPRICE.Value;

       ResultSum:= ResultSum + dm.clmovdm.cdsPurchasesPRICE.Value;
       dm.clmovdm.cdsTemp.Post;
     end;

     dm.clmovdm.cdsPurchases.Next;
    end;


  dm.clmovdm.cdsTemp.FieldByName('SUM').DisplayLabel:='Сумма выплат';
  dm.clmovdm.cdsTemp.FieldByName('NAME').DisplayLabel:='Название';

  dm.clmovdm.cdsTemp.FieldByName('ID').DisplayWidth:=10;
  dm.clmovdm.cdsTemp.FieldByName('SUM').DisplayWidth:=15;
  dm.clmovdm.cdsTemp.FieldByName('NAME').DisplayWidth:=30;

   // dm.cdsTemp.FieldByName('ID_T').Visible:=false;

   DataSourcePurchases.DataSet:=dm.clmovdm.cdsTemp;

   LabelResult.Caption:= 'Денег получено: ' + FloatToStr(ResultSum);
   //Button3.Visible:=true;
end;

procedure TfmReportMoviePurchase.FormActivate(Sender: TObject);
begin
  DataSourcePurchases.DataSet:=dm.clmovdm.cdsPurchases;
  DataSourceMovies.DataSet:= dm.clmovdm.cdsMovies;

  DatePicker1.Date:=Now;
  DatePicker2.Date:=Now;

  LabelResult.Caption:= 'Денег получено: ';
  LabelSelectedMovies.Caption:= 'Выбранные фильмы: ';

  SelMovieIDs:=TstringList.Create;
  SelMovieNames:='';
  count:=0;
end;

end.
