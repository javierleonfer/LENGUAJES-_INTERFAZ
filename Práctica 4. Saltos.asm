INCLUDE Irvine32.inc
; Materia: Lenguajes de Interfaz
; Alumno: LEON FERNANDEZ ALEXIS JAVIER
; Horario: 8-9
; Docente: DR. José Luis Medina Jiménez
; Práctica: 4.Saltos 
; Descripción:tipos de jumpers  JE (Jump if Equal): salta a la etiqueta iguales ZF va ser =1.
;JMP (Jump): salta directamente a la etiqueta fin sin comprobar ninguna condición.
; Sí JE salta a iguales, muestra el mensaje "Los valores son iguales"; si no muestra  con su respectiva etiqueta...
.data
msgIguales BYTE "Los valores son iguales", 0
msgDiferente BYTE "Los valores son diferentes", 0

.code
main PROC
  mov eax, 10
  mov ebx, 10

  cmp eax, ebx

  je iguales

  mov edx, OFFSET msgDiferentes
  call WriteString


  jmp fin

  iguales: 
  mov edx, OFFSET msgIguales
  call WriteString

fin:
call crlf
exit 
  main ENDP 

END main 