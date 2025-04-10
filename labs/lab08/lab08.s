.section .text
.global fibo

fibo:
    li t0, 2
    bge a0, t0, RECURSIVE
    ret

RECURSIVE:
    # allocate space on stack
    # store saved registers on stack
    addi sp, sp, -24
    sd ra, 16(sp)
    sd s1, 8(sp)
    sd s0, 0(sp)
    
    #save original a0
    mv s0, a0
    
    #s1 = f(n-1)
    addi a0, s0, -1
    call fibo
    mv s1, a0
    
    #s2 = f(n-2)
    addi a0, s0, -2
    call fibo
    add a0, s1, a0
    
    # restore saved registers from stack
    # restore stack pointer
    ld ra, 16(sp)
    ld s1, 8(sp)
    ld s0, 0(sp)
    addi sp, sp, 24
    
    ret