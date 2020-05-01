unit UBusca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Main, UMapInfo;

type
  TFBusca = class(TForm)
    Label1: TLabel;
    cbMapa: TComboBox;
    Label2: TLabel;
    cbCampo: TComboBox;
    Label3: TLabel;
    edBusca: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure cbMapaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TFBusca.cbMapaChange(Sender: TObject);
var
 Aux : TStringList;
begin
   Aux := TStringList.Create;
   (Owner as TFmap).MapInfo.LisCampTab(
     (((Owner as TFmap).MapInfo.LisCidAbr.Objects[0] as TStringList).Objects[cbMapa.ItemIndex] as TTabOpen).EndTab,
       Aux);
   cbCampo.Items.Clear;
   cbCampo.Items.AddStrings(Aux);
   cbCampo.ItemIndex := 0;
   Aux.Free;
end;

end.
