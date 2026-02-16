; abs.asm
; nasm -f win64 abs.asm -o abs.obj
; golink /console /entry _start abs.obj kernel32.dll /fo abs.exe
default rel
extern ExitProcess
section .data
    a dd 5
    b dd 10

section .text
global _start
global Compute_

_start:
    sub  rsp, 40

    mov eax, [a]
    mov ebx, [b]
    cmp eax, ebx   ; a - b = 5-10 = -5   
    js min
    test eax, eax
    jns min
    mov ecx, ebx
    jmp exit
    min:
    mov ecx, eax
    exit:
    call ExitProcess