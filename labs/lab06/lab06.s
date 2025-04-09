.section .text
.global func

func:
    beqz a1, PUSH

POP:
    lw t0, 0(sp)
    addi sp, sp, 4
    sw t0, 0(a2)
    ret

PUSH:
    addi sp, sp, -4
    sw a0, 0(sp)
    ret
