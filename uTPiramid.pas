unit uTPiramid;

interface

uses
  uTPoint, uTMatrix;

type
  TPiramid=class
    FA: TPoint3D;
    FB: TPoint3D;
    FC: TPoint3D;
    FD: TPoint3D;
    FCenter: TPoint3D;
    FEdge: Real;
    constructor Create(Center: TPoint3D; Edge: Real);
    procedure Init(Center: TPoint3D; Edge: Real);
    procedure Rotate(Alpha,Beta,Gamma: Real);
  end;

  TCube=class(TPiramid)
    FA1: TPoint3D;
    FB1: TPoint3D;
    FC1: TPoint3D;
    FD1: TPoint3D;
    constructor Create(Center: TPoint3D; Edge: Real);
    procedure Init(Center: TPoint3D; Edge: Real);
    procedure Rotate(Alpha,Beta,Gamma: Real);
  end;

implementation

var RotateMatrix: TMatrix3D;

{ TPiramid }

constructor TPiramid.Create(Center: TPoint3D; Edge: Real);
begin
	Init(Center,Edge)
end;

procedure TPiramid.Init(Center: TPoint3D; Edge: Real);
begin
	FCenter:=Center;

	FA.X:=-Edge/2							+Center.X;
	FA.Y:=-(Edge/(2*sqrt(3)))	+Center.Y;
	FA.Z:=0										+Center.Z;
	FA.T:=1;

	FB.X:=0										+Center.X;
	FB.Y:=Edge/sqrt(3)				+Center.Y;
	FB.Z:=0										+Center.Z;
	FB.T:=1;

	FC.X:=Edge/2              +Center.X;
	FC.Y:=FA.Y;               //Можно не считать
	FC.Z:=0										+Center.Z;
	FC.T:=1;

	FD.X:=0										+Center.X;
	FD.Y:=0										+Center.Y;
	FD.Z:=FB.Y 			 -Center.Y+Center.Z; //высота такая же только повернутая на 90 градусов
	FD.T:=1;
end;

procedure TPiramid.Rotate(Alpha, Beta, Gamma: Real);
begin
	Alpha:=Alpha*Pi/180;
	Beta:=Beta*Pi/180;
	Gamma:=Gamma*Pi/180;
	
	RotateMatrix:=TMatrix3D.Create(1,0,0,-FCenter.X,
																 0,1,0,-FCenter.Y,
																 0,0,1,-FCenter.Z,
																 0,0,0,1);

	RotateMatrix.MatrixMultiple(FA,FA);
  RotateMatrix.MatrixMultiple(FB,FB);
  RotateMatrix.MatrixMultiple(FC,FC);
  RotateMatrix.MatrixMultiple(FD,FD);

  //RotateMatrix.Init(Cos(Beta)*Cos(Gamma)								  								,-Cos(Beta)*Sin(Gamma)								 								 ,Sin(Beta)			   		 ,FCenter.X,
	//									Sin(Alpha)*Sin(Beta)*Cos(Gamma)+Cos(Alpha)*Sin(Gamma) ,-Sin(Alpha)*Sin(Beta)*Sin(Gamma)+Cos(Alpha)*Cos(Gamma),-Sin(Alpha)*Cos(Beta),FCenter.Y,
	//									-Sin(Beta)*Cos(Alpha)*Sin(Gamma)+Sin(Alpha)*Sin(Gamma),Sin(Beta)*Cos(Alpha)*Sin(Gamma)+Sin(Alpha)*Cos(Gamma) ,Cos(Alpha)*Cos(Beta) ,FCenter.Z,
	//									0																									    ,0																										 ,0										 ,1);
  RotateMatrix.Init(Cos(Beta)*Cos(Gamma) ,Sin(Beta)*Sin(Alpha)-Cos(Beta)*Sin(Gamma)*Cos(Alpha),Cos(Beta)*Sin(Gamma)*Sin(Alpha)+Sin(Beta)*Cos(Alpha),FCenter.X,
  									Sin(Gamma)					 ,Cos(Gamma)*Cos(Alpha)																,-Cos(Gamma)*Sin(Alpha)															 ,FCenter.Y,
  									-Sin(Beta)*Cos(Gamma),Sin(Beta)*Sin(Gamma)*Cos(Alpha)+Cos(Beta)*Sin(Alpha),Cos(Beta)*Cos(Alpha)-Sin(Beta)*Sin(Gamma)*Sin(Alpha),FCenter.Z,
  									0										 ,0																										,0																									 ,1);
	RotateMatrix.MatrixMultiple(FA,FA);
  RotateMatrix.MatrixMultiple(FB,FB);
  RotateMatrix.MatrixMultiple(FC,FC);
  RotateMatrix.MatrixMultiple(FD,FD);
end;

{ TCube }

