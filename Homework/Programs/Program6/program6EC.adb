--name : Elena Corpus
--email : elena.corpus@und.edu
--program 6


with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_Io; use Ada.Float_Text_Io;

procedure program is 
type Vector is array (1..100) of Integer;
X: Vector;
Y: Integer;
total : Integer;

--fills the array

function fillarray return Vector is
begin

Ada.Text_IO.Put ("enter positive integers (0-100): ");
for I in 1..100 loop
    Ada.Integer_Text_IO.Get(Y);
    if Y>0 then
        X(I) := Y;
        total := total+1;
    end if;
    if Y<=0 then
        return X;
    end if;

end loop;
return X;
end;


-- average of the array

function average(X: in Vector) return float is
    total: Float := 0.0;
    
    begin
    for I in 1..total loop
        total := total+Float(X(I));
    end loop;

    
    return total/Float(total);
    
    end average;


-- prints array

procedure printarray(X: in out Vector) is
begin
    for I in 1..total loop 
    if X(I)>0 then
        Ada.Integer_Text_IO.Put(X(I));
        New_Line(1);
    end if;
    end loop;
end printarray;


-largest num

function largestnum(X: in Vector) return Integer is
    newnum: Integer:=0;
    begin
    for I in 1..total loop
        if X(I)>newnum then
            newnum:=X(I);
        end if;
    end loop;

return newnum;
end largestnum;


E: Vector := fillarray;
L: Integer :=largestnum(X);
O: float := average(X);

function merge (Left : fillarray; Right : fillarray) return fillarray is
   Result : fillarray (1 .. Left'Length + Right'Length);
   L : Integer := Left'First;
   R : Integer := Right'First;
   I : Integer := Result'First;
begin
   while L <= Left'Last and R <= Right'Last loop
      if Left(L) <= Right(R) then
	 Result(I) := Left(L);
	 L := L + 1;
	 I := I + 1;
      else
	 Result(I) := Right(R);
	 R := R + 1;
	 I := I + 1;
      end if;
   end loop;
   if L <= Left'Last then
      Result(I..Result'Last) := Left(L..Left'Last);
   end if;
   if R <= Right'Last then
      Result(I..Result'Last) := Right(R..Right'Last);
   end if;
   return Result;
end Merge

function sortedarray(E: in Vector) return Vector is
begin
    if E'length <= 1 then
        return E;
    else
        declare
            Middle : integer := (E'First = E'Last) / 2;
            Left : Vector := E (E'First..Middle);
            Right : Vector := E ( Middle + 1.. E'Last);
        begin
            Left := sortedarray(Left);
            Right := sortedarray(Right);
            Return Merge(Left, Right);
        end;
    end if;
end sortedarray;


 
begin


Put_line("before sorted: ");
printarray(X);

New_Line(1);

Put_line("largest number: ");
Ada.Integer_Text_Io.Put(L);

New_Line(1);

Put_line("average number: ");
Ada.float_Text_Io.Put(O);

New_Line(1);

Put_line("sorted: ");
sortedarray(X);

New_Line(1);


end program;