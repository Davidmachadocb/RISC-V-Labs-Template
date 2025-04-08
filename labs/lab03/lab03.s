.section .text
.global func

func:
    mv t0, a0        #ponteiro da string (char*) -> t0
    li t1, 0         #acumulador do resultado -> t1

LOOP:
    lbu t2, 0(t0)    #carrega byte da string (unsigned)
    beqz t2, fim     #se for \0, termina

    slli t1, t1, 1   #multiplica acumulador por 2

    li t3, '1'       #compara com '1'
    beq t2, t3, set_bit

    j avancar

set_bit:
    addi t1, t1, 1   #soma 1 ao acumulador

avancar:
    addi t0, t0, 1   #avança para o próximo caractere
    j LOOP

fim:
    sw t1, 0(a1)     #salva o resultado em *result
    ret