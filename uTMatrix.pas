unit uTMatrix;

interface

uses uTPoint;

type

    TMatrix2D=class
  private
    FArr: array [1..3,1..3] of Real;
  public
    constructor Create(a1,b1,c1, a2,b2,c2, a3,b3,c3: Real);
    procedure Init(a1,b1,c1, a2,b2,c2, a3,b3,c3: Real);
    procedure MatrixMultiple(m: TPoint2D; var r: TPoint2D);
  end;

  TMatrix3D=class
  private
    FArr: array [1..4,1..4] of Real;
  public
    constructor Create(a1,b1,c1,d1, a2,b2,c2,d2, a3,b3,c3,d3, a4,b4,c4,d4: Real);
    procedure Init(a1,b1,c1,d1, a2,b2,c2,d2, a3,b3,c3,d3, a4,b4,c4,d4: Real);
    procedure MatrixMultiple(m: TPoint3D; var r: TPoint3D);
  end;

implementation

{ TMatrix2D }

constructor TMatrix2D.Create(a1,b1,c1, a2,b2,c2, a3,b3,c3: Real);
begin
  Init(a1,b1,c1, a2,b2,c2, a3,b3,c3);
end;

procedure TMatrix2D.Init(a1,b1,c1, a2,b2,c2, a3,b3,c3: Real);
begin
  FArr[1][1]:=a1;  FArr[2][1]:=b1;  FArr[3][1]:=c1;
  FArr[1][2]:=a2;  FArr[2][2]:=b2;  FArr[3][2]:=c2;
  FArr[1][3]:=a3;  FArr[2][3]:=b3;  FArr[3][3]:=c3;
end;

procedure TMatrix2D.MatrixMultiple(m: TPoint2D; var r: TPoint2D);
begin
  r.X:= FArr[1][1]*m.X + FArr[2][1]*m.Y + FArr[3][1]*m.T;
  r.Y:= FArr[1][2]*m.X + FArr[2][2]*m.Y + FArr[3][2]*m.T;
  r.T:= FArr[1][3]*m.X + FArr[2][3]*m.Y + FArr[3][3]*m.T;
end;

{ TMatrix3D }

constructor TMatrix3D.Create(a1,b1,c1,d1, a2,b2,c2,d2, a3,b3,c3,d3, a4,b4,c4,d4: Real);
begin
  Init(a1,b1,c1,d1, a2,b2,c2,d2, a3,b3,c3,d3, a4,b4,c4,d4);
end;

procedure TMatrix3D.Init(a1,b1,c1,d1, a2,b2,c2,d2, a3,b3,c3,d3, a4,b4,c4,d4: Real);
begin
  FArr[1][1]:=a1;  FArr[2][1]:=b1;  FArr[3][1]:=c1;  FArr[4][1]:=d1;
  FArr[1][2]:=a2;  FArr[2][2]:=b2;  FArr[3][2]:=c2;  FArr[4][2]:=d2;
  FArr[1][3]:=a3;  FArr[2][3]:=b3;  FArr[3][3]:=c3;  FArr[4][3]:=d3;
  FArr[1][4]:=a4;  FArr[2][4]:=b4;  FArr[3][4]:=c4;  FArr[4][4]:=d4;
end;

procedure TMatrix3D.MatrixMultiple(m: TPoint3D; var r: TPoint3D);
begin
  r.X:= FArr[1][1]*m.X + FArr[2][1]*m.Y + FArr[3][1]*m.Z + FArr[4][1]*m.T;
  r.Y:= FArr[1][2]*m.X + FArr[2][2]*m.Y + FArr[3][2]*m.Z + FArr[4][2]*m.T;
  r.Z:= FArr[1][3]*m.X + FArr[2][3]*m.Y + FArr[3][3]*m.Z + FArr[4][3]*m.T;
  r.T:= FArr[1][4]*m.X + FArr[2][4]*m.Y + FArr[3][4]*m.Z + FArr[4][4]*m.T;
end;

end.
