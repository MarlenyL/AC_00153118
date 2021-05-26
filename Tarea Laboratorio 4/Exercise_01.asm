        org 100h

section .text

        XOR AX, AX ;Limpiando el registro AX
        XOR BX,BX;Limpiando el registro BX
        XOR SI,SI;Contador para el arreglo
        XOR BP,BP;Contador para pares
        XOR DI,DI;Contador para impares
        call separar
        int 20h

separar:
        CMP SI, 10d ;Compara si ya paso los 10 digitos del carnet
        JE exit
        MOV AH, 0d; Limpio el registro
        MOV DL, number[SI]
        MOV AL, number[SI]
        INC SI
        MOV BL, 2d 
        DIV BL
        CMP AH, 0d ;compara si el residuo es cero
        je par
        jnp impar

par:
        MOV [0300h+BP],DL
        inc BP
        jmp separar
impar:
        MOV [0320h+DI],DL
        inc DI
        jmp separar

exit:
        ret ;retonar al hilo principal
section .data
        number DB 10,9,8,7,6,5,4,3,2,1