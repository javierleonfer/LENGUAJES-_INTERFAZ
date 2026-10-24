; Materia: Lenguajes de Interfaz
; Alumno: LEON FERNANDEZ ALEXIS JAVIER
; Horario: 8-9
; Docente: DR. José Luis Medina Jiménez
; Práctica: 5.1. condicionales 
; Descripción:;
;Aquí se capturaran datos desde la consola.
;el programa pide al usuario que ingrese un número 
;y lo compara con 0 usando CMP. Si el número es igual a 0, JE salta a fin y muestra que el programa ha finalizado.
;Si el número es mayor que 0, JG salta a positivo y muestra que es positivo. Si el número es menor que 0, JL salta a negativo y muestra que es negativo. Después de mostrar si es positivo o negativo, JMP ciclo regresa al inicio para pedir otro número. El 
;programa sigue repitiendo el proceso hasta que el usuario ingresa 0, momento en el que muestra el mensaje de finalización y termina con exit.
INCLUDE Irvine32.inc

.data
msgNumero BYTE "Ingresa un numero: ", 0
msgPositivo BYTE "El numero es positivo", 0
msgNegativo BYTE "El numero es negativo", 0
msgSalir BYTE "Programa finalizado", 0

.code
main PROC

ciclo:
    ; Pedir un numero al usuario
    mov edx, OFFSET msgNumero
    call WriteString
    call ReadInt

    ; Comparar el numero con 0
    cmp eax, 0

    je fin
    jg positivo
    jl negativo

positivo:
    mov edx, OFFSET msgPositivo
    call WriteString
    call Crlf
    jmp ciclo

negativo:
    mov edx, OFFSET msgNegativo
    call WriteString
    call Crlf
    jmp ciclo

fin:
    mov edx, OFFSET msgSalir
    call WriteString
    call Crlf

    exit

main ENDP
END main
