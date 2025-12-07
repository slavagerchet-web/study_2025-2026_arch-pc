%include 'in_out.asm'

SECTION .data
div: db 'Результат: ',0

SECTION .text
global _start

_start:
    mov eax,3
    mov ebx,2
    add eax,ebx
    mov ecx,4
    mul ecx
    add eax,5
    mov edi,eax

    mov eax,div
    call sprint
    mov eax,edi
    call iprintLF
    call quit

