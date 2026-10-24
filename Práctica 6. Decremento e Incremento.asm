; Materia: Lenguajes de Interfaz
; Alumno: LEON FERNANDEZ ALEXIS JAVIER
; Horario: 8-9
; Docente: DR. José Luis Medina Jiménez
; Práctica: 6. decremento e incremento 
; Descripción:Aquí el objetico es usar cadenas y conversiones ..este caso writeString with ReadInt para que termine 
;imprimiendo with wrtitedecimal.. se usara la sig manipulacion de datos y condicionales en este orden:
;la regla es ingresar un PIN y da un máximo de 3 intentos para escribirlo correctamente. 
;Primero guarda el número de intentos en EBX y después solicita el PIN con WriteString y ReadInt. Compara el número ingresado con el PIN correcto usando CMP; si coincide, JE salta a acceso y muestra el mensaje de acceso permitido. Si el PIN es incorrecto, muestra un mensaje de error y disminuye los intentos con DEC. Después, JZ verifica si ya no quedan intentos y, si EBX llega a 0, salta a bloqueado y muestra el mensaje de acceso bloqueado. Si todavía quedan intentos, muestra cuántos quedan con 
;WriteDec y JMP intentar regresa al inicio para solicitar el PIN nuevamente. Finalmente, el programa termina con exit.


INCLUDE Irvine32.inc

.data
    msgPIN BYTE "Ingrese eL PIN: ", 0
    msgIntentos BYTE "Intentos restantes: ", 0
    msgError BYTE "PIN incorrecto", 0
    msgAcceso BYTE "ACCESO PERMITIDO", 0
    msgBloqueado BYTE "ACCESO BLOQUEADO", 0

    pinCorrecto = 1234

.code
main PROC
   mov ebx, 3 ; NUMERO DE INTENTOS PARA INGRESAR

  intentar:
  mov edx, OFFSET msgPIN 
   call WriteString
   call ReadInt

   cmp eax, pinCorrecto
   je acceso
   
   mov edx, OFFSET msgError
   call WriteString
   call crlf

   dec ebx

   jz bloqueado

   mov edx, OFFSET msgIntentos
   call WriteString

   mov eax, ebx
   call WriteDec
   call crlf

   jmp intentar


acceso:
mov edx, OFFSET msgAcceso
call WriteString 
call crlf
jmp fin


bloqueado:
mov edx, OFFSET msgBloqueado
call WriteString
call crlf 
jmp fin

fin:
exit

main ENDP 

END main 