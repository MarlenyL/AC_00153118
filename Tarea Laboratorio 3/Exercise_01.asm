        org 100h

section .text

        XOR AX, AX ;Limpiando el registro AX
        ;carnet: 00153118
        MOV byte[200h], 0d
        MOV byte[201h], 0d
        MOV byte[202h], 1d
        MOV byte[203h], 5d
        MOV byte[204h], 3d
        MOV byte[205h], 1d
        MOV byte[206h], 1d
        MOV byte[207h], 8d

        ;funcionara como contador
        MOV SI,0d
        ;Iteracion
        jmp sumar
sumar:
        CMP SI, 8d ;Compara si ya paso los 8 digitos del carnet
        JE promedio
        ADD AL, [200h + SI]
        ADD SI,1d
        jmp sumar
promedio:
        MOV BL, 8d ; digitos del carnet
        DIV BL; Se realiza el promedio y este se guarda en AL y el residuo en AH

        MOV [20Ah],AL ;Muevo a la direccion indicada

        int 20h;