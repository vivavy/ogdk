core$hang: ; hang but save interrupts
    hlt
    jmp $-1
    jmp $-2
    jmp core$epigraph

core$reset:
    jmp 0ffffh:0
