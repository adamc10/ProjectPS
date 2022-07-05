unit NewPrice;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Vcl.Grids, Vcl.DBGrids, dm;

type
  TfmNewPrice = class(TForm)
    eTitle: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ePrice: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    purtypeID : Integer;
  end;

var
  fmNewPrice: TfmNewPrice;

implementation

{$R *.dfm}

procedure TfmNewPrice.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  purtypeID:= dm.clmovdm.cdsPurtypesPURTYPE_ID.Value;
end;

end.
