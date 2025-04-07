/*

Variables
    t1 : input
    t2 : count
    t3 : count of loop
    t4 : result of mask
    t5 : 32 constant

*/
.section .text
.global func

func:
    lw t1, 0(a0) 
    lw t2, 0(a1)

    li t3, 0
    li t5, 32

    LOOP:
        beq t3, t5, EXIT

        andi t4, t1, 1
        add t2, t2, t4
        srl t1, t1, 1

        addi t3, t3, 1     
        j LOOP             

    EXIT:
        sw t2, 0(a1) 
        ret
