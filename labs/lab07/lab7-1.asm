%include "in_out.asm"

SECTION .data
msg1 db "Сообщение № 1", 0
msg2 db "Сообщение № 2", 0
msg3 db "Сообщение № 3", 0

SECTION .text
global _start

_start:
    jmp _label3

_label1:
    mov eax, msg1
    call sprintLF
    jmp _end

_label2:
    mov eax, msg2
    call sprintLF
    jmp _label1

_label3:
    mov eax, msg3
    call sprintLF
    jmp _label2

_end:
    call quit

