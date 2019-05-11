@256
D = A
@SP
M = D
@RET_bootstrap4
D = A
@SP
A = M
M = D
@SP
M = M + 1
@LCL
D = M
@SP
A = M
M = D
@SP
M = M + 1
@ARG
D = M
@SP
A = M
M = D
@SP
M = M + 1
@THIS
D = M
@SP
A = M
M = D
@SP
M = M + 1
@THAT
D = M
@SP
A = M
M = D
@SP
M = M + 1
@SP
D = M
@0
D = D - A
@5
D = D - A
@ARG
M = D
@SP
D = M
@LCL
M = D
@Sys.init
0;JMP
(RET_bootstrap4)

// function Sys.init 0
(Sys.init)

// push constant 4000 // test THIS and THAT context save
@4000
D = A
@SP
A = M
M = D
@SP
M = M + 1

// pop pointer 0
@SP
AM = M - 1
D = M
@THIS
M = D

// push constant 5000
@5000
D = A
@SP
A = M
M = D
@SP
M = M + 1

// pop pointer 1
@SP
AM = M - 1
D = M
@THAT
M = D

// call Sys.main 0
@RET_Sys.init85
D = A
@SP
A = M
M = D
@SP
M = M + 1
@LCL
D = M
@SP
A = M
M = D
@SP
M = M + 1
@ARG
D = M
@SP
A = M
M = D
@SP
M = M + 1
@THIS
D = M
@SP
A = M
M = D
@SP
M = M + 1
@THAT
D = M
@SP
A = M
M = D
@SP
M = M + 1
@SP
D = M
@0
D = D - A
@5
D = D - A
@ARG
M = D
@SP
D = M
@LCL
M = D
@Sys.main
0;JMP
(RET_Sys.init85)

// pop temp 1
@SP
AM = M - 1
D = M
@6
M = D

// label LOOP
(Sys.init$LOOP)

// goto LOOP
@Sys.init$LOOP
0;JMP

// function Sys.main 5
(Sys.main)
@SP
A = M
M = 0
@SP
M = M + 1
@SP
A = M
M = 0
@SP
M = M + 1
@SP
A = M
M = 0
@SP
M = M + 1
@SP
A = M
M = 0
@SP
M = M + 1
@SP
A = M
M = 0
@SP
M = M + 1

// push constant 4001
@4001
D = A
@SP
A = M
M = D
@SP
M = M + 1

// pop pointer 0
@SP
AM = M - 1
D = M
@THIS
M = D

// push constant 5001
@5001
D = A
@SP
A = M
M = D
@SP
M = M + 1

// pop pointer 1
@SP
AM = M - 1
D = M
@THAT
M = D

// push constant 200
@200
D = A
@SP
A = M
M = D
@SP
M = M + 1

// pop local 1
@1
D = A
@LCL
A = M
D = A + D
@LCL
M = D
@SP
AM = M - 1
D = M
@LCL
A = M
M = D
@1
D = A
@LCL
A = M
D = A - D
@LCL
M = D

// push constant 40
@40
D = A
@SP
A = M
M = D
@SP
M = M + 1

// pop local 2
@2
D = A
@LCL
A = M
D = A + D
@LCL
M = D
@SP
AM = M - 1
D = M
@LCL
A = M
M = D
@2
D = A
@LCL
A = M
D = A - D
@LCL
M = D

// push constant 6
@6
D = A
@SP
A = M
M = D
@SP
M = M + 1

// pop local 3
@3
D = A
@LCL
A = M
D = A + D
@LCL
M = D
@SP
AM = M - 1
D = M
@LCL
A = M
M = D
@3
D = A
@LCL
A = M
D = A - D
@LCL
M = D

// push constant 123
@123
D = A
@SP
A = M
M = D
@SP
M = M + 1

