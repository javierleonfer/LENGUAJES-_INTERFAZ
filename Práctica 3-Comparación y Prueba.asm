INCLUDE Irvine32.inc
; Materia: Lenguajes de Interfaz
; Alumno: LEON FERNANDEZ ALEXIS JAVIER
; Horario: 8-9
; Docente: DR. José Luis Medina Jiménez
; Práctica: 3.Comparacion y pruebas de msjs
; Descripción:  Se demuestra el funcionamiento de las banderas ZF, SF, CF y OF usando CMP, ADD y TEST
;y utiliza DumpRegs para mostrar los registros y observar los cambios 
;Cmp compara con resta internamente,Add compara con suma internamente, Test realiza AND de AL consigo mismo; 
;ZERO FLAG (ZF): Compara EBX con 1, EAX con EBX y CL consigo mismo; en los tres casos los valores son iguales, el resultado es cero y ZF = 1. 
;SIGN FLAG (SF): ingresa o Inicializa EAX y EBX, guardando -5 en AL y 1 en BL; CMP realiza la comparación -5 - 1 = -6, cuyo bit más significativo es 1,
;CARRY FLAG (CF): Guarda 255 en AL y le suma 1; como AL solo tiene 8 bits, el resultado almacenado es 0 y se activa CF = 1 por el acarreo.
;OVERFLOW FLAG (OF): su resultado fuera del rango de 8 bits con signo, por lo que OF = 1.
;TEST: Guarda 5 en EAX y realiza AND con 1; el resultado es 00000001b, no es cero y ZF = 0. Después guarda 10000000b en AL y ejecuta TEST AL, AL; el resultado no es cero, SF = 1, ZF = 0, CF = 0 y OF = 0. 
;DumpRegs permite observar los registros y las banderas después de cada operación.
.code
main PROC

; CONDICION 1: ZERO FLAGS
   mov EBX, 1
   cmp EBX, 1
   call dumpRegs

   mov EAX, 01h
   cmp EAX, EBX 
   call dumpRegs 

   mov cl, 11111111b
   cmp cl, cl
   call dumpRegs 

   ; CONDICION 2: SING FLAG
   mov EAX, 0
   mov EBX, 0

   mov al, -5
   mov bl, 1
   cmp al, bl 
   call dumpRegs 

   ; CONDICION 3: CARRY FLAGS 
   mov EAX, 0
   mov EBX, 0

   mov al, 255
   add al, 1
   call dumpRegs 

   ; CONDICION 4: OVERFLOW FLAG 
   mov EAX, 0
   mov EBX, 0

   mov al, -128
   mov bl, 1
   cmp al, bl
   call dumpRegs

   ;CASO 5: TEST
   mov EAX, 0
   mov EAX, 5; 00000101b
   test EAX, 1
   call dumpRegs 
   
   ;00000101b
   ;-
   ;00000001b
   ;------------
   ;00000001b

   mov eax, 0
   mov al, 10000000b
   test al, al
   call dumpRegs

main ENDP 

END main 