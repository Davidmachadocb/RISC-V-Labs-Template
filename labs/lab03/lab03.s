.section .text
.global func

func:
    mv t0, a0        #ponteiro da string (char*) -> t0
    li t1, 0         #acumulador do resultado -> t1

LOOP:
    lbu t2, 0(t0)    #carrega byte da string (unsigned)
    beqz t2, fim     #se for \0, termina

    slli t1, t1, 1   #multiplica acumulador por 2

    addi t2, t2, -48
    add t1, t1, t2   #soma 1 ao acumulador

    j avancar

avancar:
    addi t0, t0, 1   #avança para o próximo caractere
    j LOOP

fim:
    sw t1, 0(a1)     #salva o resultado em *result
    ret