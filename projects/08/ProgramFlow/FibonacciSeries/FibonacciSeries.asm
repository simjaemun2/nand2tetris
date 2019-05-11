
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

// pop pointer 1 // that = argument[1]
@SP
AM = M - 1
D = M
@THAT
M = D

// push constant 0
@0
D = A
@SP
A = M
M = D
@SP
M = M + 1

// pop that 0 // first element in the series = 0
@0
D = A
@THAT
A = M
D = A + D
@THAT
M = D
@SP
AM = M - 1
D = M
@THAT
A = M
M = D
@0
D = A
@THAT
A = M
D = A - D
@THAT
M = D

// push constant 1
@1
D = A
@SP
A = M
M = D
@SP
M = M + 1

// pop that 1 // second element in the series = 1
@1
D = A
@THAT
A = M
D = A + D
@THAT
M = D
@SP
AM = M - 1
D = M
@THAT
A = M
M = D
@1
D = A
@THAT
A = M
D = A - D
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

// pop argument 0 // num_of_elements -= 2 (first 2 elements are set)
@0
D = A
@ARG
A = M
D = A + D
@ARG
M = D
@SP
AM = M - 1
D = M
@ARG
A = M
M = D
@0
D = A
@ARG
A = M
D = A - D
@ARG
M = D

// label MAIN_LOOP_START
(MAIN_LOOP_START)

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

// if-goto COMPUTE_ELEMENT // if num_of_elements > 0, goto COMPUTE_ELEMENT
@SP
AM = M - 1
D = M
@COMPUTE_ELEMENT
D;JNE

// goto END_PROGRAM // otherwise, goto END_PROGRAM
@END_PROGRAM
0;JMP

// label COMPUTE_ELEMENT
(COMPUTE_ELEMENT)

// push that 0
@0
D = A
@THAT
A = M
D = A + D
A = D
D = M
@SP
A = M
M = D
@SP
M = M + 1

// push that 1
@1
D = A
@THAT
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

// pop that 2 // that[2] = that[0] + that[1]
@2
D = A
@THAT
A = M
D = A + D
@THAT
M = D
@SP
AM = M - 1
D = M
@THAT
A = M
M = D
@2
D = A
@THAT
A = M
D = A - D
@THAT
M = D

// push pointer 1
@THAT
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

// add
@SP
AM = M - 1
D = M
@SP
AM = M - 1
M = M + D
@SP
M = M + 1

// pop pointer 1 // that += 1
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

// pop argument 0 // num_of_elements--
@0
D = A
@ARG
A = M
D = A + D
@ARG
M = D
@SP
AM = M - 1
D = M
@ARG
A = M
M = D
@0
D = A
@ARG
A = M
D = A - D
@ARG
M = D

// goto MAIN_LOOP_START
@MAIN_LOOP_START
0;JMP

// label END_PROGRAM
(END_PROGRAM)
