unit NewUser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfmNewUser = class(TForm)
    Имя: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    eName: TEdit;
    eEmail: TEdit;
    ePhone: TEdit;
    Label1: TLabel;
    cboxRole: TComboBox;
    ePassword: TEdit;
    Label4: TLabel;
    CheckBox1: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Button1: TButton;
    procedure FormActivate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmNewUser: TfmNewUser;

implementation

{$R *.dfm}


procedure TfmNewUser.Button1Click(Sender: TObject);
begin
  if MessageDlg('Установить новый пароль?',
      mtConfirmation, [mbYes, mbNo], 0)=mrYes then
  begin
    fmNewUser.ePassword.Enabled:=True;
    fmNewUser.ePassword.Text:='';
    fmNewUser.Label4.Enabled:=True;

    fmNewUser.Button1.Enabled:=False;
    fmNewUser.Button1.Visible:=False;
    fmNewUser.CheckBox1.Enabled:=True;
    fmNewUser.CheckBox1.Visible:=True;
  end;
end;

procedure TfmNewUser.CheckBox1Click(Sender: TObject);
begin
  if fmNewUser.ePassword.PasswordChar=#0 then
    fmNewUser.ePassword.PasswordChar:='*'
  else if fmNewUser.ePassword.PasswordChar='*' then
    fmNewUser.ePassword.PasswordChar:=#0;

end;

procedure TfmNewUser.FormActivate(Sender: TObject);
begin
    fmNewUser.ePassword.PasswordChar:='*';
    CheckBox1.Checked:=False;
end;

end.
