
; Materia: Lenguajes de Interfaz
; Alumno: LEON FERNANDEZ ALEXIS JAVIER
; Horario: 8-9
; Docente: DR. José Luis Medina Jiménez
; Práctica: 14.Capturas de datos ...
; Descripción: aqui los dwor restrcciones son peticiones del DR.Medina vista en clase
;el orden del programa usa restricciones ya vistas aqui se necesita manejo de digitos para maniupjular con la tabla ascii
;se empieza con ;placas ESP32, 
;que son tarjetas electrónicas utilizadas en proyectos de electrónica y programación. 
;Solicita cuántas placas se recibieron,
;valida que la cantidad sea un número entre 1 y 99 y la suma a las 25 unidades iniciales. 
;Si el dato es válido, muestra la existencia actualizada; si es incorrecto,
;vuelve a solicitarlo. La rutina ConvertirDecimal transforma el total numérico en una cadena para poder imprimirlo en pantalla.
;INCLUDE Irvine32.inc
.data
mensaje BYTE "Ingrese la cantidad de ESP32 recibidas (1-99): ", 0
mensajeError BYTE "Error: ingrese un numero entre 1 y 99.", 0
mensajeFinal BYTE "Existencia actual: ", 0
mensajeUnidades BYTE " unidades", 0

cadena BYTE 10 DUP(0)
cadenaSalida BYTE 12 DUP(0)

cantidadRecibida DWORD 0
existenciaActual DWORD 25

.code
main PROC

Capturar:
    ; Capturar la cantidad como cadena
    mov edx, OFFSET mensaje
    call WriteString

    mov edx, OFFSET cadena
    mov ecx, SIZEOF cadena - 1
    call ReadString

    ; Validar longitud de 1 o 2 digitos
    cmp eax, 1
    jb Error
    cmp eax, 2
    ja Error

    mov ecx, eax
    mov esi, OFFSET cadena
    mov eax, 0

Convertir:
    ; Revisar que cada caracter sea un digito
    movzx ebx, BYTE PTR [esi]

    cmp bl, '0'
    jb Error
    cmp bl, '9'
    ja Error

    ; Convertir ASCII a numero decimal
    sub ebx, '0'
    imul eax, eax, 10
    add eax, ebx

    inc esi
    loop Convertir

    ; Validar rango de 1 a 99
    cmp eax, 1
    jb Error
    cmp eax, 99
    ja Error

    ; Guardar cantidad recibida
    mov cantidadRecibida, eax

    ; Sumar a las 25 unidades iniciales
    add eax, existenciaActual
    mov existenciaActual, eax

    ; Mostrar existencia actual
    mov edx, OFFSET mensajeFinal
    call WriteString

    mov eax, existenciaActual
    mov edi, OFFSET cadenaSalida
    call ConvertirDecimal

    mov edx, OFFSET cadenaSalida
    call WriteString

    mov edx, OFFSET mensajeUnidades
    call WriteString
    call Crlf

    jmp Salir

Error:
    mov edx, OFFSET mensajeError
    call WriteString
    call Crlf
    jmp Capturar

Salir:
    exit

main ENDP

; Convertir numero decimal a cadena
ConvertirDecimal PROC
    push eax
    push ebx
    push ecx
    push edx
    push edi

    mov ebx, 10
    mov ecx, 0

Dividir:
    mov edx, 0
    div ebx
    add dl, '0'
    push edx
    inc ecx

    cmp eax, 0
    jne Dividir

Guardar:
    pop eax
    mov [edi], al
    inc edi
    loop Guardar

    mov BYTE PTR [edi], 0

    pop edi
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
ConvertirDecimal ENDP

END main
;mi parte hecha en clase 
; Ej. Técnica usada: ASCII, DWORD

.data
    existenciaActual DWORD 25
    cantidadRecibida DWORD 0
    entrada BYTE 3 DUP(?)

; Captura
    mov edx, OFFSET entrada
    mov ecx, 2
    call ReadString

; Validar 1-2 dígitos
    cmp eax, 1
    jb ErrorEntrada

    cmp eax, 2
    ja ErrorEntrada

; Validar caracteres
    mov al, [esi]
    cmp al, '0'
    jb ErrorEntrada

    cmp al, '9'
    ja ErrorEntrada

; Convertir caracteres a números
    sub al, '0'
    movzx eax, al
    movzx ebx, al
    add ...
