.section .text
.globl fibonacci

fibonacci:
    # a0 = N (número de termos)
    # a1 = ponteiro para o array

    li t0, 0         # t0 = i (contador)
    li t1, 0         # t1 = primeiro número (fib0)
    li t2, 1         # t2 = segundo número (fib1)

loop:
    beq t0, a0, fim          # se i == N, fim

    beq t0, zero, store0     # se i == 0, armazena 0
    li t3, 1
    beq t0, t3, store1       # se i == 1, armazena 1

    add t4, t1, t2           # t4 = fib(i) = t1 + t2
    mv t1, t2                # atualiza t1
    mv t2, t4                # atualiza t2

    slli t5, t0, 2           # t5 = i * 4 (offset do array)
    add t6, a1, t5           # endereço = array + i*4
    sw t4, 0(t6)             # armazena fib(i)

    addi t0, t0, 1
    j loop

store0:
    slli t5, t0, 2
    add t6, a1, t5
    sw t1, 0(t6)
    addi t0, t0, 1
    j loop

store1:
    slli t5, t0, 2
    add t6, a1, t5
    sw t2, 0(t6)
    addi t0, t0, 1
    j loop

fim:
    ret
