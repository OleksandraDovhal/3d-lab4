unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uTMatrix, uTPoint;

type
  TForm1 = class(TForm)
    EditA1: TEdit;
    EditA2: TEdit;
    EditA3: TEdit;
    EditA4: TEdit;
    EditB1: TEdit;
    EditB2: TEdit;
    EditB3: TEdit;
    EditB4: TEdit;
    EditC1: TEdit;
    EditC2: TEdit;
    EditC3: TEdit;
    EditC4: TEdit;
    EditD1: TEdit;
    EditD2: TEdit;
    EditD3: TEdit;
    EditD4: TEdit;
    EditX: TEdit;
    EditY: TEdit;
    EditZ: TEdit;
    Edit01: TEdit;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    LabelA: TLabel;
    LabelB: TLabel;
    LabelC: TLabel;
    LabelD: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LabelM: TLabel;
    LabelR: TLabel;
    LabelX: TLabel;
    ButtonPoints: TButton;
    ButtonPiramid: TButton;
    procedure Button1Click(Sender: TObject);
    procedure ButtonPointsClick(Sender: TObject);
    procedure ButtonPiramidClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Matrix: TMatrix3D;
  m: TPoint3d;
  r: TPoint3d;

implementation

uses Unit2, Unit3;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Matrix:=TMatrix3D.Create(StrToInt(EditA1.Text),StrToInt(EditB1.Text),StrToInt(EditC1.Text),StrToInt(EditD1.Text),
                           StrToInt(EditA2.Text),StrToInt(EditB2.Text),StrToInt(EditC2.Text),StrToInt(EditD2.Text),
                           StrToInt(EditA3.Text),StrToInt(EditB3.Text),StrToInt(EditC3.Text),StrToInt(EditD3.Text),
                           StrToInt(EditA4.Text),StrToInt(EditB4.Text),StrToInt(EditC4.Text),StrToInt(EditD4.Text));
  m.X:=StrToInt(EditX.Text); m.Y:=StrToInt(EditY.Text); m.Z:=StrToInt(EditZ.Text); m.T:=StrToInt(Edit01.Text);
  Matrix.MatrixMultiple(m,r);
  Edit1.Text:=FloatToStr(r.X); Edit2.Text:=FloatToStr(r.Y); Edit3.Text:=FloatToStr(r.Z); Edit4.Text:=FloatToStr(r.T);
end;

procedure TForm1.ButtonPointsClick(Sender: TObject);
begin
  Form2.Show;
end;

procedure TForm1.ButtonPiramidClick(Sender: TObject);
begin
  Form3.Show;
end;

end.
