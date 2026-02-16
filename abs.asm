; abs.asm
; nasm -f win64 abs.asm -o abs.obj
; golink /console /entry Start abs.obj kernel32.dll /fo abs.exe
default rel
extern ExitProcess
section .data
    a dd -7

section .text
global Start
global Compute_

Start:
    sub  rsp, 40

    mov eax, [a]
    test eax, eax
    js abs_func  ; if(a<0) jump to the abs_func label
    mov ecx, [a]    ; otherwise move to ecx the value of a
    jmp exit
    abs_func:
    neg eax
    mov ecx, eax
    exit:
    call ExitProcess
