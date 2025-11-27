%include 'in_out.asm'

SECTION .data
msg_f   db "Функция: f(x)=15x+2",0
msg_res db "Результат: ",0

SECTION .text
global _start

_start:
    ; извлекаем количество аргументов и имя программы
    pop ecx        ; ecx = количество аргументов (включая имя)
    pop edx        ; имя программы
    sub ecx, 1     ; вычитаем имя -> остаются только x1..xn

    mov esi, 0     ; esi = сумма f(x)

next:
    cmp ecx, 0
    jz  _end       ; если аргументов больше нет -> выходим

    pop eax        ; eax = адрес строки аргумента
    call atoi      ; eax = x (число)

    ; ---- тут считаем f(x) = 15x + 2 ----
    imul eax, 15   ; eax = 15 * x
    add eax, 2     ; eax = 15x + 2
    ; ------------------------------------

    add esi, eax   ; суммируем f(x): S += f(x)

    loop next

_end:
    ; выводим строку "Функция: f(x)=15x+2"
    mov eax, msg_f
    call sprintLF

    ; выводим "Результат: "
    mov eax, msg_res
    call sprint

    ; выводим сумму
    mov eax, esi
    call iprintLF

    call quit
