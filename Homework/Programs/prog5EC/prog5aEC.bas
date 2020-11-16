5 REM Name: Elena Corpus
10 REM Program number: 5
15 REM Part: 1
20 REM email: elena.corpus@und.edu
25 INPUT "ENTER THE COST OF PRODUCT ", COST
30 PRINT "COST OF PRODUCT "; COST 
35 INPUT "HOW MUCH DID YOU PAY? ", PAYMENT
40 PRINT "YOU PAID ", PAYMENT
45 if PAYMENT < COST then goto 75
50 let CHANGE = PAYMENT - COST
55 if PAYMENT > COST then goto 80
60 DOLLARS = CHANGE - (CHANGE mod 1) goto 85
65 if CHANGE >= 1 then goto 170
70 let CHANGE = CHANGE - DOLLARS goto 90
75 print "NOT ENOUGH PAYMENT" goto 190
80 print "YOUR CHANGE : ", CHANGE goto 60
85 print "DOLLARS : ", DOLLARS goto 70
90 let QUARTERS = (CHANGE - ((CHANGE mod 0.25)))/0.25
95 if CHANGE >= 0.25 then goto 105
100 if CHANGE >= 0.25 then goto 110
105 print "quarters: ", QUARTERS
110 let CHANGE = CHANGE - (QUARTERS * 0.25)
115 let DIMES = (CHANGE - ((CHANGE mod 0.1))) / 0.1
120 if CHANGE >= 0.1 then goto 130
125 if CHANGE >= 0.1 then goto 135
130 print "dimes: ", DIMES
135 let CHANGE = CHANGE - (DIMES * 0.1)
140 let NICKLES = (CHANGE - ((CHANGE mod 0.05))) / 0.05
145 if CHANGE >= 0.05 then goto 155
150 if CHANGE >= 0.05 then goto 160
155 print "nickles: ", NICKLES
160 let CHANGE = CHANGE - (NICKLES * 0.05)
165 let PENNIES = (CHANGE - ((CHANGE mod 0.01)))/0.01
170 if CHANGE >= 0.01 then goto 180
175 if CHANGE >= 0.01 then goto 185
180 print "pennies: ", PENNIES
185 let CHANGE = CHANGE - (PENNIES * 0.01)
190 system