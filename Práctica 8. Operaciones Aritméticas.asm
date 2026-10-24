; Materia: Lenguajes de Interfaz
; Alumno: LEON FERNANDEZ ALEXIS JAVIER
; Horario: 8-9
; Docente: DR. José Luis Medina Jiménez
; Práctica: 8. 0peraciones Aritmeticas 
; Descripción: como Se vio en clase miraremos la operaciones aritemticas basicas de toda la vida pero ahora para indicar q se usara dec 
;sera una instruccioin dif por ejemplo; div-idiv
;el objetivo es que no te salte una bandera de over carry porque seria un desbordamiento de datos
;el sig programa sigue este orden de manipulacion de datos Primero utiliza ADD para sumar EAX y EBX, y SUB para restarle 15 al resultado.
;Después realiza una suma que provoca acarreo con CF y otra que provoca desbordamiento con OF. Luego usa MUL para multiplicar valores sin signo, mostrando un caso donde el resultado cabe en 32 bits y otro donde necesita más de 32 bits. También utiliza IMUL para multiplicar números con signo. Finalmente, usa DIV para dividir números sin signo e IDIV para dividir números con signo; CDQ prepara EDX:EAX para realizar la división negativa. 
;Las instrucciones NOP sirven como pausas para revisar los registros y las banderas después de cada operación.
INCLUDE Irvine32.inc

.code
main PROC
  ; OPERACIONES: ADD Y SUB 

  mov eax, 50
  mov ebx, 20

  add eax, ebx
  sub eax, 15

  nop 


  ; CF: ACARREO EN UNA SUMA SIN SIGNO

  mov eax, 0
  mov al, 255
  add al, 1


  nop 

  ; OF: CONDICION DE DESBORDAMIENTO

  mov eax, 0
  mov al, 127
  add al, 1

  nop


  ; 4: MUL: MULTIPLICACION DE VALORES DENTRO DE 32 BITS

  mov eax, 25
  mov ebx, 3

  mul ebx

  nop

  ; 5: MUL: PRODUCTO QUE NECESITA MAS DE 32 BITS
   
   mov eax, 65537
   mov ebx, 65537

   mul ebx

   nop


   ; 6: mul: multiplicacion con signo

   mov eax, -5

   imul eax, eax, 3

   nop

   ; 7: DIV: division sin signo

   mov eax, 125
   mov edx, 0
   mov ebx, 12

   div ebx

  nop

  ; 8: IDIV: DIVISION CON SIGNOS

  mov eax, -125

  cdq

  mov ebx, 12

  idiv ebx

  nop
  exit
main ENDP 

END main 