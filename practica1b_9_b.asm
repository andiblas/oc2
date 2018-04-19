%include "io.inc"
section .data
cadena1 db "hola ", 0
cadena2 db "mundo!", 0
buffer db "                           ",0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    PUSH cadena2
    PUSH cadena1
    PUSH buffer
    CALL CONCATENAR
    add esp, 12
    PRINT_STRING buffer
    ret
    
CONCATENAR:
    push ebp,
    mov ebp, esp
    xor eax, eax
    xor ecx, ecx
    xor ebx, ebx
    mov edx, [ebp+8] ; buffer
    mov eax, [ebp+12] ; cadena1
    mov ecx, [ebp+16] ; cadena2
CICLO:
    mov bl, [eax]
    cmp bl, 0
    je CICLO2
    mov [edx], bl
    inc edx
    inc eax
    jmp CICLO
CICLO2:
    mov bl, [ecx]
    cmp bl, 0
    je FIN
    mov [edx], bl
    inc edx
    inc ecx
    jmp CICLO2
FIN:
    pop ebp
    ret