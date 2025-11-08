%include "in_out.asm"

SECTION .data
ask:    db 'Введите строку: ', 0
echo:   db 'Вы ввели: ', 0

SECTION .bss
buf:    resb 80

SECTION .text
GLOBAL _start

_start:
    ; Выводим приглашение
    mov eax, ask
    call sprintLF

    ; Считываем строку в буфер
    mov ecx, buf
    mov edx, 80
    call sread

    ; Выводим фразу "Вы ввели: "
    mov eax, echo
    call sprint

    ; Выводим саму введённую строку
    mov eax, buf
    call sprintLF

    ; Завершаем программу
    call quit

