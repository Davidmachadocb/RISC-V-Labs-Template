/*
    t0 - i
    t1 - j
    t2 - k
    t3 - address
    t4 - value from A
    t5 - value from B
    t6 - value from C
*/


.section .text
.global func
func:
    
    # i = 0
    li t0, 0
L1:
    bge t0, a0, EXIT
    
    # j = 0
    li t1, 0
L2:
    bge t1, a0, L1_INC

    # k = 0
    li t2, 0
L3:
    bge t2, a0, L2_INC
    
    # Load A[i,k]
    mul t3, t0, a0       # i*n
    add t3, t3, t2       # i*n+k
    slli t3, t3, 2
    add t3, a1, t3
    lw t4, 0(t3)
    
    # Load B[k,j]
    mul t3, t2, a0       # k*n
    add t3, t3, t1       # k*n+j
    slli t3, t3, 2
    add t3, a2, t3
    lw t5, 0(t3)
    
    # Load C[i,j]
    mul t3, t0, a0       # i*n
    add t3, t3, t1       # i*n+j
    slli t3, t3, 2
    add t3, a3, t3
    lw t6, 0(t3)
    
    # C[i,j] += A[i,k] * B[k,j]
    mul t5, t4, t5
    add t6, t6, t5
    sw t6, 0(t3)
    
    addi t2, t2, 1
    j L3
    
L2_INC:
    addi t1, t1, 1
    j L2
    
L1_INC:
    addi t0, t0, 1
    j L1
    
EXIT:
    ret