// call Sys.add12 1
@RET_Sys.main297
D = A
@SP
A = M
M = D
@SP
M = M + 1
@LCL
D = M
@SP
A = M
M = D
@SP
M = M + 1
@ARG
D = M
@SP
A = M
M = D
@SP
M = M + 1
@THIS
D = M
@SP
A = M
M = D
@SP
M = M + 1
@THAT
D = M
@SP
A = M
M = D
@SP
M = M + 1
@SP
D = M
@1
D = D - A
@5
D = D - A
@ARG
M = D
@SP
D = M
@LCL
M = D
@Sys.add12
0;JMP
(RET_Sys.main297)

// pop temp 0
@SP
AM = M - 1
D = M
@5
M = D

// push local 0
@0
D = A
@LCL
A = M
D = A + D
A = D
D = M
@SP
A = M
M = D
@SP
M = M + 1

// push local 1
@1
D = A
@LCL
A = M
D = A + D
A = D
D = M
@SP
A = M
M = D
@SP
M = M + 1

// push local 2
@2
D = A
@LCL
A = M
D = A + D
A = D
D = M
@SP
A = M
M = D
@SP
M = M + 1

// push local 3
@3
D = A
@LCL
A = M
D = A + D
A = D
D = M
@SP
A = M
M = D
@SP
M = M + 1

// push local 4
@4
D = A
@LCL
A = M
D = A + D
A = D
D = M
@SP
A = M
M = D
@SP
M = M + 1

// add
@SP
AM = M - 1
D = M
@SP
AM = M - 1
M = M + D
@SP
M = M + 1

// add
@SP
AM = M - 1
D = M
@SP
AM = M - 1
M = M + D
@SP
M = M + 1

// add
@SP
AM = M - 1
D = M
@SP
AM = M - 1
M = M + D
@SP
M = M + 1

// add
@SP
AM = M - 1
D = M
@SP
AM = M - 1
M = M + D
@SP
M = M + 1

// return
@LCL // FRAME = LCL
D = M
@FRAME
M = D
@FRAME
D = M
@5
D = D - A
A = D
D = M
@ret
M = D
@SP
AM = M - 1
D = M // *ARG = pop()
@ARG
A = M
M = D
@ARG // SP = ARG + 1
D = M+1
@SP
M = D
@FRAME
D = M
@1
D = D - A
A = D
D = M
@THAT
M = D
@FRAME
D = M
@2
D = D - A
A = D
D = M
@THIS
M = D
@FRAME
D = M
@3
D = D - A
A = D
D = M
@ARG
M = D
@FRAME
D = M
@4
D = D - A
A = D
D = M
@LCL
M = D
@ret
A = M
0;JMP

// function Sys.add12 0
(Sys.add12)

// push constant 4002
@4002
D = A
@SP
A = M
M = D
@SP
M = M + 1

// pop pointer 0
@SP
AM = M - 1
D = M
@THIS
M = D

// push constant 5002
@5002
D = A
@SP
A = M
M = D
@SP
M = M + 1

// pop pointer 1
@SP
AM = M - 1
D = M
@THAT
M = D

// push argument 0
@0
D = A
@ARG
A = M
D = A + D
A = D
D = M
@SP
A = M
M = D
@SP
M = M + 1

// push constant 12
@12
D = A
@SP
A = M
M = D
@SP
M = M + 1

// add
@SP
AM = M - 1
D = M
@SP
AM = M - 1
M = M + D
@SP
M = M + 1

// return
@LCL // FRAME = LCL
D = M
@FRAME
M = D
@FRAME
D = M
@5
D = D - A
A = D
D = M
@ret
M = D
@SP
AM = M - 1
D = M // *ARG = pop()
@ARG
A = M
M = D
@ARG // SP = ARG + 1
D = M+1
@SP
M = D
@FRAME
D = M
@1
D = D - A
A = D
D = M
@THAT
M = D
@FRAME
D = M
@2
D = D - A
A = D
D = M
@THIS
M = D
@FRAME
D = M
@3
D = D - A
A = D
D = M
@ARG
M = D
@FRAME
D = M
@4
D = D - A
A = D
D = M
@LCL
M = D
@ret
A = M
0;JMP
