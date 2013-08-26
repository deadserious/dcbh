// The MIT License (MIT)
//
// Copyright (c) 2013 by Sivv LLC
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

unit codeburger.helper;

interface

uses System.SysUtils, System.Classes, System.Generics.Collections;

type
  TStringsHelper = class helper for TStrings
  public
    procedure eachIndex(&do : TProc<integer>);
    procedure each(&do : TProc<string>);
    procedure eachObject(&do : TProc<string, TObject>);
    function has(s : string) : boolean;
  end;

implementation

{ TStringsHelper }

procedure TStringsHelper.each(&do: TProc<string>);
var
  i : integer;
begin
  for i := 0 to self.Count-1 do
  begin
    &do(Self[i]);
  end;
end;

procedure TStringsHelper.eachIndex(&do: TProc<integer>);
var
  i : integer;
begin
  for i := 0 to self.Count-1 do
  begin
    &do(i);
  end;
end;

procedure TStringsHelper.eachObject(&do: TProc<string, TObject>);
var
  i : integer;
begin
  for i := 0 to self.Count-1 do
  begin
    &do(Self[i], Objects[i]);
  end;
end;

function TStringsHelper.has(s: string): boolean;
begin
  result := IndexOf(s) >= 0;
end;

end.
