DIM row(1 TO 16) AS INTEGER, column(1 TO 16) AS INTEGER, cell(1 TO 16) AS SINGLE
row(1) = 400
row(2) = 465
row(3) = 530
row(4) = 595
row(5) = 400
row(6) = 465
row(7) = 530
row(8) = 595
row(9) = 400
row(10) = 465
row(11) = 530
row(12) = 595
row(13) = 400
row(14) = 465
row(15) = 530
row(16) = 595
column(1) = 60
column(2) = 60
column(3) = 60
column(4) = 60
column(5) = 125
column(6) = 125
column(7) = 125
column(8) = 125
column(9) = 190
column(10) = 190
column(11) = 190
column(12) = 190
column(13) = 255
column(14) = 255
column(15) = 255
column(16) = 255
match = 0
try = 0

RANDOMIZE TIMER
FOR n = 1 TO 16 STEP 2
 cell(n) = RND
 cell(n + 1) = cell(n)
NEXT

FOR n = 1 TO 1000 + INT(RND * 1000)

 DO
  a = INT(RND * 16) + 1
  b = INT(RND * 16) + 1
 LOOP UNTIL a <> b

 temp! = cell(a)
 cell(a) = cell(b)
 cell(b) = temp!

NEXT

SCREEN 12

COLOR (7)

FOR n = 1 TO 16
 CIRCLE (row(n), column(n)), 28, 7
NEXT

GetInput:
LOCATE 1, 1
INPUT a, b

IF a + b = 0 THEN END

IF a = b THEN GOTO GetInput

IF a < 1 OR a > 16 THEN GOTO GetInput

IF b < 1 OR b > 16 THEN GOTO GetInput

IF cell(a) < 0 THEN GOTO GetInput

IF cell(b) < 0 THEN GOTO GetInput

LOCATE 20, 48
try = try + 1

temp! = cell(a)
FOR n = 1 TO 27 STEP 3
 DO WHILE temp! < 1
 temp! = temp! * 10
 LOOP
 a% = INT(temp!) MOD 7 + 1
 temp! = temp! - INT(temp!)
 CIRCLE (row(a), column(a)), n, a%
 CIRCLE (row(a), column(a)), n + 1, a%
 CIRCLE (row(a), column(a)), n + 2, a%
NEXT

temp! = cell(b)
FOR n = 1 TO 27 STEP 3
 DO WHILE temp! < 1
 temp! = temp! * 10
 LOOP
 a% = INT(temp!) MOD 7 + 1
 temp! = temp! - INT(temp!)
 CIRCLE (row(b), column(b)), n, a%
 CIRCLE (row(b), column(b)), n + 1, a%
 CIRCLE (row(b), column(b)), n + 2, a%
NEXT

PRINT "Try: "; try

SLEEP 3

IF cell(a) = cell(b) THEN
 cell(a) = -cell(a)
 cell(b) = -cell(b)
 match = match + 2
 IF match = 14 THEN
  PRINT "GAME OVER"
  SLEEP
  END
 END IF
ELSE
 FOR n = 27 TO 1 STEP -1
  CIRCLE (row(a), column(a)), n, 0
  CIRCLE (row(b), column(b)), n, 0
 NEXT
END IF

GOTO GetInput
