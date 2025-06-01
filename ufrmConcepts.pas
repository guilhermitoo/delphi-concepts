unit ufrmConcepts;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, System.Math,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, System.Threading,
  Vcl.ExtCtrls;

type
  TfrmConcepts = class(TForm)
    pgc1: TPageControl;
    tsThreads: TTabSheet;
    btnThreadStart: TButton;
    pnl1: TPanel;
    lbl1: TLabel;
    pb1: TProgressBar;
    Panel1: TPanel;
    lbl2: TLabel;
    pb2: TProgressBar;
    Panel2: TPanel;
    lbl3: TLabel;
    pb3: TProgressBar;
    Panel3: TPanel;
    lbl4: TLabel;
    pb4: TProgressBar;
    Panel4: TPanel;
    lbl5: TLabel;
    pb5: TProgressBar;
    tsLeetCode: TTabSheet;
    pgc2: TPageControl;
    tsTwoSums: TTabSheet;
    redt1: TRichEdit;
    pnl2: TPanel;
    btnTwoSum: TButton;
    edtInputTwoSum: TEdit;
    edtOutputTwoSum: TEdit;
    edtTargetTwoSum: TEdit;
    tsLC3: TTabSheet;
    Panel5: TPanel;
    btnLC3: TButton;
    edtInputLC3: TEdit;
    edtOutputLC3: TEdit;
    RichEdit1: TRichEdit;
    procedure btnThreadStartClick(Sender: TObject);
    procedure btnTwoSumClick(Sender: TObject);
    procedure btnLC3Click(Sender: TObject);
  private
    { Private declarations }
    procedure ProcessProgressBar(ANumber : Integer);
    function twoSum (nums : TArray<Integer>; target : Integer) : TArray<Integer>;
    function lengthOfLongestSubstring( input : String ) : Integer;
  public
    { Public declarations }
  end;

var
  frmConcepts: TfrmConcepts;

implementation

uses
  uUtils;

{$R *.dfm}

procedure TfrmConcepts.btnLC3Click(Sender: TObject);
begin
  edtOutputLC3.Text := lengthOfLongestSubstring(edtInputLC3.Text).ToString;
end;

procedure TfrmConcepts.btnThreadStartClick(Sender: TObject);
begin
  // Threads
  ProcessProgressBar(1);
  ProcessProgressBar(2);
  ProcessProgressBar(3);
  ProcessProgressBar(4);
  ProcessProgressBar(5);
end;

procedure TfrmConcepts.btnTwoSumClick(Sender: TObject);
begin
  edtOutputTwoSum.Text := IntegerArrayToString(TwoSum(StringToIntegerArray(edtInputTwoSum.Text),StrToIntDef(edtTargetTwoSum.Text,-1)));
end;

function TfrmConcepts.lengthOfLongestSubstring(input: String): Integer;
var
  r : string;
  size : integer;
  I: Integer;

  function reduceStr(s,c : String) : String;
  begin
    if s.Contains(c) then
    begin
      s := Copy(s,2,Length(s)-1);
      Result := reduceStr(s,c);
    end
    else
      Result := s;
  end;
begin
  // biggest substring
  r := '';
  size := 0;
  for I := 1 to Length(input) do
  begin
    r := reduceStr(r,input[i]);
    r := r + input[i];
    if Length(r) > size then
      size := Length(r);
  end;

  Result := size;
end;

procedure TfrmConcepts.ProcessProgressBar(ANumber: Integer);
var
  pb : TProgressBar;
  lbl : TLabel;
begin
  pb := TProgressBar(FindComponent('pb'+IntToStr(ANumber)));
  lbl := TLabel(FindComponent('lbl'+IntToStr(ANumber)));

  pb.Max := 100;
  pb.Min := 0;
  pb.Position := 0;
  pb.Step := 1;

  lbl.Caption := 'Position: 0';

  Randomize;

  TTask.Run(procedure
    var
      iSleep : Integer;
    begin
      while(pb.Position < pb.Max) do
      begin
        iSleep := RandomRange(50,250);
        Sleep(iSleep);
        pb.StepIt;
        TThread.Synchronize(nil,procedure
        begin
          lbl.Caption := 'Position: '+IntToStr(pb.Position);
        end);
      end;
    end);
end;

function TfrmConcepts.twoSum(nums : TArray<Integer>; target : Integer) : TArray<Integer>;
var
  r, i : Integer;
begin
  r := 0;
  for i := 0 to target.Size-1 do
  begin
    if (r + nums[i]) = target then
      Break;
    r := nums[i]
  end;
  Result := [i-1,i];
end;

end.
