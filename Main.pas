unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Movies, Purtypes;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Users, ReportUserPurchase, ReportMoviePurchase;

procedure TForm1.N1Click(Sender: TObject);
begin
  fmMovies.ShowModal;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
  fmUsers.ShowModal;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  fmPurtypes.ShowModal;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
  fmReportUserPurchase.ShowModal;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
  fmReportMoviePurchase.ShowModal;
end;

end.
