// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.



(LOOP)
// store colour in D based on KBD's content
@KBD
D=M
@KEEP_WHITE
D;JEQ
D=-1 // black
(KEEP_WHITE)

// store the colour in COLOUR variable
@COLOUR
M=D

// make IDX point at SCREEN
@SCREEN
D=A
@IDX
M=D

(COLOURING_LOOP)
// we're done if we're past the screen
@IDX
D=M
@KBD // KBD is just past the screen's end
D=D-A
@LOOP
D;JGE

// colour single pixel:
@COLOUR
D=M
@IDX
A=M
M=D

// move to the next pixel
D=A+1
@IDX
M=D

// close the colouring loop
@COLOURING_LOOP
0;JMP
