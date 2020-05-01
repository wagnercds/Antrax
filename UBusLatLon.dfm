object FBuscaLatLon: TFBuscaLatLon
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Busca por coordenadas'
  ClientHeight = 117
  ClientWidth = 398
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object rgTipCoord: TRadioGroup
    Left = 0
    Top = 0
    Width = 398
    Height = 43
    Align = alTop
    Caption = 'Tipo de Coordenada'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Graus decimais'
      'Graus e minutos (GPS)'
      'Graus segundos')
    TabOrder = 0
    ExplicitWidth = 340
  end
  object Panel2: TPanel
    Left = 0
    Top = 86
    Width = 398
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 340
    object BitBtn1: TBitBtn
      Left = 121
      Top = 3
      Width = 75
      Height = 25
      Caption = '&OK'
      TabOrder = 0
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 202
      Top = 3
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 43
    Width = 398
    Height = 43
    Align = alClient
    Caption = 'Coordenadas'
    TabOrder = 2
    ExplicitWidth = 340
    object Label1: TLabel
      Left = 80
      Top = 17
      Width = 6
      Height = 13
      Caption = 'X'
    end
    object Label2: TLabel
      Left = 196
      Top = 17
      Width = 6
      Height = 13
      Caption = 'Y'
    end
    object edX: TEdit
      Left = 92
      Top = 14
      Width = 85
      Height = 21
      TabOrder = 0
      OnKeyPress = edXKeyPress
    end
    object edY: TEdit
      Left = 205
      Top = 14
      Width = 85
      Height = 21
      TabOrder = 1
      OnKeyPress = edXKeyPress
    end
  end
end
