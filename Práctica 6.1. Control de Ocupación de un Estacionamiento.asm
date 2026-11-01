; Materia: Lenguajes de Interfaz
; Alumno: LEON FERNANDEZ ALEXIS JAVIER
; Horario: 8-9
; Docente: DR. José Luis Medina Jiménez
; Práctica: 6.1. control de ocupaciones de un estacionamiento
; Descripción:control de ocupaciones de un estacionamiento 
; Este programa simula un estacionamiento con capacidad para 20 carros. 
;Usa CMT para comparar la ocupación y la opción ingresada. el orden de manipulacoin de datos sera el sig:
;Si el usuario elige 1, 
;INC aumenta en 1 la cantidad de carros; si elige 2, DEC disminuye en 1, siempre que no esté vacío.
;JE realiza saltos según las condiciones, por ejemplo, cuando está lleno o vacío. Si la opción no es válida, 
;muestra un error. JMP regresa al ciclo para actualizar la ocupación y repetir el menú hasta que el estacionamiento llegue a 20 carros.
INCLUDE Irvine32.inc

CAPACIDAD = 20

.data
titulo      BYTE "=== CONTROL DE ESTACIONAMIENTO ===", 0
opc1        BYTE "[1] Registrar entrada", 0
opc2        BYTE "[2] Registrar salida", 0
opc0        BYTE "[0] Terminar programa", 0
prompt      BYTE "> Elija una opcion: ", 0
txtEstado   BYTE "Lugares ocupados: ", 0
txtDe       BYTE " de ", 0
txtLibres   BYTE "Lugares libres:   ", 0
okEntrada   BYTE "-> Entrada registrada.", 0
okSalida    BYTE "-> Salida registrada.", 0
errVacio    BYTE "-> No hay carros que puedan salir.", 0
errLleno    BYTE "-> ESTACIONAMIENTO LLENO, no se admiten mas carros.", 0
errOpcion   BYTE "-> Opcion invalida, intente de nuevo.", 0
adios       BYTE "Programa finalizado.", 0

ocupados    DWORD 0

.code
main PROC
inicio:
    call MostrarEstado
    call MostrarMenu

    mov  edx, OFFSET prompt
    call WriteString
    call ReadInt
    call Crlf

    .IF eax == 1
        call RegistrarEntrada
    .ELSEIF eax == 2
        call RegistrarSalida
    .ELSEIF eax == 0
        jmp fin
    .ELSE
        mov  edx, OFFSET errOpcion
        call Mensaje
    .ENDIF

    jmp  inicio

fin:
    mov  edx, OFFSET adios
    call Mensaje
    exit
main ENDP


; Muestra ocupados y libres

MostrarEstado PROC
    call Crlf
    mov  edx, OFFSET titulo
    call Mensaje

    mov  edx, OFFSET txtEstado
    call WriteString
    mov  eax, ocupados
    call WriteDec
    mov  edx, OFFSET txtDe
    call WriteString
    mov  eax, CAPACIDAD
    call WriteDec
    call Crlf

    mov  edx, OFFSET txtLibres
    call WriteString
    mov  eax, CAPACIDAD
    sub  eax, ocupados
    call WriteDec
    call Crlf
    ret
MostrarEstado ENDP

; Muestra las opciones del menu

MostrarMenu PROC
    mov  edx, OFFSET opc1
    call Mensaje
    mov  edx, OFFSET opc2
    call Mensaje
    mov  edx, OFFSET opc0
    call Mensaje
    ret
MostrarMenu ENDP


; Entrada: valida que haya espacio

RegistrarEntrada PROC
    .IF ocupados >= CAPACIDAD
        mov  edx, OFFSET errLleno
    .ELSE
        inc  ocupados
        mov  edx, OFFSET okEntrada
    .ENDIF
    call Mensaje
    ret
RegistrarEntrada ENDP

; Salida: valida que haya al menos un carro

RegistrarSalida PROC
    .IF ocupados == 0
        mov  edx, OFFSET errVacio
    .ELSE
        dec  ocupados
        mov  edx, OFFSET okSalida
    .ENDIF
    call Mensaje
    ret
RegistrarSalida ENDP


; Imprime la cadena en EDX seguida de salto de linea

Mensaje PROC
    call WriteString
    call Crlf
    ret
Mensaje ENDP

END main

