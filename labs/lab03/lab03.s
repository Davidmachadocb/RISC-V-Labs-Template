/*
    t0 : array
    t1 : result
    t2 : index
    t3 : max size array
*/
.section .text
.global func

func:

    lw t0, 0(a0)

    li t1, 0
    li t2, 1
    li t3, 4

    add t1, t1, t0

    LOOP:
        beq t2, t3, EXIT  
        addi a0, a0, 4
        lw t0, 0(a0)
        sll t0, t0, t2
        add t1, t1, t0 
        addi t2, t2, 1

        j LOOP

    EXIT:
        sw t1, 0(a1) 
        ret
