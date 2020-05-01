program Antrax;

{%TogetherDiagram 'ModelSupport_Antrax\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Antrax\Antrax\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Antrax\ExtCtrls\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Antrax\USobre\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Antrax\UConfMapa\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Antrax\UBusLatLon\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Antrax\Mapas\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Antrax\main\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Antrax\UBusca\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Antrax\default.txvpck'}
{%TogetherDiagram 'ModelSupport_Antrax\Antrax\default.txvpck'}
{%TogetherDiagram 'ModelSupport_Antrax\ExtCtrls\default.txvpck'}
{%TogetherDiagram 'ModelSupport_Antrax\main\default.txvpck'}
{%TogetherDiagram 'ModelSupport_Antrax\Constsp\default.txaPackage'}
{%TogetherDiagram 'ModelSupport_Antrax\Mapas\default.txvpck'}

uses
  Forms,
  main in 'main.pas' {Fmap},
  USobre in 'USobre.pas' {FSobre},
  UBusca in 'UBusca.pas' {FBusca},
  UBusLatLon in 'UBusLatLon.pas' {FBuscaLatLon},
  UConfMapa in 'UConfMapa.pas' {FConfMapa},
  ExtCtrls in 'ExtCtrls.pas',
  Constsp in 'Constsp.pas',
  UMapInfo in '..\LibOrb\UMapInfo.pas',
  Mapas in '..\LibOrb\Mapas.pas';
  
{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Antrax';
  Application.CreateForm(TFmap, Fmap);
  Application.Run;
end.
