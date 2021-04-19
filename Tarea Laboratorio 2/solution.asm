        org     100h

        section .text


        mov byte[200h], 'R'
        mov byte[201h], 'M'
        mov byte[202h], 'L'
        mov byte[203h], 'S'

;Direccionamiento directo
        mov AL,[200h]

;Direcionamiento directo por registro
        mov BL,[201h]
        mov CL,BL

;Direccionamiento indirecto base más índice    
        mov BX,200h
        mov SI,002h
        mov Dl,[BX+SI]

;direccionamiento relativo por registro.
        mov DI, [BX+003h]
        
        int 20h