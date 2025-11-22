%include "in_out.asm"

SECTION .data
    msg_x   db "Введите x: ",0
    msg_a   db "Введите a: ",0
    msg_f   db "f(x) = ",0

    x   dd 0
    a   dd 0

SECTION .text
GLOBAL _start

_start:
    mov eax, msg_x
    call sprint
    mov ecx, x
    mov edx, 80
    call sread
    mov eax, x
    call atoi
    mov [x], eax

    mov eax, msg_a
    call sprint
    mov ecx, a
    mov edx, 80
    call sread
    mov eax, a
    call atoi
    mov [a], eax

    mov eax, [x]
    cmp eax, 0
    jne not_zero

    mov eax, [a]
    shl eax, 2
    jmp print_res

not_zero:
    mov eax, [a]
    shl eax, 2
    add eax, [x]

print_res:
    mov ebx, eax
    mov eax, msg_f
    call sprint
    mov eax, ebx
    call iprintLF
    call quit

