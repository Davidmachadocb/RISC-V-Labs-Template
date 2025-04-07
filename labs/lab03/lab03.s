.section .text
.global func

func:
    mv t0, a0        # Ponteiro da string (char*) -> t0
    li t1, 0         # Acumulador do resultado -> t1

loop:
    lbu t2, 0(t0)    # Carrega byte da string (unsigned)
    beqz t2, fim     # Se for \0, termina

    slli t1, t1, 1   # Multiplica acumulador por 2

    li t3, '1'       # Compara com '1'
    beq t2, t3, set_bit

    j avancar

set_bit:
    addi t1, t1, 1   # Soma 1 ao acumulador

avancar:
    addi t0, t0, 1   # Avança para o próximo caractere
    j loop

fim:
    sw t1, 0(a1)     # Salva o resultado em *result
    ret