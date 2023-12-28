core$ticks dw 0 ; it's timer
core$delta dw 0 ; time delta

core$pit_intr:
    cmp word [core$ticks], 0
    jne @f
    inc word [core$delta]
    iret
@@:
    dec word [core$ticks]
    iret

core$sleep:
    mov word [core$ticks], bx
@@:
    cmp word [core$ticks], 0
    jne @b
    jmp core$epigraph
