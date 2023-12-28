core$putc_trampoline:
    xor dh, dh

core$putc:
    cmp al, 10
    je core$putc_newline
    cmp al, 8
    je core$putc_backspace
    cmp al, 9
    je core$putc_tab

    mov bx, word [curpos]
    push es word 0b8000h
    pop es
    mov byte [es:bx], al
    inc bx
    mov word [curpos], bx

    pop es
    cmp dh, 1
    jne core$epigraph
    jmp core$puts_checkpoint

core$putc_newline:
    xor eax, eax
    mov word ax, [curpos]
    mov dl, byte [mode_width]
    div dl
    inc ax
    mul dl
    mov word [curpos], ax
    cmp dh, 1
    jne core$epigraph
    jmp core$puts_checkpoint

core$putc_backspace:
    mov bx, word [curpos]
    push es word 0b8000h
    pop es
    mov byte [es:bx], ' '
    dec word [curpos]
    pop es
    cmp dh, 1
    jne core$epigraph
    jmp core$puts_checkpoint

core$putc_tab:
    mov bx, word [curpos]
    push es word 0b8000h
    pop es
    mov cx, 4
@@:
    mov byte [es:bx], ' '
    inc bx
    loop @b
    add word [curpos], 4
    pop es
    cmp dh, 1
    jne core$epigraph
    jmp core$puts_checkpoint

core$puts:
    mov si, bx ; needed for lodsb
    mov dh, 1  ; string flag
@@:
    lodsb
    cmp al, 0
    je @f
    jmp core$putc
core$puts_checkpoint:
    jmp @b
@@:
    jmp core$epigraph
