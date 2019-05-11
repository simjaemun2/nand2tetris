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

// function Class1.set 0
(Class1.set)

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

// pop static 0
@SP
AM = M - 1
D = M
@Class1.0
M = D

// push argument 1
@1
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

// pop static 1
@SP
AM = M - 1
D = M
@Class1.1
M = D

// push constant 0
@0
D = A
@SP
A = M
M = D
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

// function Class1.get 0
(Class1.get)

// push static 0
@Class1.0
D = M
@SP
A = M
M = D
@SP
M = M + 1

// push static 1
@Class1.1
D = M
@SP
A = M
M = D
@SP
M = M + 1

// sub
@SP
AM = M - 1
D = M
@SP
AM = M - 1
M = M - D
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

// function Class2.set 0
(Class2.set)

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

// pop static 0
@SP
AM = M - 1
D = M
@Class2.0
M = D

// push argument 1
@1
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

// pop static 1
@SP
AM = M - 1
D = M
@Class2.1
M = D

// push constant 0
@0
D = A
@SP
A = M
M = D
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

// function Class2.get 0
(Class2.get)

// push static 0
@Class2.0
D = M
@SP
A = M
M = D
@SP
M = M + 1

// push static 1
@Class2.1
D = M
@SP
A = M
M = D
@SP
M = M + 1

// sub
@SP
AM = M - 1
D = M
@SP
AM = M - 1
M = M - D
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

// function Sys.init 0
(Sys.init)

// push constant 6
@6
D = A
@SP
A = M
M = D
@SP
M = M + 1

// push constant 8
@8
D = A
@SP
A = M
M = D
@SP
M = M + 1

// call Class1.set 2
@RET_Sys.init455
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
@2
D = D - A
@5
D = D - A
@ARG
M = D
@SP
D = M
@LCL
M = D
@Class1.set
0;JMP
(RET_Sys.init455)

// pop temp 0 // Dumps the return value
@SP
AM = M - 1
D = M
@5
M = D

// push constant 23
@23
D = A
@SP
A = M
M = D
@SP
M = M + 1

// push constant 15
@15
D = A
@SP
A = M
M = D
@SP
M = M + 1

// call Class2.set 2
@RET_Sys.init528
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
@2
D = D - A
@5
D = D - A
@ARG
M = D
@SP
D = M
@LCL
M = D
@Class2.set
0;JMP
(RET_Sys.init528)

// pop temp 0 // Dumps the return value
@SP
AM = M - 1
D = M
@5
M = D

// call Class1.get 0
@RET_Sys.init585
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
@Class1.get
0;JMP
(RET_Sys.init585)

// call Class2.get 0
@RET_Sys.init636
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
@Class2.get
0;JMP
(RET_Sys.init636)

// label WHILE
(Sys.init$WHILE)

// goto WHILE
@Sys.init$WHILE
0;JMP
