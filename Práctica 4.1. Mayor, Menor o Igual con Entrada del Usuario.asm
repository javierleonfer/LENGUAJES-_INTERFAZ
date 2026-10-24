; Materia: Lenguajes de Interfaz
; Alumno: LEON FERNANDEZ ALEXIS JAVIER
; Horario: 8-9
; Docente: DR. José Luis Medina Jiménez
; Práctica: 4.1Mayor, Menor o Igual con Entrada del UsuarioSa
; Descripción: ; Aquí el programa pide al usuario que ingrese dos numeros y guarda cada uno en una variable. Despues los pasa a los registros EAX y EBX para compararlos con CMP.
;Dependiendo del resultado, JG salta a mayor si el primer numero es mayor, JL salta a menor si es menor y JE salta a iguales si los dos son iguales.
;En cada caso muestra el mensaje correspondiente y usa JMP fin para evitar que se ejecuten los otros casos. Al final hace un salto de linea con Crlf y termina el programa con exit.
INCLUDE Irvine32.inc

.data
msgNum1 BYTE "Ingresa el primer numero: ", 0
msgNum2 BYTE "Ingresa el segundo numero: ", 0

msgMayor BYTE "El primer numero es mayor", 0
msgMenor BYTE "El primer numero es menor", 0
msgIguales BYTE "Los numeros son iguales", 0

num1 DWORD ?
num2 DWORD ?

.code
main PROC

    ; Pedir el primer numero
    mov edx, OFFSET msgNum1
    call WriteString
    call ReadInt
    mov num1, eax

    ; Pedir el segundo numero
    mov edx, OFFSET msgNum2
    call WriteString
    call ReadInt
    mov num2, eax

    ; Comparar los dos numeros
    mov eax, num1
    mov ebx, num2

    cmp eax, ebx

    jg mayor
    jl menor
    je iguales

iguales:
    mov edx, OFFSET msgIguales
    call WriteString
    jmp fin

mayor:
    mov edx, OFFSET msgMayor
    call WriteString
    jmp fin

menor:
    mov edx, OFFSET msgMenor
    call WriteString

fin:
    call Crlf
    exit

main ENDP
END main
