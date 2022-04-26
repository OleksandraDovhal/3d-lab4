unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, uTPoint, uTPiramid;

type
  TForm3 = class(TForm)
    Image1: TImage;
    EditX: TEdit;
    EditY: TEdit;
    EditZ: TEdit;
    EditEdge: TEdit;
    Button1: TButton;
    EditAlpha: TEdit;
    EditBeta: TEdit;
    EditGamma: TEdit;
    ButtonAlphaPlus: TButton;
    ButtonAlphaMinus: TButton;
    ButtonBetaPlus: TButton;
    ButtonBetaMinus: TButton;
    ButtonGammaPlus: TButton;
    ButtonGammaMinus: TButton;
    cbb1: TComboBox;
    procedure Clear;
    procedure DrawPoint(x,y: Integer);
    procedure DrawEdge(A,B: TPoint3D);
    procedure DrawPiramid;
    procedure DrawCube;
    procedure Button1Click(Sender: TObject);
    procedure ButtonAlphaPlusClick(Sender: TObject);
    procedure ButtonAlphaMinusClick(Sender: TObject);
    procedure ButtonBetaPlusClick(Sender: TObject);
    procedure ButtonBetaMinusClick(Sender: TObject);
    procedure ButtonGammaPlusClick(Sender: TObject);
    procedure ButtonGammaMinusClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  Point: TPoint3D;
  Piramid: TPiramid;
  Cube: TCube;

implementation

{$R *.dfm}

{ TForm3 }

procedure TForm3.Clear;
var Rect: TRect;
begin
    Rect.Left:=0;
    Rect.Right:=Image1.Width;
    Rect.Top:=0;
    Rect.Bottom:=Image1.Height;
    Image1.Canvas.Brush.Color:=ClWhite;
    Image1.Canvas.FillRect(Rect);
end;

procedure TForm3.DrawPoint(x,y: Integer);
begin
  Image1.Canvas.Pen.Color:=clRed;
  Image1.Canvas.Brush.Color:=clRed;
  Image1.Canvas.Ellipse(X-2,-(Y-2)+Image1.Height,X+2,-(Y+2)+Image1.Height);
  Image1.Canvas.FloodFill(X,-Y+Image1.Height,clRed,fsBorder);
end;

procedure TForm3.DrawEdge(A, B: TPoint3D);
begin
  Image1.Canvas.Pen.Color:=clBlack;
  Image1.Canvas.MoveTo(Round(A.X),-Round(A.Z)+Image1.Height);
  Image1.Canvas.LineTo(Round(B.X),-Round(B.Z)+Image1.Height);
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
  //Init
  Point.X:=StrToInt(EditX.Text);
  Point.Y:=StrToInt(EditY.Text);
  Point.Z:=StrToInt(EditZ.Text);
  Point.T:=1;
  if cbb1.ItemIndex=0 then DrawPiramid
  else DrawCube;
end;

procedure TForm3.ButtonAlphaPlusClick(Sender: TObject);
begin
  EditAlpha.Text:=IntToStr(StrToInt(EditAlpha.Text)+10);
  Button1.Click;
end;

procedure TForm3.ButtonAlphaMinusClick(Sender: TObject);
begin
  EditAlpha.Text:=IntToStr(StrToInt(EditAlpha.Text)-10);
  Button1.Click;
end;

procedure TForm3.ButtonBetaPlusClick(Sender: TObject);
begin
  EditBeta.Text:=IntToStr(StrToInt(EditBeta.Text)+10);
  Button1.Click;
end;

procedure TForm3.ButtonBetaMinusClick(Sender: TObject);
begin
  EditBeta.Text:=IntToStr(StrToInt(EditBeta.Text)-10);
  Button1.Click;
end;

procedure TForm3.ButtonGammaPlusClick(Sender: TObject);
begin
  EditGamma.Text:=IntToStr(StrToInt(EditGamma.Text)+10);
  Button1.Click;
end;

procedure TForm3.ButtonGammaMinusClick(Sender: TObject);
begin
  EditGamma.Text:=IntToStr(StrToInt(EditGamma.Text)-10);
  Button1.Click;
end;

procedure TForm3.DrawCube;
begin
  //Cube
  Cube:=TCube.Create(Point,StrToInt(EditEdge.Text));
  Cube.Rotate(StrToFloat(EditAlpha.Text),StrToFloat(EditBeta.Text),StrToFloat(EditGamma.Text));
  //Drawing
  Clear;                     

  DrawEdge(Cube.FA,Cube.FB);
  DrawEdge(Cube.FB,Cube.FC);
  DrawEdge(Cube.FC,Cube.FD);
  DrawEdge(Cube.FD,Cube.FA);
  DrawEdge(Cube.FA1,Cube.FB1);
  DrawEdge(Cube.FB1,Cube.FC1);
  DrawEdge(Cube.FC1,Cube.FD1);
  DrawEdge(Cube.FD1,Cube.FA1);
  DrawEdge(Cube.FA,Cube.FA1);
  DrawEdge(Cube.FB,Cube.FB1);
  DrawEdge(Cube.FC,Cube.FC1);
  DrawEdge(Cube.FD,Cube.FD1);

  DrawPoint(Round(Cube.FA.X),Round(Cube.FA.Z));
  DrawPoint(Round(Cube.FB.X),Round(Cube.FB.Z));
  DrawPoint(Round(Cube.FC.X),Round(Cube.FC.Z));
  DrawPoint(Round(Cube.FD.X),Round(Cube.FD.Z));
  DrawPoint(Round(Cube.FA1.X),Round(Cube.FA1.Z));
  DrawPoint(Round(Cube.FB1.X),Round(Cube.FB1.Z));
  DrawPoint(Round(Cube.FC1.X),Round(Cube.FC1.Z));
  DrawPoint(Round(Cube.FD1.X),Round(Cube.FD1.Z));
end;

procedure TForm3.DrawPiramid;
begin
  //Piramid
  Piramid:=TPiramid.Create(Point,StrToInt(EditEdge.Text));
  Piramid.Rotate(StrToFloat(EditAlpha.Text),StrToFloat(EditBeta.Text),StrToFloat(EditGamma.Text));
  //Drawing
  Clear;

  DrawEdge(Piramid.FA,Piramid.FB);
  DrawEdge(Piramid.FB,Piramid.FC);
  DrawEdge(Piramid.FC,Piramid.FA);
  DrawEdge(Piramid.FA,Piramid.FD);
  DrawEdge(Piramid.FB,Piramid.FD);
  DrawEdge(Piramid.FC,Piramid.FD);

  DrawPoint(Round(Piramid.FA.X),Round(Piramid.FA.Z));
  DrawPoint(Round(Piramid.FB.X),Round(Piramid.FB.Z));
  DrawPoint(Round(Piramid.FC.X),Round(Piramid.FC.Z));
  DrawPoint(Round(Piramid.FD.X),Round(Piramid.FD.Z));
end;

end.
