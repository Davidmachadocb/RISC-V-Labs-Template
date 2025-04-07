
/*

    t0 : array
    t1 : aux variable for max
    t2 : index of LOOP

*/

.section .text
.global func

func:

    lw t1, 0(a0) 
    li t2, 10

    LOOP:
        beqz t2, EXIT
        ble t1, t0, UPDATE # if t1 <= t0 then target

    NEXT:
        addi t2, t2, -1
        addi a0, a0, 4
        lw t0, 0(a0)
        j LOOP

    UPDATE:
        add t1, t0, x0
        j NEXT

    EXIT:
        sw t1, 0(a1) # 
        ret
