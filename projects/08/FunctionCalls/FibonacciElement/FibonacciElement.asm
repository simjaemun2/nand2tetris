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

// function Main.fibonacci 0
(Main.fibonacci)

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

// push constant 2
@2
D = A
@SP
A = M
M = D
@SP
M = M + 1

// lt // checks if n<2
@SP
AM = M - 1
D = M
@SP
AM = M - 1
D = M - D
@TRUE0
D; JLT
@SP
A = M
M = 0
@END0
0; JMP
(TRUE0)
@SP
A = M
M = -1
(END0)
@SP
M = M + 1

// if-goto IF_TRUE
@SP
AM = M - 1
D = M
@Main.fibonacci$IF_TRUE
D;JNE

// goto IF_FALSE
@Main.fibonacci$IF_FALSE
0;JMP

// label IF_TRUE // if n<2, return n
(Main.fibonacci$IF_TRUE)

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

// label IF_FALSE // if n>=2, returns fib(n-2)+fib(n-1)
(Main.fibonacci$IF_FALSE)

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

// push constant 2
@2
D = A
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

// call Main.fibonacci 1 // computes fib(n-2)
@RET_Main.fibonacci213
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
@Main.fibonacci
0;JMP
(RET_Main.fibonacci213)

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

// push constant 1
@1
D = A
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

// call Main.fibonacci 1 // computes fib(n-1)
@RET_Main.fibonacci294
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
@Main.fibonacci
0;JMP
(RET_Main.fibonacci294)

// add // returns fib(n-1) + fib(n-2)
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

// function Sys.init 0
(Sys.init)

// push constant 4
@4
D = A
@SP
A = M
M = D
@SP
M = M + 1

// call Main.fibonacci 1 // computes the 4'th fibonacci element
@RET_Sys.init422
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
@Main.fibonacci
0;JMP
(RET_Sys.init422)

// label WHILE
(Sys.init$WHILE)

// goto WHILE // loops infinitely
@Sys.init$WHILE
0;JMP
