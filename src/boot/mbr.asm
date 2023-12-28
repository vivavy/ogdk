use16
org 7c00h


mov byte [1000h], dl  ; save boot device number

mov ah, 2
mov al, 32
mov bx, 7e00h
mov cx, 2
mov dh, 0
push word 0
pop es
int 13h

jc boot$disk_load_error
mov sp, 7dfeh

jmp 7e00h

boot$disk_load_error:
    mov si, boot$disk_error_message
    call boot$print_az
    cli
    hlt
    jmp $-2

boot$print_az:
    mov ah, 14
@@:
    lodsb
    test al, al
    jz @f
    int 16
    jmp @b
@@:
    ret

boot$disk_error_message db "Error loading from disk", 13, 10, 0

times 1feh-$+$$ db 0
dw 0aa55h
