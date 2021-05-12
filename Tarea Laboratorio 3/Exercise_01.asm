        org 100h

section .text

        XOR AX, AX ;Limpiando el registro AX
        ;funcionara como contador
        MOV SI,0d
        ;Iteracion
        jmp sumar
sumar:
        CMP SI, 8d ;Compara si ya paso los 8 digitos del carnet
        JE promedio
        ADD AL, carnet[SI]
        ADD SI,1d
        jmp sumar
promedio:
        MOV BL, 8d ; digitos del carnet
        DIV BL; Se realiza el promedio y este se guarda en AL y el residuo en AH

        MOV [20Ah],AL ;Muevo a la direccion indicada

        int 20h;

section .data
        ;carnet: 00153118
        carnet DB 0,0,1,5,3,1,1,8