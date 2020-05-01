unit UBusLatLon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFBuscaLatLon = class(TForm)
    rgTipCoord: TRadioGroup;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edX: TEdit;
    edY: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edXKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TFBuscaLatLon.edXKeyPress(Sender: TObject; var Key: Char);
begin
   if (not ((Key in ['0'..'9']) or (Key = #8) or (Key = DecimalSeparator) or (Key = '-'))) or
      ((Key = DecimalSeparator) and (Pos(DecimalSeparator,(Sender as TEdit).Text) > 0)) or
      ((Key = '-') and  ((Sender as TEdit).GetTextLen > 0)) then
      Key := #0;
end;

procedure TFBuscaLatLon.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   if ModalResult = MROK then
   begin
      if (edX.GetTextLen = 0) and (edY.GetTextLen = 0) then
      begin
         Application.MessageBox('É obrigatório digitar as coordenadas !',
                                'Atenção',MB_OK + MB_IconError);
         edX.SetFocus;
         CanClose := false;
      end;
   end;
   
end;

end.
