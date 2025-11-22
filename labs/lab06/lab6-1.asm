%include "in_out.asm"

section .bss
    buf resb 1

section .text
    global _start

_start:
    mov eax, 6
    mov ebx, 4
    add eax, ebx
    mov [buf], al
    mov eax, buf
    call sprintLF
    call quit
