.section .text

.global func

func:
    # allocate space on stack
    # store saved registers on stack
    addi sp, sp, -24
    sd ra, 16(sp)
    sd s1, 8(sp)
    sd s0, 0(sp)
    
    beq a0, x0, BASE
    beq a1, x0, R1
    blt a0, x0, END
    blt a1, x0, END
    j R2

BASE:
    addi a0, a1, 1
    j END

R1:
    add a0, a0, -1
    li a1, 1
    call func   
    j END

R2:
    mv s0, a0
    addi a1, a1, -1
    call func

    mv a1, a0
    mv a0, s0
    addi a0, a0, -1
    call func
    j END

END:
    # restore saved registers from stack
    # restore stack pointer
    ld ra, 16(sp)
    ld s1, 8(sp)
    ld s0, 0(sp)
    addi sp, sp, 24

    ret