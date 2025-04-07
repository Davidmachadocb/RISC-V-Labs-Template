.section .text
.global func

func:
    lw t0, 0(a0)      # Carrega o valor de entrada
    li t1, 0          # Inicializa o contador

count_loop:
    andi t2, t0, 1    # Verifica o bit menos significativo
    add t1, t1, t2    # Soma ao contador
    srli t0, t0, 1    # Desloca para a direita
    bnez t0, count_loop

    sw t1, 0(a1)      # Salva o resultado
    ret
