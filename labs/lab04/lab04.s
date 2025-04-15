.section .text
.global max_array

max_array:
    # t0 = ponteiro para o array (int*)
    mv t0, a0

    # t1 = contador (index)
    li t1, 0

    # Carrega o primeiro elemento como valor máximo inicial
    lw t2, 0(t0)     # t2 = max (resultado)

LOOP:
    # Verifica se já percorreu o array todo
    beq t1, a1, fim

    # Carrega o valor atual
    slli t3, t1, 2   # t3 = t1 * 4 (offset em bytes, pois cada int tem 4 bytes)
    add t4, t0, t3   # t4 = endereço do elemento atual
    lw t5, 0(t4)     # t5 = elemento atual

    # Se t5 > t2, atualiza t2
    bgt t5, t2, novo_max

continuar:
    addi t1, t1, 1   # index++
    j LOOP

novo_max:
    mv t2, t5        # novo máximo encontrado
    j continuar

fim:
    mv a0, t2        # coloca o resultado em a0
    ret
