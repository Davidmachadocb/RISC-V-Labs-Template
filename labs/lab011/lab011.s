.section .text
.global func

func:
    # a0: ponteiro para a matriz A
    # a1: ponteiro para a matriz B
    # a2: ponteiro para a matriz C
    # a3: m (número de linhas de A)
    # a4: p (número de colunas de A / número de linhas de B)
    # a5: n (número de colunas de B)

    mv t0, a3          # t0 = m
    mv t1, a4          # t1 = p
    mv t2, a5          # t2 = n

    li t3, 0           # i = 0
outer_loop:
    bge t3, t0, end    # se i >= m, termina

    li t4, 0           # j = 0
inner_loop:
    bge t4, t2, next_i # se j >= n, vai para próxima linha

    li t5, 0           # k = 0
    li t6, 0           # acumulador

multiply_loop:
    bge t5, t1, store_result

    # A[i][k]
    mul s0, t3, t1      # s0 = i * p
    add s0, s0, t5      # s0 = i * p + k
    slli s0, s0, 2      # s0 *= 4 (offset em bytes)
    add s1, a0, s0      # s1 = endereço de A[i][k]
    lwu s2, 0(s1)       # s2 = A[i][k]

    # B[k][j]
    mul s3, t5, t2      # s3 = k * n
    add s3, s3, t4      # s3 = k * n + j
    slli s3, s3, 2      # s3 *= 4 (offset em bytes)
    add s4, a1, s3      # s4 = endereço de B[k][j]
    lwu s5, 0(s4)       # s5 = B[k][j]

    # t6 += A[i][k] * B[k][j]
    mul s6, s2, s5      # s6 = A[i][k] * B[k][j]
    add t6, t6, s6

    addi t5, t5, 1
    j multiply_loop

store_result:
    mul s7, t3, t2      # s7 = i * n
    add s7, s7, t4      # s7 = i * n + j
    slli s7, s7, 2      # s7 *= 4 (offset em bytes)
    add s8, a2, s7      # endereço de C[i][j]
    sw t6, 0(s8)

    addi t4, t4, 1
    j inner_loop

next_i:
    addi t3, t3, 1
    j outer_loop

end:
    ret
