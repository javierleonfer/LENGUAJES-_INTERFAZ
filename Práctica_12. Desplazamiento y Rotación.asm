; Materia: Lenguajes de Interfaz
; Alumno: LEON FERNANDEZ ALEXIS JAVIER
; Horario: 8-9
; Docente: DR. José Luis Medina Jiménez
; Práctica: 12. rotaciones
; Descripción: diferencia de comportamiento en los registro por ejemplo sar,shr ...
;son diferentes formas de desplazar y rotar bits. 
;el programa primero musetra SHL desplaza los bits a la izquierda y SHR a la derecha, mientras que SAR desplaza a la derecha conservando el bit de signo.
;También realiza desplazamientos de dos posiciones y utiliza CL para indicar cuántos bits se deben mover.
;ROR rota los bits a la derecha y ROL a la izquierda, haciendo que los bits que salen por un extremo regresen por el otro. 
;Finalmente, RCL y RCR realizan rotaciones utilizando también la bandera de acarreo CF; CLC pone CF en 0 antes de cada operación. 
;DumpRegs permite observar los registros y las banderas, WriteBin muestra el resultado en binario y Crlf realiza un salto de línea.
INCLUDE Irvine32.inc

.code
main PROC
  mov eax, 0
  mov ebx, 0
  mov ecx, 0
  mov edx, 0


  ; 1 - SHL: DESPLAZAR UNA POSICION A LA IZQUIERDA
  mov al, 10000000b
  shl al, 1

  call DumpRegs
  call WriteBin
  call Crlf


  ; 2 - SHR: DESPLAZAR UNA POSICION A LA DERECHA
  mov al, 00001101b
  shr al, 1

  call DumpRegs
  call WriteBin
  call Crlf


  ; 3 - SAR: CONSERVAR EL SIGNO
  mov al, -8
  sar al, 1

  call DumpRegs
  call WriteBin
  call Crlf


  ; 4 - SAR: CON OPERACIONES NO EXACTAS
  mov al, -9
  sar al, 1

  call DumpRegs
  call WriteBin
  call Crlf


  ; 5 - CONTEO: DESPLAZAR 2 BITS A LA IZQUIERDA
  mov al, 00001111b
  shl al, 2

  call DumpRegs
  call WriteBin
  call Crlf


  ; 6 - DESPLAZAR 2 BITS A LA DERECHA UTILIZANDO CL
  mov al, 00001111b
  mov cl, 2
  shr al, cl

  call DumpRegs
  call WriteBin
  call Crlf


  ; 7 - ROR: ROTAR BITS A LA DERECHA
  mov al, 10000001b
  ror al, 1

  call DumpRegs
  call WriteBin
  call Crlf


  ; 8 - ROL: ROTAR BITS A LA IZQUIERDA
  mov al, 10000001b
  rol al, 1

  call DumpRegs
  call WriteBin
  call Crlf


  ; 9 - RCL: ROTAR A LA IZQUIERDA CON ACARREO
  clc
  mov al, 10000001b
  rcl al, 1

  call DumpRegs
  call WriteBin
  call Crlf


  ; 10 - RCR: ROTAR A LA DERECHA CON ACARREO
  clc
  mov al, 10000001b
  rcr al, 1

  call DumpRegs
  call WriteBin
  call Crlf


  exit

main ENDP

END main
