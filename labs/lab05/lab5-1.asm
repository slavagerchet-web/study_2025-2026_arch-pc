; lab5-1.asm — программа ввода и вывода строки
; Автор: Герчет Вячеслав, НКАбд-03-25
; Лабораторная №5, Архитектура компьютеров

SECTION .data
msg: DB 'Введите строку: ', 0Ah
msgLen: EQU $ - msg

SECTION .bss
buf: RESB 80

SECTION .text
GLOBAL _start

_start:
    ; вывод приглашения
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, msgLen
    int 80h

    ; чтение строки
    mov eax, 3
    mov ebx, 0
    mov ecx, buf
    mov edx, 80
    int 80h

    ; вывод введённой строки
    mov eax, 4
    mov ebx, 1
    mov ecx, buf
    mov edx, 80
    int 80h

    ; завершение программы
    mov eax, 1
    mov ebx, 0
    int 80h
