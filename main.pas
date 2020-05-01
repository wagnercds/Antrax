unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, XPMan, Buttons, UMapInfo, Mapas;

type
  TFmap = class(TForm)
    XPManifest1: TXPManifest;
    PageControl1: TPageControl;
    tsMapa: TTabSheet;
    PanMap: TPanel;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    OpenMapa: TOpenDialog;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
  private
    CriPtLoc : boolean;
    { Private declarations }
  public
    { Public declarations }
    MapInfo : TMapInfo;
  end;

var
  Fmap: TFmap;

implementation

uses USobre, UBusca, UBusLatLon, UConfMapa;

{$R *.dfm}

procedure TFmap.FormCreate(Sender: TObject);
begin
   MapInfo := TMapInfo.Create(PanMap.Handle);
   CriPtLoc := false;
end;

procedure TFmap.FormDestroy(Sender: TObject);
begin
   MapInfo.Free;
end;

procedure TFmap.FormResize(Sender: TObject);
begin
   MapInfo.AumentaJanela(PanMap.Width, PanMap.Height);
end;

procedure TFmap.SpeedButton10Click(Sender: TObject);
var
 FSobre : TFSobre;
begin
   FSobre := TFSobre.Create(Self);
   FSobre.ShowModal;
   FSobre.Free;
end;

procedure TFmap.SpeedButton11Click(Sender: TObject);
begin
   MapInfo.UsuMouse;
end;

procedure TFmap.SpeedButton12Click(Sender: TObject);
var
  FBuscaLatLon: TFBuscaLatLon;
  AuxX, AuxY : double;
begin
   FBuscaLatLon := TFBuscaLatLon.Create(Self);
   if FBuscaLatLon.ShowModal = mrOK then
   begin
      AuxX := StrToFloat(FBuscaLatLon.edX.Text);
      AuxY := StrToFloat(FBuscaLatLon.edY.Text);
      case FBuscaLatLon.rgTipCoord.ItemIndex of
         1 : begin
                AuxX := GPSCoordToGDec(AuxX);
                AuxY := GPSCoordToGDec(AuxY);
             end;
         2 : begin
                AuxX := GSecToGDec(AuxX);
                AuxY := GSecToGDec(AuxY);
             end;
      end;
      if CriPtLoc then
         MapInfo.RemovePonto('Loc');
      MapInfo.InsereSimbolo(200,16,clRed,'X:' + FBuscaLatLon.edX.Text + #13 +
                            'Y:' + FBuscaLatLon.edY.Text,'Loc', AuxX, AuxY);
      MapInfo.CentralizaMapa(AuxX, AuxY);
      CriPtLoc := true;
   end;
   FBuscaLatLon.Free;
end;

procedure TFmap.SpeedButton1Click(Sender: TObject);
begin
   MapInfo.UsuZoomMais;
end;

procedure TFmap.SpeedButton2Click(Sender: TObject);
begin
   MapInfo.UsuZoomMenos;
end;

procedure TFmap.SpeedButton3Click(Sender: TObject);
begin
   MapInfo.UsuMoveMapa;
end;

procedure TFmap.SpeedButton4Click(Sender: TObject);
begin
   MapInfo.UsuRegua;
end;

procedure TFmap.SpeedButton5Click(Sender: TObject);
begin
   MapInfo.UsuPedInf;
end;

procedure TFmap.SpeedButton6Click(Sender: TObject);
var
 FBusca : TFBusca;
begin
   FBusca := TFBusca.Create(Self);
   FBusca.cbMapa.Items.AddStrings((MapInfo.LisCidAbr.Objects[0] as TStringList));
   FBusca.cbMapa.ItemIndex := 0;
   FBusca.cbMapaChange(FBusca.cbMapa);
   if FBusca.ShowModal = mrOk then
      MapInfo.UsuLocalizarEnd(
          ((MapInfo.LisCidAbr.Objects[0] as TStringList).Objects[FBusca.cbMapa.ItemIndex] as TTabOpen).EndTab,
           FBusca.cbCampo.Text,FBusca.edBusca.Text);
   FBusca.Free;
end;

procedure TFmap.SpeedButton7Click(Sender: TObject);
var
 FConfMapa : TFConfMapa;
// Aux : TStringList;
begin
   if OpenMapa.Execute then
   begin
      FConfMapa := TFConfMapa.Create(Self);
      FConfMapa.lbMapas.Items := OpenMapa.Files;
      FConfMapa.ShowModal;
      FConfMapa.Free;
{      MapInfo.FecMap('Mapa');
      Aux := TStringList.Create;
      Aux.AddStrings(OpenMapa.Files);
      MapInfo.AbrMap(Aux, 'Mapa');
      MapInfo.VisualizaTabela(Aux.Strings[0]);
      Aux.Free;
      tsMapa.Enabled := true;}
   end;
end;

procedure TFmap.SpeedButton8Click(Sender: TObject);
begin
   MapInfo.FecMap('Mapa');
   if CriPtLoc then
      MapInfo.RemovePonto('Loc');
   tsMapa.Enabled := false;
end;

end.
