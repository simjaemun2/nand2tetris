
// function SimpleFunction.test 2
(SimpleFunction.test)
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

// add
@SP
AM = M - 1
D = M
@SP
AM = M - 1
M = M + D
@SP
M = M + 1

// not
@SP
AM = M - 1
M = !M
@SP
M = M + 1

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

// add
@SP
AM = M - 1
D = M
@SP
AM = M - 1
M = M + D
@SP
M = M + 1

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
