unit Function_Add;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  {$ENDIF}
  Base, TeEngine, TeeFunci, Series, TeeProcs, Chart;

type
  TAddForm = class(TBaseForm)
    Series1: TBarSeries;
    Series2: TLineSeries;
    CheckBox1: TCheckBox;
    TeeFunction1: TAddTeeFunction;
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TAddForm.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then TeeFunction1.Period:=2
                       else TeeFunction1.Period:=0; { all points }
end;

procedure TAddForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(6);
end;

initialization
  RegisterClass(TAddForm);
end.
