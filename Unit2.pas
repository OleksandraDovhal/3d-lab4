unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Math, uTMatrix, uTPoint;

type
  TForm2 = class(TForm)
    Image1: TImage;
    EditX: TEdit;
    EditY: TEdit;
    Button1: TButton;
    EditAlpha: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Init;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  X,Y,T: Real;
  Point: TPoint2D;
  RotationMatrix: TMatrix2D;
  Alpha,Beta,Gamma: Integer;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  Init;
  with Image1.Canvas do
    begin
      Pen.Color:=clRed;
      Brush.Color:=clRed;
      Ellipse(Round(Point.X-2),Round(Point.Y-2),Round(Point.X+2),Round(Point.Y+2));
      FloodFill(Round(Point.X),Round(Point.Y),clRed,fsBorder);
    end;
end;

procedure TForm2.Init;
begin
  Point.X:=StrToInt(EditX.Text);
  Point.Y:=StrToInt(EditY.Text);
  Point.T:=1;

  Alpha:=StrToInt(EditAlpha.Text);
  
  RotationMatrix:=TMatrix2D.Create(Cos(Alpha*Pi/180),-Sin(Alpha*Pi/180),0,
                                   Sin(Alpha*Pi/180),Cos(Alpha*Pi/180) ,0,
                                   0                ,0                 ,1);

  RotationMatrix.MatrixMultiple(Point,Point);

  Point.X:=Point.X+100;
  Point.Y:=Point.Y+100;
end;

end.
