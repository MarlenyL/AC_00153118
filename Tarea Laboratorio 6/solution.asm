
org  100h

    section .text

    ;Limpio las variables
    call limpiar

    ;Llamo al modo texto o grafico
    call Modotexto

    ; print txt1
    mov DX, txt1
    call EscribirCadena

    ; input frase
    mov BP, frase
    call LeerCadena

    mov word cx, 10d
    xor DI, DI
    jmp Comparar

section .data

    clave db "maravillas503"
    txt1 db "Digite clave: ", "$"
    txt2 db "BIENVENIDO$"
    txt3 db "INCORRECTO$"
    frase  times  20   db " "



; FUNCIONES
Modotexto:; modo texto: 80 columnas por 25 filas. 16 colores. 8 páginas
    mov AH, 00h         
    mov AL, 03h         
    int 10h 
    ret

EsperarTecla:
    mov AH, 01h         
    int 21h
    ret

; Leer cadena de texto desde el teclado
; Salida: SI: longitud de la cadena   BP: direccion de guardado
LeerCadena:
    xor SI, SI          ; SI = 0
while:  
    call EsperarTecla    ; retorna un caracter en AL
    cmp AL, 0x0D         ; comparar AL con caracter EnterKey
    je exit              ; si AL == EnterKey, saltar a exit
    mov [BP+SI], AL      ; guardar caracter en memoria
    inc SI               ; SI++
    jmp while            ; saltar a while
exit:
    mov byte [BP+SI], "$" ; agregar $ al final de la cadena
    ret


; Permite escribir en la salida estándar una cadena de caracteres o string, este
; debe tener como terminación el carácter “$”
; Parámetros: AH: 09h  DX: dirección de la celda de memoria inicial de la cadena
EscribirCadena:
    mov AH, 09h
    int 21h
    ret

;Compara caracter por caracter la frase que fue ingresada que es la variable clave, con la
; frase que esta en el variable frase.
Comparar:  
    mov AX, [clave+DI]
    mov BX, [frase+DI]
    cmp AX, BX
    jne Incorrecto
    inc DI
    loop Comparar
    call Correcto

Correcto:
    xor AX, AX
    mov DX, txt2
    call EscribirCadena
    jmp finish
Incorrecto:
    xor AX, AX
    mov DX, txt3
    call EscribirCadena
    jmp finish

limpiar:
    xor AX, AX
    xor SI, SI
    xor BX, BX
    XOR CX, CX
    xor DX, DX
    ret
finish:
    int  20h

        



