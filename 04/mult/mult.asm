// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

@count
M=0 // contador para o loop

@R2
M=0 // zerando a saida

(CHECK)

    //checando se R0 é 0
    D=0
    @R0
    D=D-M
    @END
    D; JEQ

    //checando se R1 é 0
    D=0
    @R1
    D=D-M
    @END
    D; JEQ


(LOOP)
    @R0
    D=M //atribuindo R0 no registrador D

    @R2
    M=M+D // somando R0 em R2

    //devo repetir o processo acima R1 vezes

    @count
    M=M+1 // incrementando a contagem
    D=M // atribuindo contagem no registrador D

    @R1
    D=D-M // atribuindo R1 no registrador D

    @LOOP
    D; JNE

(END)