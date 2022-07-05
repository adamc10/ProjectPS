unit Users;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Menus, System.Hash, Vcl.StdCtrls;

type
  TfmUsers = class(TForm)
    MainMenu1: TMainMenu;
    miUserAdd: TMenuItem;
    miUserEdit: TMenuItem;
    miUserDelete: TMenuItem;
    DBGridUsers: TDBGrid;
    DataSourceUsers: TDataSource;
    DataSourceCollections: TDataSource;
    N4: TMenuItem;
    miCollectionAdd: TMenuItem;
    miCollectionEdit: TMenuItem;
    miCollectionDelete: TMenuItem;
    miPurchases: TMenuItem;
    GroupBox1: TGroupBox;
    DBGridCollections: TDBGrid;
    N1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure miUserAddClick(Sender: TObject);
    procedure miUserEditClick(Sender: TObject);
    procedure miUserDeleteClick(Sender: TObject);
    procedure miCollectionAddClick(Sender: TObject);
    procedure miCollectionEditClick(Sender: TObject);
    procedure miCollectionDeleteClick(Sender: TObject);
    procedure miPurchasesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmUsers: TfmUsers;

implementation

{$R *.dfm}

uses NewMovie, dm, NewUser, NewCollection, Purchases;

procedure TfmUsers.FormActivate(Sender: TObject);
begin
  DataSourceUsers.DataSet:=clmovdm.cdsUsers;
  DataSourceCollections.DataSet:=clmovdm.cdsUserCollections;

  clmovdm.cdsUserCollections.MasterSource:=DataSourceUsers;
  clmovdm.cdsUserCollections.MasterFields:='USER_ID';
end;

procedure TfmUsers.miCollectionAddClick(Sender: TObject);
begin
  fmNewCollection.beTitle.RightButton.Enabled:=True;
  fmNewCollection.beTitle.RightButton.Visible:=True;
  fmNewCollection.beTitle.Text:='';
  fmNewCollection.movieID:=0;
  fmNewCollection.RadioGroup1.ItemIndex:=-1;
  fmNewCollection.MemoReview.Lines.Text:='';

  fmNewCollection.ShowModal;

  if fmNewCollection.ModalResult=mrOK then
  begin
    try

      dm.clmovdm.DCOMConnection1.AppServer.smAddToCollection(
        dm.clmovdm.cdsUsersUSER_ID.Value,
        fmNewCollection.movieID,
        fmNewCollection.RadioGroup1.ItemIndex + 1,
        fmNewCollection.MemoReview.Lines.CommaText
      );
    except
      MessageDlg('с AddToCollection что-то не так', mtError, [mbOK], 0);
    end;

  end;
  dm.clmovdm.cdsUserCollections.Refresh;
end;


procedure TfmUsers.miCollectionEditClick(Sender: TObject);
begin
  fmNewCollection.beTitle.RightButton.Enabled:=False;
  fmNewCollection.beTitle.RightButton.Visible:=False;
  fmNewCollection.beTitle.Text:=dm.clmovdm.cdsUserCollectionsMOVIE_TITLE.Value;

  fmNewCollection.RadioGroup1.ItemIndex:=
              dm.clmovdm.cdsUserCollectionsRATING.Value - 1;

  fmNewCollection.MemoReview.Lines.CommaText:=
              dm.clmovdm.cdsUserCollectionsREVIEW.Value;

  fmNewCollection.ShowModal;

  if fmNewCollection.ModalResult=mrOK then
  begin
    try

      dm.clmovdm.DCOMConnection1.AppServer.smAddToCollection(
        dm.clmovdm.cdsUsersUSER_ID.Value,
        dm.clmovdm.cdsUserCollectionsMOVIE_ID.Value,
        fmNewCollection.RadioGroup1.ItemIndex + 1,
        fmNewCollection.MemoReview.Lines.CommaText
      );
    except
      MessageDlg('с AddToCollection что-то не так', mtError, [mbOK], 0);
    end;

  end;
  dm.clmovdm.cdsUserCollections.Refresh;
end;


procedure TfmUsers.miPurchasesClick(Sender: TObject);
begin
  fmPurchases.Caption:='Покупки пользователя '
                             + dm.clmovdm.cdsUsersNICKNAME.Value;
  fmPurchases.ShowModal;
end;

