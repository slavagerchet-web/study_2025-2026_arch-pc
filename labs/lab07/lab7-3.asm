%include "in_out.asm"

section .data
    a_val   dd 21
    b_val   dd 28

    msg_c   db "Введите c: ", 0
    msg_min db "Минимальное число: ", 0

section .bss
    c_buf   resb 32
    c_val   resd 1
    min     resd 1

section .text
    global _start

_start:
    ; --- ввод c с клавиатуры ---
    mov eax, msg_c
    call sprint

    mov ecx, c_buf
    mov edx, 32
    call sread

    mov eax, c_buf
    call atoi          ; eax = c
    mov [c_val], eax   ; сохраняем c

    ; --- min = a ---
    mov eax, [a_val]
    mov [min], eax

    ; --- если b < min, то min = b ---
    mov eax, [b_val]
    cmp eax, [min]
    jge check_c
    mov [min], eax

check_c:
    ; --- если c < min, то min = c ---
    mov eax, [c_val]
    cmp eax, [min]
    jge print_result
    mov [min], eax

print_result:
    mov eax, msg_min
    call sprint

    mov eax, [min]
    call iprintLF

    call quit

