; Materia: Lenguajes de Interfaz
; Alumno: LEON FERNANDEZ ALEXIS JAVIER
; Horario: 8-9
; Docente: DR. José Luis Medina Jiménez
; Práctica: 10. cadena decimal 
; Descripción:Aquí es una idea muy especifica porque se trata de conversionoperaciones decimales no estan sencillo se tiene que
;usar mucha manipulacion de datos inclusive de stack(pila) lo principal es un DWord y al final manipulaciones de push-pop 
;lo siguiente sera el orden logico del programa mostrando ejemplos de que pasaria si se quiera modificar 
;diferentes operaciones aritméticas en ensamblador. 
;Primero utiliza ADD para sumar EAX y EBX, y SUB para restarle 15 al resultado. 
;Después realiza una suma que provoca acarreo con CF y otra que provoca desbordamiento con OF.
;Luego usa MUL para multiplicar valores sin signo, 
;mostrando un caso donde el resultado cabe en 32 bits y otro donde necesita más de 32 bits. 
;También utiliza IMUL para multiplicar números con signo. 
;Finalmente, usa DIV para dividir números sin signo e IDIV para dividir números con signo;
;CDQ prepara EDX:EAX para realizar la división negativa. 
;Las instrucciones NOP sirven para poner un punto rojo y depurar ahi .

INCLUDE Irvine32.inc

.data
    ; DATOS DEL ARCHIVO
    tamArchivo DWORD 100000
    bloques DWORD 125
    tamBloque DWORD 512

    ; RESULTADOS
    descargados DWORD ?
    pendientes DWORD ?
    porcentaje DWORD ?
    grupos DWORD ?
    residuo DWORD ?

    ; MENSAJES
    msg1 BYTE "Bytes descargados: ", 0
    msg2 BYTE "Bytes pendientes: ", 0
    msg3 BYTE "Porcentaje de avance: ", 0
    msg4 BYTE "Grupos completos de 1024: ", 0
    msg5 BYTE "Residuo del agrupamiento: ", 0
    simbolo BYTE "%", 0

    ; BUFFER PARA CONVERSION DECIMAL
    buffer BYTE 11 DUP(0)

.code
main PROC

    ; BLOQUE 1: BYTES DESCARGADOS
    mov eax, bloques
    mul tamBloque
    mov descargados, eax

    ; BLOQUE 2: BYTES PENDIENTE
    mov eax, tamArchivo
    sub eax, descargados
    mov pendientes, eax

    ; BLOQUE 3: PORCENTAJE ENTERO
    mov eax, descargados
    mov ebx, 100
    mul ebx

    mov ebx, tamArchivo
    div ebx
    mov porcentaje, eax

    ; BLOQUE 4: GRUPOS DE 1024
    mov eax, descargados
    mov edx, 0
    mov ebx, 1024
    div ebx

    mov grupos, eax
    mov residuo, edx

    ; MOSTRAR BYTES DESCARGADOS
    mov edx, OFFSET msg1
    call WriteString

    mov eax, descargados
    mov esi, OFFSET buffer
    call convertirDecimal

    mov edx, OFFSET buffer
    call WriteString
    call Crlf

    ; MOSTRAR BYTES PENDIENTES
    mov edx, OFFSET msg2
    call WriteString

    mov eax, pendientes
    mov esi, OFFSET buffer
    call convertirDecimal

    mov edx, OFFSET buffer
    call WriteString
    call Crlf

    ; MOSTRAR PORCENTAJE
    mov edx, OFFSET msg3
    call WriteString

    mov eax, porcentaje
    mov esi, OFFSET buffer
    call convertirDecimal

    mov edx, OFFSET buffer
    call WriteString

    mov edx, OFFSET simbolo
    call WriteString
    call Crlf

    ; MOSTRAR GRUPOS COMPLETOS
    mov edx, OFFSET msg4
    call WriteString

    mov eax, grupos
    mov esi, OFFSET buffer
    call convertirDecimal

    mov edx, OFFSET buffer
    call WriteString
    call Crlf

    ; MOSTRAR RESIDUO
    mov edx, OFFSET msg5
    call WriteString

    mov eax, residuo
    mov esi, OFFSET buffer
    call convertirDecimal

    mov edx, OFFSET buffer
    call WriteString
    call Crlf

    exit

main ENDP


; PROCEDIMIENTO: CONVERTIR DECIMAL
; ENTRADA:
; EAX = NUMERO A CONVERTIR
; ESI = DIRECCION DEL BUFFER

convertirDecimal PROC

    push eax
    push ebx
    push ecx
    push edx
    push esi
    push edi

    ; APUNTAR AL FINAL DEL BUFFER
    mov edi, esi
    add edi, 10

    ; TERMINADOR DE CADENA
    mov BYTE PTR [edi], 0

    mov ebx, 10

    ; CASO ESPECIAL: NUMERO CERO
    cmp eax, 0
    jne convertir

    dec edi
    mov BYTE PTR [edi], '0'
    jmp copiar

convertir:
    ; DIVIDIR ENTRE 10
    mov edx, 0
    div ebx

    ; RESIDUO A ASCII
    add dl, '0'

    ; GUARDAR DIGITO
    dec edi
    mov [edi], dl

    ; REPETIR SI QUEDAN DIGITOS
    cmp eax, 0
    jne convertir

copiar:
    ; COPIAR CADENA AL INICIO
    mov al, [edi]
    mov [esi], al

    inc edi
    inc esi

    cmp al, 0
    jne copiar

    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax

    ret

convertirDecimal ENDP

END main