procedure TfmUsers.miCollectionDeleteClick(Sender: TObject);
begin
  if MessageDlg('Удалить '
    +dm.clmovdm.cdsUserCollectionsMOVIE_TITLE.Value +' из коллекции?',
    mtConfirmation, [mbYes, mbNo], 0)=mrYes then
        dm.clmovdm.DCOMConnection1.AppServer.smDeleteFromCollection(
            dm.clmovdm.cdsUsersUSER_ID.Value,
            dm.clmovdm.cdsUserCollectionsMOVIE_ID.Value
        );

  dm.clmovdm.cdsUserCollections.Refresh;
end;



procedure TfmUsers.miUserAddClick(Sender: TObject);
// добавить пользователя
var hash:string;
begin
  fmNewUser.eName.Text:='';
  fmNewUser.cboxRole.ItemIndex:=0;
  fmNewUser.eEmail.Text:='';
  fmNewUser.ePhone.Text:='';

  fmNewUser.ePassword.Enabled:=True;
  fmNewUser.ePassword.Text:='';

  fmNewUser.Button1.Enabled:=False;
  fmNewUser.Button1.Visible:=False;
  fmNewUser.CheckBox1.Enabled:=True;
  fmNewUser.CheckBox1.Visible:=True;

  fmNewUser.ShowModal;


  if fmNewUser.ModalResult=mrOK then
  begin
    try
      hash := THashMD5.GetHashString(fmNewUser.ePassword.Text);

      dm.clmovdm.DCOMConnection1.AppServer.smAddUser(
        0,
        fmNewUser.eName.Text,
        fmNewUser.cboxRole.Text,
        fmNewUser.eEmail.Text,
        fmNewUser.ePhone.Text,
        hash
      );
    except
      MessageDlg('с AddUsers что-то не так', mtError, [mbOK], 0);
    end;

  end;
  dm.clmovdm.cdsUsers.Refresh;
end;

procedure TfmUsers.miUserEditClick(Sender: TObject);
// изменить пользователя
var hash:string;
begin
  fmNewUser.eName.Text:=dm.clmovdm.cdsUsersNICKNAME.Value;
  fmNewUser.cboxRole.Text:=dm.clmovdm.cdsUsersROLE.Value;
  fmNewUser.eEmail.Text:=dm.clmovdm.cdsUsersEMAIL.Value;
  fmNewUser.ePhone.Text:=dm.clmovdm.cdsUsersPHONE_NUMBER.Value;

  fmNewUser.Label4.Enabled:=False;
  fmNewUser.ePassword.Enabled:=False;
  fmNewUser.ePassword.Text:='';

  fmNewUser.CheckBox1.Enabled:=False;
  fmNewUser.CheckBox1.Visible:=False;
  fmNewUser.Button1.Enabled:=True;
  fmNewUser.Button1.Visible:=True;

  fmNewUser.ShowModal;


  if fmNewUser.ModalResult=mrOK then
  begin
    try
      if fmNewUser.ePassword.Text='' then
      begin
        dm.clmovdm.DCOMConnection1.AppServer.smAddUser(
          dm.clmovdm.cdsUsersUSER_ID.Value,
          fmNewUser.eName.Text,
          fmNewUser.cboxRole.Text,
          fmNewUser.eEmail.Text,
          fmNewUser.ePhone.Text,
          dm.clmovdm.cdsUsersPASSWORD_HASH.Value
        );
      end
      else begin
        hash := THashMD5.GetHashString(fmNewUser.ePassword.Text);

        dm.clmovdm.DCOMConnection1.AppServer.smAddUser(
          dm.clmovdm.cdsUsersUSER_ID.Value,
          fmNewUser.eName.Text,
          fmNewUser.cboxRole.Text,
          fmNewUser.eEmail.Text,
          fmNewUser.ePhone.Text,
          hash
        );
      end;


      hash := THashMD5.GetHashString(fmNewUser.ePassword.Text);
    except
      MessageDlg('с AddUsers что-то не так', mtError, [mbOK], 0);
    end;

  end;
  dm.clmovdm.cdsUsers.Refresh;
end;

procedure TfmUsers.miUserDeleteClick(Sender: TObject);
//удалить пользователя
begin
  if MessageDlg('Удалить '+dm.clmovdm.cdsUsersNICKNAME.Value +'?',
  mtConfirmation, [mbYes, mbNo], 0)=mrYes then
        dm.clmovdm.DCOMConnection1.AppServer.smDeleteUser(
            dm.clmovdm.cdsUsersUSER_ID.Value
        );

  dm.clmovdm.cdsUsers.Refresh;
end;

end.
