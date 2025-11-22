%include "in_out.asm"

section .data
    msg_in  db "Введите номер студенческого билета: ",0
    msg_out db "Ваш вариант: ",0

section .bss
    buf     resb 32

section .text
    global _start

_start:
    mov eax, msg_in
    call sprint

    mov ecx, buf
    mov edx, 32
    call sread

    mov eax, buf
    call atoi          ; eax = сумма цифр номера (Sn)

    xor edx, edx
    mov ebx, 20
    div ebx            ; edx = Sn mod 20
    inc edx            ; вариант = остаток + 1

    mov eax, msg_out
    call sprint

    mov eax, edx
    call iprintLF

    call quit
