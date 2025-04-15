.section .text
.global bubble_sort

bubble_sort:
    addi t0, a1, -1        # t0 = n - 1 (número de passes)

outer_loop:
    beqz t0, end           # Se t0 == 0, acabou
    li t1, 0               # t1 = índice do inner loop (i = 0)

inner_loop:
    add t2, a0, t1         # t2 = endereço de array[i]
    lb t3, 0(t2)    # carrega byte com sinal
    lb t4, 1(t2)    # t4 = array[i+1]

    bge t3, t4, skip_swap  # Se array[i] >= array[i+1], não troca

    # Swap array[i] e array[i+1]
    sb t4, 0(t2)           # array[i] = array[i+1]
    sb t3, 1(t2)           # array[i+1] = array[i]

skip_swap:
    addi t1, t1, 1         # i++
    addi t5, a1, -1        # t5 = n - 1
    blt t1, t5, inner_loop # enquanto i < n-1

    addi t0, t0, -1        # t0--
    j outer_loop

end:
    ret
