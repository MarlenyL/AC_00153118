        org 100h

section .text

        XOR AX, AX ;Limpiando el registro AX
        MOV AL, 1d ;Inicializo el factorial
        MOV SI, 1d ;Inicializo el contador
        JMP factorial
factorial:
        CMP SI,5d
        JA finalizar
        MUL SI
        ADD SI,1d
        JMP factorial

finalizar:
        MOV [20Bh],AL 
        int 20h