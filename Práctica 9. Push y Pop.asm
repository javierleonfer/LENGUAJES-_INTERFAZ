; Materia: Lenguajes de Interfaz
; Alumno: LEON FERNANDEZ ALEXIS JAVIER
; Horario: 8-9
; Docente: DR. José Luis Medina Jiménez
; Práctica: 9.push y pop 
; Descripción: se esta guardadno 30 en registro eax..push lo copia ,pop agarra valores arriba de la pila.nop es un salto de operacion se usa cuando se va depurar el código.
INCLUDE Irvine32.inc
.code
main PROC
  mov eax, 30

  push eax 
  nop
  
   exit
main ENDP 

END main 
