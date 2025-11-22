%include "in_out.asm"

section .data
    msg1 db "Введите B: ", 0
    msg2 db "Наибольшее число: ", 0

    A_str db "20", 0
    C_str db "50", 0

section .bss
    B_str resb 16
    max   resd 1

section .text
    global _start

_start:
    ; выводим приглашение
    mov eax
    call sprint

    ; читаем B как строку
    mov ecx, B_str
    mov edx, 16
    call sread

    ; переводим A в число и кладём в max
    mov eax, A_str
    call atoi
    mov [max], eax        ; max = A

    ; переводим B в число и сравниваем с max
    mov eax, B_str
    call atoi
    cmp eax, [max]
    jle check_C           ; если B <= max, ничего не меняем
    mov [max], eax        ; иначе max = B

check_C:
    ; переводим C в число и сравниваем с max
    mov eax, C_str
    call atoi
    cmp eax, [max]
    jle fin               ; если C <= max, ничего не меняем
    mov [max], eax        ; иначе max = C

fin:
    ; вывод результата
    mov eax, msg2
    call sprint

    mov eax, [max]
    call iprintLF

    call quit

