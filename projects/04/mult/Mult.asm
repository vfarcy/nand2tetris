// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/03/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//                                           ^-- DUD, srsly...

// The most brute-force of brute force multiplications.
// More serious implementation would use register with
// smaller absolute value for looping.
// Any serious architectrue would provide a shift right operation
// to allow O(log(N))-complexity implementation

// XXX: apparently the exercise asked only to multiply the positive
// integers, so I did a bit of extra work. Oh, well... ;-)

// initialize the accumulator to 0
@2
M=0

// let RAM[3] = RAM[0]...
@0
D=M
@3
M=D

// ...and RAM[4] = RAM[1]
@1
D=M
@4
M=D

// skip the sign changing if RAM[4] >= 0
@4
D=M
@LOOP
D;JGE

// do the sign changing
@3
M=-M
@4
M=-M

// while(RAM[4] >= 0) {
(LOOP)
@4
D=M
@END
D;JLE

// RAM[2] += RAM[3]
@3
D=M
@2
M=M+D

// RAM[4] -= 1
@4
M=M-1

// } // end of while
@LOOP
0;JMP
(END)

// finish with the infinite loop
@END
0;JMP