constructor TCube.Create(Center: TPoint3D; Edge: Real);
begin
  Init(Center,Edge);
end;

procedure TCube.Init(Center: TPoint3D; Edge: Real);
var E: Real;
begin
	FCenter:=Center;
	E:=Edge/2;

	FA.X:=Center.X-E;
	FA.Y:=Center.Y-E;
	FA.Z:=Center.Z+E;
	FA.T:=1;

	FB.X:=Center.X-E;
	FB.Y:=Center.Y+E;
	FB.Z:=Center.Z+E;
	FB.T:=1;

	FC.X:=Center.X+E;
	FC.Y:=Center.Y+E;
	FC.Z:=Center.Z+E;
	FC.T:=1;

	FD.X:=Center.X+E;
	FD.Y:=Center.Y-E;
	FD.Z:=Center.Z+E;
	FD.T:=1;

	FA1.X:=Center.X-E;
	FA1.Y:=Center.Y-E;
	FA1.Z:=Center.Z-E;
	FA1.T:=1;

	FB1.X:=Center.X-E;
	FB1.Y:=Center.Y+E;
	FB1.Z:=Center.Z-E;
	FB1.T:=1;

	FC1.X:=Center.X+E;
	FC1.Y:=Center.Y+E;
	FC1.Z:=Center.Z-E;
	FC1.T:=1;

	FD1.X:=Center.X+E;
	FD1.Y:=Center.Y-E;
	FD1.Z:=Center.Z-E;
	FD1.T:=1;

end;

procedure TCube.Rotate(Alpha, Beta, Gamma: Real);
begin
	Alpha:=Alpha*Pi/180;
	Beta:=Beta*Pi/180;
	Gamma:=Gamma*Pi/180;
	
	RotateMatrix:=TMatrix3D.Create(1,0,0,-FCenter.X,
																 0,1,0,-FCenter.Y,
																 0,0,1,-FCenter.Z,
																 0,0,0,1);

	RotateMatrix.MatrixMultiple(FA,FA);
  RotateMatrix.MatrixMultiple(FB,FB);
  RotateMatrix.MatrixMultiple(FC,FC);
  RotateMatrix.MatrixMultiple(FD,FD);
	RotateMatrix.MatrixMultiple(FA1,FA1);
  RotateMatrix.MatrixMultiple(FB1,FB1);
  RotateMatrix.MatrixMultiple(FC1,FC1);
  RotateMatrix.MatrixMultiple(FD1,FD1);
  //RotateMatrix.Init(Cos(Beta)*Cos(Gamma)								  								,-Cos(Beta)*Sin(Gamma)								 								 ,Sin(Beta)			   		 ,FCenter.X,
	//									Sin(Alpha)*Sin(Beta)*Cos(Gamma)+Cos(Alpha)*Sin(Gamma) ,-Sin(Alpha)*Sin(Beta)*Sin(Gamma)+Cos(Alpha)*Cos(Gamma),-Sin(Alpha)*Cos(Beta),FCenter.Y,
	//									-Sin(Beta)*Cos(Alpha)*Sin(Gamma)+Sin(Alpha)*Sin(Gamma),Sin(Beta)*Cos(Alpha)*Sin(Gamma)+Sin(Alpha)*Cos(Gamma) ,Cos(Alpha)*Cos(Beta) ,FCenter.Z,
	//									0																									    ,0																										 ,0										 ,1);
  RotateMatrix.Init(Cos(Beta)*Cos(Gamma) ,Sin(Beta)*Sin(Alpha)-Cos(Beta)*Sin(Gamma)*Cos(Alpha),Cos(Beta)*Sin(Gamma)*Sin(Alpha)+Sin(Beta)*Cos(Alpha),FCenter.X,
  									Sin(Gamma)					 ,Cos(Gamma)*Cos(Alpha)																,-Cos(Gamma)*Sin(Alpha)															 ,FCenter.Y,
  									-Sin(Beta)*Cos(Gamma),Sin(Beta)*Sin(Gamma)*Cos(Alpha)+Cos(Beta)*Sin(Alpha),Cos(Beta)*Cos(Alpha)-Sin(Beta)*Sin(Gamma)*Sin(Alpha),FCenter.Z,
  									0										 ,0																										,0																									 ,1);
	RotateMatrix.MatrixMultiple(FA,FA);
  RotateMatrix.MatrixMultiple(FB,FB);
  RotateMatrix.MatrixMultiple(FC,FC);
  RotateMatrix.MatrixMultiple(FD,FD);
  RotateMatrix.MatrixMultiple(FA1,FA1);
  RotateMatrix.MatrixMultiple(FB1,FB1);
  RotateMatrix.MatrixMultiple(FC1,FC1);
  RotateMatrix.MatrixMultiple(FD1,FD1);
end;

end.
