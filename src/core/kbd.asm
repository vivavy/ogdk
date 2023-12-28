core$getc:
    mov ch, 1 ; getch flag
    mov si, bx
    shr si, 8
@@:
    jmp core$testk
    jz @b
    cmp si, 1 ; gets flag?
    jne core$epigraph
    jmp core$gets_checkpoint

core$testk_trampoline:
    mov ch, 0

core$testk:
    mov dx, 0x64
    in al, dx
    and al, 1
    test al, al
    jz @f
    mov dx, 0x60
    in al, dx
    jmp @f
@@:
    cmp ch, 1
    je core$gets_checkpoint
    jmp core$epigraph