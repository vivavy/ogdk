; Don't use if you are not sure what are you doing
macro %__set_cpu_pic_rmode_interrupt__% vec, intr {
    push word 0
    pop es
    mov bx, 0x20*4
    mov word [es:bx + 2], cs
    mov word [es:bx], intr
}


org 7e00h

; first of all, we need system interrupt
%__set_cpu_pic_rmode_interrupt__% 0x20, core$sys_intr

; setup PIT
mov ax, 0 ; frequency = 18 Hz
mov dx, 43h
out byte dx, 36h
mov dx, 40h
out word dx, al
out word dx, ah

jmp core$skip_all

include 'pit.asm'
include 'syscall.asm'
include 'cpu.asm'
include 'tele.asm'
imclude 'kbd.asm'

core$skip_all:
