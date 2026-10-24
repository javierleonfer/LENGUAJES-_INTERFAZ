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

.data
msgMenu BYTE "1. Entrada de carro", 0
msgSalida BYTE "2. Salida de carro", 0
msgOcupacion BYTE "Carros estacionados: ", 0
msgEntrada BYTE "Un carro ha entrado", 0
msgSalio BYTE "Un carro ha salido", 0
msgVacio BYTE "El estacionamiento esta vacio", 0
msgLleno BYTE "ESTACIONAMIENTO LLENO", 0
msgOpcion BYTE "Seleccione una opcion: ", 0
msgError BYTE "Opcion no valida", 0

carros DWORD 0

.code
main PROC

ciclo:
    ; Mostrar ocupacion actual
    mov edx, OFFSET msgOcupacion
    call WriteString
    mov eax, carros
    call WriteDec
    call Crlf

    ; Verificar capacidad maxima
    cmp carros, 20
    je lleno

    ; Mostrar menu
    mov edx, OFFSET msgMenu
    call WriteString
    call Crlf

    mov edx, OFFSET msgSalida
    call WriteString
    call Crlf

    mov edx, OFFSET msgOpcion
    call WriteString
    call ReadInt

    cmp eax, 1
    je entrada

    cmp eax, 2
    je salida

    mov edx, OFFSET msgError
    call WriteString
    call Crlf
    jmp ciclo

entrada:
    inc carros

    mov edx, OFFSET msgEntrada
    call WriteString
    call Crlf
    jmp ciclo

salida:
    cmp carros, 0
    je vacio

    dec carros

    mov edx, OFFSET msgSalio
    call WriteString
    call Crlf
    jmp ciclo

vacio:
    mov edx, OFFSET msgVacio
    call WriteString
    call Crlf
    jmp ciclo

lleno:
    mov edx, OFFSET msgLleno
    call WriteString
    call Crlf

    exit

main ENDP
END main
