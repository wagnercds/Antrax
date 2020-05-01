unit UConfMapa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Spin, Math, ExtCtrls;

type
  TFConfMapa = class(TForm)
    GroupBox1: TGroupBox;
    rbNovMap: TRadioButton;
    rgExiMapa: TRadioButton;
    edNovaArea: TEdit;
    ComboBox1: TComboBox;
    Panel1: TPanel;
    lbMapas: TListBox;
    SpeedButton1: TSpeedButton;
    sbSetaCima: TSpeedButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Label3: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    CheckBox1: TCheckBox;
    ComboBox2: TComboBox;
    cbFontes: TComboBox;
    ColorBox2: TColorBox;
    SpinEdit1: TSpinEdit;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ColorBox1: TColorBox;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    OpenMapa: TOpenDialog;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbSetaCimaClick(Sender: TObject);
    procedure lbMapasDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lbMapasEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure lbMapasStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure FormCreate(Sender: TObject);
  private
    PosMapa : integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConfMapa: TFConfMapa;

implementation

{$R *.dfm}

procedure TFConfMapa.FormCreate(Sender: TObject);
begin
   cbFontes.Items := Screen.Fonts;
   cbFontes.ItemIndex := 0;
   lbMapas.ItemIndex := 0;
end;

procedure TFConfMapa.lbMapasDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
var
 Aux : TPoint;
begin
   Aux.X := X;
   Aux.Y := Y;
   if lbMapas.ItemAtPos(Aux, false) = PosMapa then
      Accept := false
   else
      Accept := true;
end;

procedure TFConfMapa.lbMapasEndDrag(Sender, Target: TObject; X, Y: Integer);
var
 Pos : integer;
 Aux : TPoint;
begin
   Aux.X := X;
   Aux.Y := Y;
   Pos := lbMapas.ItemAtPos(Aux, true);
   if Pos > -1 then
      lbMapas.Items.Move(PosMapa, Pos);
end;

procedure TFConfMapa.lbMapasStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
   PosMapa := lbMapas.ItemIndex;
end;

procedure TFConfMapa.sbSetaCimaClick(Sender: TObject);
var
 Aux : integer;
begin
   if lbMapas.ItemIndex > 0 then
   begin
      Aux := lbMapas.ItemIndex - 1;
      lbMapas.Items.Move(lbMapas.ItemIndex, Aux);
      lbMapas.ItemIndex := Aux;
   end;
end;

procedure TFConfMapa.SpeedButton1Click(Sender: TObject);
var
 Aux : integer;
begin
   if lbMapas.ItemIndex <> (lbMapas.Items.Count - 1) then
   begin
      Aux := lbMapas.ItemIndex + 1;
      lbMapas.Items.Move(lbMapas.ItemIndex, Aux);
      lbMapas.ItemIndex := Aux;
   end;
end;

procedure TFConfMapa.SpeedButton2Click(Sender: TObject);
begin
   lbMapas.DeleteSelected;   
end;

procedure TFConfMapa.SpeedButton3Click(Sender: TObject);
begin
   if OpenMapa.Execute then
      lbMapas.Items.AddStrings(OpenMapa.Files);
end;

end.
