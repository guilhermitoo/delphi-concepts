unit uUtils;

interface

uses System.SysUtils, StrUtils;

function StringToIntegerArray(const InputString: string): TArray<Integer>;
function IntegerArrayToString(IntArray : TArray<Integer>) : String;

implementation

uses
  System.Classes;

function StringToIntegerArray(const InputString: string): TArray<Integer>;
var
  sl : TStringList;
  I: Integer;
begin
  sl := TStringList.Create;
  try
    sl.Delimiter := ',';
    sl.DelimitedText := ReplaceStr(ReplaceStr(InputString,'[',''),']','');
    SetLength(Result,sl.count);
    for I := 0 to sl.Count-1 do
    begin
      Result[I] := StrToInt(sl.Strings[I]);
    end;
  finally
    sl.Free;
  end;
end;

function IntegerArrayToString(IntArray : TArray<Integer>) : String;
var
  I: Integer;
begin
  Result := '[';
  for I := 0 to Length(IntArray)-1 do
  begin
    if I <> 0 then
      Result := Result + ',';
    Result := Result + IntArray[I].ToString;
  end;
  Result := Result + ']';
end;

end.
