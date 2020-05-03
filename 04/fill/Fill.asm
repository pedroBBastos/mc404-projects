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

// criando simbolo 'fimDaTela' de controle para o fim da tela
@24575 // 16384 (@SCREEN) + 8192 (256 linhas vezes 32 palavras por linha) - 1
D=A
@fimDaTela
M=D

@filled
M=0


(LOOP)

    @KBD 
    D=M // atribuindo o valor do que esta vindo do teclado ao registrador D

    @LOOP
    D; JEQ // voltar ao loop caso haja nada vindo do teclado
    
    //***********************
    //  pensar em algo para limpar a tela
    //***********************

    // ver como criar constantes -> para o fim da tela

    @SCREEN
    D=A
    @currentWord
    M=D

(BLACKENING)

    //pegando endereço de memorias dos 16 pixels atuais
    @currentWord
    D=M
    
    //voltando A para apontar para os 16 pixels atuais para pinta-los
    A=D
    // 0000000000000000 para 1111111111111111 (pintando de preto todos os 16 bits)
    M=!M

    // atualizando @currentWord para depois pintar os proximos 16 pixels
    @currentWord
    M=D+1
    
    //operacoes para verificar se cheguei no final da tela
    A=D // voltando A para apontar para a tela
    D=A
    @fimDaTela
    D=M-D
    @BLACKENING
    D; JGT
    
    @LOOP
    0; JMP