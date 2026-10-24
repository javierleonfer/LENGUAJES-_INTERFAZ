
; Materia: Lenguajes de Interfaz
; Alumno: LEON FERNANDEZ ALEXIS JAVIER
; Horario: 8-9
; Docente: DR. José Luis Medina Jiménez
; Práctica: 5. condicionales 
; Descripción: inicia EBX en 1 y utiliza un ciclo DO WHILE para imprimir los números. 
;Primero copia el valor de EBX a EAX para mostrarlo con WriteDec y después hace un salto de línea con Crlf. 
;Luego se incrementa EBX en 1 con INC, compara su valor con 100 usando CMP 
;y utiliza JLE (Jump if Less or Equal) para regresar al ciclo mientras EBX sea menor o igual a 100. Cuando EBX supera 100, el salto ya no se cumple y el programa termina con exit.
;parte2
; Aquí es otra situacion del programa y se pone punto rojo para depurar y observar regristros
;programa inicia EBX en 1 y utiliza un ciclo para ir mostrando los números hasta llegar al 10. 
;Primero compara EBX con 10 usando CMP y, si es mayor, JG salta a fin para terminar el programa. 
;Si no se copiara el valor de EBX a EAX para mostrarlo con WriteDec
;y hace un salto de línea con Crlf. Después incrementa EBX en 1 con INC y utiliza JMP ciclo para regresar al inicio y repetir el proceso hasta que se cumpla la condición de salida.
; jumpgreater se puede interpetrar del ingles com "el mas grande" de algo.este caso un valor..
   mov ebx, 1 ; Valor inicial para el ciclo DO WHILE

ciclo:
mov eax, ebx ; movemos el valor a imprimir al registro de lectura de writedec
   call WriteDec ; se imprime en consola el valor actual antes de incrementar
   call Crlf ; se genera un salto de linea
   

   inc ebx ; se realiza el incremento de +1 en el registro ebx

   cmp ebx, 100 ; condicion de alida paraa finalizar el codigo, cumple una funcion de condicion para el ciclo DO WHILE
   jle ciclo ; salto condicional al bloque de codigo del ciclo 

   exit ; finaliza si se cumplio la condicion de salida 

main PROC
  mov ebx, 1 ; valor inicial para incrementar 

ciclo:
    cmp ebx, 10 ; Condicion de salida

jg fin ; salto a finalizar el codigo cuando se cumpla la condicion de salida
       ; jumpgreater se puede interpetrar del ingles "el mas grande"

mov eax, ebx ; se copia el valor de ebx a eax para poder imprimirlo
call writeDec ; imprime numero incrementado 
call crlf ; saltos de linea

inc ebx ; ++1

jmp ciclo ; salto normal sin condicion
fin: 
    exit


main ENDP 

END main 