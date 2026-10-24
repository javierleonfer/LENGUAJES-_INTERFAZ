
; Materia: Lenguajes de Interfaz
; Alumno: LEON FERNANDEZ ALEXIS JAVIER
; Horario: 8-9
; Docente: DR. José Luis Medina Jiménez
; Práctica: 2.Captura y despliegue de mensajes
; Descripción: Captura el nombre del usuario, lo muestra
; en pantalla y despliega la cantidad de caracteres.

INCLUDE Irvine32.inc

.data
mensajeEntrada BYTE "Escribe tu nombre: ", 0
mensajeLongitud BYTE "Caracteres capturados: ", 0

nombre BYTE 30 DUP(0)
longitud DWORD ?

.code
main PROC

    ; Mostrar mensaje de entrada
    mov edx, OFFSET mensajeEntrada
    call WriteString

    ; Capturar el nombre
    mov edx, OFFSET nombre
    mov ecx, SIZEOF nombre
    call ReadString

    ; Guardar la cantidad de caracteres
    mov longitud, eax
    call Crlf

    ; Mostrar el nombre capturado
    mov edx, OFFSET nombre
    call WriteString
    call Crlf

    ; Mostrar mensaje de longitud
    mov edx, OFFSET mensajeLongitud
    call WriteString

    ; Mostrar cantidad de caracteres
    mov eax, longitud
    call WriteDec

    exit

main ENDP
END main
