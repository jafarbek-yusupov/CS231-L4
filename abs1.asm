; abs.asm
; nasm -f win64 abs1.asm -o abs1.obj
; golink /console /entry Start abs1.obj kernel32.dll /fo abs1.exe
default rel
extern ExitProcess
section .data
    a dd 5
    b dd 10

section .text
global Start
global Compute_

Start:
    sub  rsp, 40

    mov eax, [a]
    mov ebx, [b]
    cmp eax, ebx   ; a - b = 5-10 = -5   
    js min
    mov ecx, ebx
    jmp exit
    min:
    mov ecx, eax
    exit:
    call ExitProcess