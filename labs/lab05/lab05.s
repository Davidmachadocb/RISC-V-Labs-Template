.section .text
.global func

func:

    addi sp, sp, -4      # reserve stack
    sw a0, 0(sp)         # save in stack

    call strlen

    lw a1, 0(sp)          # restore a0 into a1
    addi sp, sp, 4        # clean up stack

strlen:
    mv  t1, x0
    COUNT:
        lbu  t0, 0(a0)
        beqz t0, EXIT
        addi t1, t1, 1
        addi a0, a0, 1
        j COUNT

    EXIT: 
        ret