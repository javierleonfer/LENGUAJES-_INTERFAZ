INCLUDE Irvine32.inc
; Materia: Lenguajes de Interfaz
; Alumno: LEON FERNANDEZ ALEXIS JAVIER
; Horario: 8-9
; Docente: DR. José Luis Medina Jiménez
; Práctica: 13.String hexadeciamles
; Descripción:aqui se busca agarrar un direccionamiento y ponerlo solo como numero hexadecimal ;
;el orden del programa es :se Inicializa los registros y utiliza un ciclo de 8 caracteres para leer cada dígito. 
;SHL desplaza EAX cuatro bits a la izquierda para dejar espacio al siguiente dígito.
;Después, mueve el carácter a BL y CMP junto con JBE verifica si es un número del 0 al 9; 
;si es una letra de la A a la F, SUB 7 ajusta su valor. Luego, SUB '0' convierte el carácter a su valor numérico, 
;MOVZX lo pasa a EBX y ADD lo agrega a EAX. INC avanza al siguiente carácter y LOOP repite el proceso ocho veces.
;por ultimo se guarda el resultado en numero, muestra los registros con DumpRegs y presenta el número hexadecimal con WriteHex.
.data
cadena BYTE "123AB4CD", 0
numero DWORD 0

.code
main PROC

    mov esi, 0
    mov ecx, 8
    mov eax, 0

L1:
    shl eax, 4

    mov bl, cadena[esi]

    cmp bl, '9'
    jbe Digito

    sub bl, 7

Digito:
    sub bl, '0'

    movzx ebx, bl
    add eax, ebx

    inc esi

    loop L1

    mov numero, eax

    call DumpRegs

    mov eax, numero
    call WriteHex

    call Crlf

    exit

main ENDP

END main











