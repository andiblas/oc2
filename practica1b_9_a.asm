%include "io.inc"
section .data
cadena db "prueba", 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    PUSH cadena
    CALL FUNCION
    add esp, 4
    PRINT_STRING "sdgasd"
    ret
    
FUNCION:
    push ebp,
    mov ebp, esp
    xor eax, eax
    xor ecx, ecx
    xor ebx, ebx
    mov eax, [ebp+8] 
CICLO:
    mov bl, [eax]
    cmp bl, 0
    je FIN
    inc ecx
    inc eax
    jmp CICLO
FIN:
    pop ebp
    ret