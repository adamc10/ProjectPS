unit Purtypes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Menus, Vcl.Grids,
  Vcl.DBGrids, dm, NewPurtype;

type
  TfmPurtypes = class(TForm)
    MainMenu1: TMainMenu;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
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
  fmPurtypes: TfmPurtypes;

implementation

{$R *.dfm}

procedure TfmPurtypes.FormActivate(Sender: TObject);
begin
  DataSource1.DataSet:=dm.clmovdm.cdsPurtypes;
end;

procedure TfmPurtypes.N1Click(Sender: TObject);
begin
// add
  fmNewPurtype.eMaxQuality.Text:='';
  fmNewPurtype.eDuration.Text:='';
  fmNewPurtype.ShowModal;

  if fmNewPurtype.ModalResult=mrOK then
  begin
    try
      dm.clmovdm.DCOMConnection1.AppServer.smAddPurtype(
        0,
        fmNewPurtype.eMaxQuality.Text,
        StrToInt(fmNewPurtype.eDuration.Text)
      );
    except
      MessageDlg('с AddPurtype что-то не так', mtError, [mbOK], 0);
    end;

  end;
  dm.clmovdm.cdsPurtypes.Refresh;
end;

procedure TfmPurtypes.N2Click(Sender: TObject);
begin
//edit
  fmNewPurtype.eMaxQuality.Text:=clmovdm.cdsPurtypesMAX_QUALITY.Value;
  fmNewPurtype.eDuration.Text:=IntToStr(clmovdm.cdsPurtypesDURATION.Value);
  fmNewPurtype.ShowModal;

  if fmNewPurtype.ModalResult=mrOK then
  begin
    try
      dm.clmovdm.DCOMConnection1.AppServer.smAddPurtype(
        clmovdm.cdsPurtypesPURTYPE_ID.Value,
        fmNewPurtype.eMaxQuality.Text,
        StrToInt(fmNewPurtype.eDuration.Text)
      );
    except
      MessageDlg('с AddPurtype что-то не так', mtError, [mbOK], 0);
    end;

  end;
  dm.clmovdm.cdsPurtypes.Refresh;
end;

procedure TfmPurtypes.N3Click(Sender: TObject);
begin
//delete
  if MessageDlg(
      'Удалить вариант '+ dm.clmovdm.cdsPurtypesMAX_QUALITY.Value
      +'p на срок ' + IntToStr(dm.clmovdm.cdsPurtypesDURATION.Value)+' дней?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then
    dm.clmovdm.DCOMConnection1.AppServer.smDeletePurtype(
        dm.clmovdm.cdsPurtypesPURTYPE_ID.Value
    );

  dm.clmovdm.cdsPurtypes.Refresh;
end;

end.
