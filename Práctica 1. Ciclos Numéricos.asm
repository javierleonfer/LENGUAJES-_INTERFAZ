; Materia: Lenguajes de Interfaz
; Alumno: LEON FERNANDEZ ALEXIS JAVIER
; Horario: 8-9
; Docente: DR. José Luis Medina Jiménez
; Práctica: 1.ciclos numéricos 
; Descripción:AQUÍ usaremos loop(CICLO) el objetivo sera repetir 5 veces una instruccion en este caso el byte "Hola, mundo"
;sifnificado de sintaxis: 
;mov edx, OFFSET guardan la DIRECCION en EDX
;byte "" almacena la cadena en memoria 
;CALL WRITESTRING llama la cadena e imprime .
;call crlf va mostrarse en salto de lineaa.

INCLUDE Irvine32.inc

.data
mensaje BYTE "Hola, mundo: ", 0

.code
main PROC
 mov ecx, 5

 ciclo:
  mov edx, OFFSET mensaje
   call writeString
   call crlf 
   loop ciclo 
   exit
main ENDP 

END main 