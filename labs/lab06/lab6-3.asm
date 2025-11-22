%include "in_out.asm"

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 6
    mul ebx
    add eax, 2

    xor edx, edx   ; обнуляем edx перед делением
    mov ebx, 5
    div ebx        ; eax = частное, edx = остаток

    mov esi, eax   ; сохраняем частное
    mov edi, edx   ; сохраняем остаток

    mov eax, esi
    call iprintLF  ; выводим частное

    mov eax, edi
    call iprintLF  ; выводим остаток

    call quit
