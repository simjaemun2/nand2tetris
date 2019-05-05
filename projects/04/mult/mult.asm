// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.


// R[2] = R[0] * R[1]
// i = 1
// while(i <= R[1])
//   R[2] += R[0]
//   i += 1

    @2
    M = 0
    @i
    M = 1

(LOOP)
    @i
    D = M // D = i
    @1 // M = R[1]
    D = D - M // D = i - R[1]
    @END
    D; JGT // If i - R[1] > 0 goto END
    @0 // M = R[0]
    D = M // D = R[0]
    @2 // M = R[2]
    M = M + D // R[2] = R[2] + R[0]
    @i // M = i
    M = M + 1 // i = i + 1
    @LOOP
    0; JMP
(END)
    @END
    0; JMP

