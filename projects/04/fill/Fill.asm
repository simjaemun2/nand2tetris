// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

    @8192 // 512 * 256 / 16
    D = A
    @pixel_bound
    M = D
(LOOP)
    @i
    M = 0
(INNER)
    @KBD
    D = M
    @WHITE
    D; JEQ
//(BLACK)
    @i
    D = M
    @SCREEN
    A = A + D // move i-th pixel of SCREEN
    M = -1
    @NEXT
    0; JMP
(WHITE)
    @i
    D = M
    @SCREEN
    A = A + D // move i-th pixel of SCREEN
    M = 0
    @NEXT
    0; JMP
(NEXT)
    @i
    MD = M + 1 // i = i + 1, D = i
    @pixel_bound
    D = D - M
    @LOOP
    D; JEQ // pixel_bound - i == 0 goto LOOP else(pixel_bound - i > 0) goto INNER
    @INNER
    0;JMP
