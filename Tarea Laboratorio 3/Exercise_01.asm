org 100h

section .text

        XOR AX, AX ; Limpiando el registro AX
        //carnet: 00153118
        MOV byte[200h], 0d
        MOV byte[201h], 0d
        MOV byte[202h], 1d
        MOV byte[203h], 5d
        MOV byte[204h], 3d
        MOV byte[205h], 1d
        MOV byte[206h], 1d
        MOV byte[207h], 8d


        int 20h;