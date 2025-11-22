SECTION .data                        ; секция данных
    hello: db 'Герчет Вячеслав',10      ; строка для вывода + перевод строки
    helloLen: equ $-hello            ; длина строки hello

SECTION .text                        ; секция кода
    global _start                    ; объявляем точку входа

_start:                              ; начало программы
    mov eax, 4                       ; системный вызов write
    mov ebx, 1                       ; стандартный вывод stdout
    mov ecx, hello                   ; адрес строки
    mov edx, helloLen                ; длина строки
    int 80h                          ; вызов ядра (печать строки)

    mov eax, 1                       ; системный вызов exit
    mov ebx, 0                       ; код возврата 0
    int 80h                          ; завершение программы

