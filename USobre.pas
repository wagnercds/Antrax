unit USobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Buttons, ShellApi;

type
  TFSobre = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lbSite: TLabel;
    Image2: TImage;
    BitBtn1: TBitBtn;
    procedure lbSiteClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure lbSiteMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TFSobre.BitBtn1Click(Sender: TObject);
begin
   Close;
end;

procedure TFSobre.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   lbSite.Font.Style := [];
   lbSite.Font.Color := clGreen;
end;

procedure TFSobre.lbSiteClick(Sender: TObject);
begin
   ShellExecute(Handle,'open','www.cerebro.v10.com.br',nil,nil,SW_SHOWMAXIMIZED);
end;

procedure TFSobre.lbSiteMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   lbSite.Font.Style := [fsUnderline];
   lbSite.Font.Color := clBlue;
end;

end.
