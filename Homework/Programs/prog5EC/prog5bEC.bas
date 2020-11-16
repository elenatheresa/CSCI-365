5 REM Name: Elena Corpus
10 REM Program number: 5
15 REM Part: 2
20 REM email: elena.corpus@und.edu
25 let x = 1
30 let mess$ = ""
35 if x = 100 then goto 65
40 if x mod 3 = 0 then goto 70
45 if x mod 5 = 0 then goto 75
50 PRINT mess$
55 if mess$ = "" then goto 80
60 x = x + 1 goto 30
65 system 
70 mess$ = "fizz" goto 45
75 mess$ = mess$ + "buzz" goto 50
80 PRINT x goto 60
