unit Purchases;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Menus, Vcl.Grids,
  Vcl.DBGrids;

type
  TfmPurchases = class(TForm)
    DBGrid1: TDBGrid;
    MainMenu1: TMainMenu;
    miPurchaseAdd: TMenuItem;
    DataSource1: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure miPurchaseAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPurchases: TfmPurchases;

implementation

{$R *.dfm}

uses Users, dm, NewPurchase;

procedure TfmPurchases.FormActivate(Sender: TObject);
begin
  DataSource1.DataSet:=clmovdm.cdsPurchases;

  clmovdm.cdsPurchases.MasterSource:=fmUsers.DataSourceUsers;
  clmovdm.cdsPurchases.MasterFields:='USER_ID';

end;



procedure TfmPurchases.miPurchaseAddClick(Sender: TObject);
begin
  fmNewPurchase.beTitle.RightButton.Enabled:=True;
  fmNewPurchase.beTitle.RightButton.Visible:=True;
  fmNewPurchase.beTitle.Text:='';
  fmNewPurchase.movieID:=0;
  fmNewPurchase.DatePicker1.Date:=Now;
  fmNewPurchase.DataSource1.DataSet:=nil;

  fmNewPurchase.ShowModal;

  if fmNewPurchase.ModalResult=mrOK then
  begin
    try

      dm.clmovdm.DCOMConnection1.AppServer.smAddPurchase(
        dm.clmovdm.cdsUsersUSER_ID.Value,
        fmNewPurchase.movieID,
        fmNewPurchase.purtypeID,
        fmNewPurchase.DatePicker1.Date
      );
    except
      MessageDlg('с AddPurchase что-то не так', mtError, [mbOK], 0);
    end;

  end;
  dm.clmovdm.cdsPurchases.Refresh;
end;

end.
