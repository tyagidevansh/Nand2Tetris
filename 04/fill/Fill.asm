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

//set n to 8192
//if keyboard input is 0, set screen to white by setting all the screen registers one by one to M = 0
//else set screen to black by setting all the screen registers to M = -1
//do the color changing by setting ram[screen + i] = value and increment i each time


(START)
    @8192
    D = A //load 8192 into D
    @n
    M = D //set n register to D (8192)

    @i
    M = 0 //set i to 0

(LOOP)
    @i
    D = M //load value of i into D
    @n
    D = D - M //if n == i, goto end
    @END
    D;JEQ

    @KBD
    D = M //if keyboard is 0 ie no input, jump to white else continue
    @WHITE
    D;JEQ

(BLACK)
    @i
    D = M
    @SCREEN
    A = A + D //set current register to start of screen + current value of i
    M = -1 //set that register to -1
    @INCREMENT
    0;JMP

(WHITE)
    @i
    D = M   
    @SCREEN
    A = A + D
    M = 0  //set screen registers to 0 like black no need to jump to increment its right there

(INCREMENT)
    @i
    M = M + 1
    @LOOP //increment i and jump back to the loop
    0;JMP

(END)
    @START
    0;JMP