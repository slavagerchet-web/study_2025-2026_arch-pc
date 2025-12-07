%include 'in_out.asm'

SECTION .data
msg_f   db "Функция: f(x)=15x+2",0
msg_res db "Результат: ",0

SECTION .text
global _start

_start:
    pop ecx
    pop edx
    sub ecx, 1

    mov esi, 0

next:
    cmp ecx, 0
    jz _end

    pop eax
    call atoi

    call _f

    add esi, eax
    loop next

_end:
    mov eax, msg_f
    call sprintLF

    mov eax, msg_res
    call sprint

    mov eax, esi
    call iprintLF

    call quit

_f:
    imul eax, 15
    add eax, 2
    ret

