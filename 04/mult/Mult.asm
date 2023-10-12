// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

//set i and r2 to 0
//start a for loop where at first i = 0 but at every iteration i gets incremented, when i = r1, finish the program
//every iteration of the loop keep adding the value of r0 to r2

//i = 0;
@i  
M = 0  //RAM[M] = 0
//R2 = 0
@R2
M = 0

(LOOP)
    // if i == R1 goto END
	@i  
	D = M //D = RAM[M], 0 on the first iteration
	@R1 
	D = D - M //data at register i - data at register r1
	@i
	M = M + 1;
	@END
	D;JEQ

	@R0
	D = M
	@R2
	M = M + D

	@LOOP
	0; JMP

(END)
	@END
	0;JMP

	