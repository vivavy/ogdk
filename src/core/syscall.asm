core$sys_intr:
    cli
    cmp ah, 0
    je core$hang
    cmp ah, 1
    je core$reset
    cmp ah, 2
    je core$putc_trampoline
    cmp ah, 3
    je core$puts
    cmp ah, 4
    je core$getc
    cmp ah, 5
    je core$testk_trampoline
    cmp ah, 6
    je core$sleep
    cmp ah, 7
    je core$setvga
    cmp ah, 8
    je core$gets
    cmp ah, 9
    je core$emukey
    cmp ah, 10
    je core$getmouseposx
    cmp ah, 11
    je core$getmouseposy
    cmp ah, 12
    je core$getmouserelx
    cmp ah, 13
    je core$getmouserely
    cmp ah, 14
    je core$setmouseposx
    cmp ah, 15
    je core$setmouseposy
    cmp ah, 16
    je core$emumouserelx
    cmp ah, 17
    je core$emumouserely
    cmp ah, 18
    je core$savebyte
    cmp ah, 19
    je core$readbyte
    cmp ah, 20
    je core$saves
    cmp ah, 21
    je core$reads
    cmp ah, 22
    je core$savebuf
    cmp ah, 23
    je core$readbuf
    cmp ah, 24
    je core$readsects
    cmp ah, 25
    je core$savesects
    cmp ah, 26
    je core$dispflip
    cmp ah, 27
    je core$getticks
    cmp ah, 28
    je core$nilticks
    cmp ah, 29
    je core$catch
    cmp ah, 30
    je core$saveall
    cmp ah, 31
    je core$getsaveall
    cmp ah, 32
    je core$readall
    cmp ah, 33
    je core$cleardisp
    cmp ah, 34
    je core$getdelta ; first request gives 1/18 of second
    jmp core$unkcmd

core$epigraph:
    sti
    iret
