format binary as "raw"

include "boot/mbr.asm"
include "core/main.asm"
include "prog/main.asm"

times 33*512-$+$$ db 0
