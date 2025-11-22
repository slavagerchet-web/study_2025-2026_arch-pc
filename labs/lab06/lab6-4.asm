%include "in_out.asm"

section .data
    msg_expr db "f(x) = 10*(x + 1) - 10", 0
    msg_x    db "Введите x: ", 0
    msg_res  db "Результат f(x): ", 0

section .bss
    buf     resb 32

section .text
    global _start

_start:
    mov eax, msg_expr
    call sprintLF

    mov eax, msg_x
    call sprint

    mov ecx, buf
    mov edx, 32
    call sread

    mov eax, buf
    call atoi

    inc eax
    mov ebx, 10
    imul ebx
    sub eax, 10

    mov ebx, eax

    mov eax, msg_res
    call sprint

    mov eax, ebx
    call iprintLF

    call quit
