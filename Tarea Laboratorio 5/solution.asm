org 100h

    section .text
    ;Limpio las variables
    xor AX, AX
    xor SI, SI
    xor BX, BX
    XOR CX, CX
    xor DX, DX

    ;Contadores
    ;SI para acceder a los caracteres de la cadena
    ;DI para contar los caracteres y saber cuando parar
    MOV SI, 0
    MOV DI, 0d

    ;Coordenadas donde se mostrara del cursor
    MOV DH, 8 ;fila 
    MOV DL, 20 ;columna 

    call modotexto

    LOOP:
    ;Loop para mover el cursor y el caracter a imprimir en pantalla
        call movercursor ;llamada a mover cursor
        MOV CL, [cadena+SI] ;Colocar en CL el caracter actual de la cadena
        cmp CL,' '
        je cambiarfila
        call escribircaracter; Llamada a escribircaracter
        INC SI ; se suma 1 para continuar con el siguiente caracter
        INC DL ; se suma 1 para mover el cursor a la siguiente columna
        INC DI ; contador para terminar la ejecución del programa al llegar a 30
        CMP DI, 30d ; Comparación de DI con 30d
        JB LOOP ; si DI es menor a 300, entonces que siga iterando.
        jmp esperartecla ; de caso contrario, que salte a esperar tecla.

    modotexto: 
        MOV AH, 0h ; activa modo texto
        MOV AL, 03h ; modo gráfico deseado 25 filas, 80 columnas
        INT 10h
        RET
    movercursor:
        ;mueve el cursor segun los valores de DH (fila del cursor),DL (columna del cursor),BH (número de página)
        MOV AH, 02h ; posiciona el cursor en pantalla. 
        MOV BH, 0h 
        INT 10h
        RET
    escribircaracter:
        MOV AH, 0Ah ; escribe caracter en pantalla según el cursor
        MOV AL, CL ; denotamos el caracter a escribir en pantalla
        MOV BH, 0h ; número de página
        MOV CX, 1h ; número de veces a escribir el caracter
        INT 10h
        RET
    
    cambiarfila:
        INC DH ;Se incrementa 2 veces DH, para tener una fila de separacion
        INC DH
        INC SI ;Se pasa al siguiente caracter luego del espacio
        INC DI ;Se cuenta el caracter
        mov DL, 20 ; Se vuelve el cursor a la columna donde se inicio la cual fue 20 
        JMP LOOP
    esperartecla:
    ;Se espera que el usuario presione una tecla
        MOV AH, 00h 
        INT 16h
    exit:
        int 20h



    section .data

    cadena DB 'Rocio Marleny Landaverde Solis' ;30 caracteres

    