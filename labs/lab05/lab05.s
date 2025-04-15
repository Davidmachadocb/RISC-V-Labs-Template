.section .text
.global func

func:
    mv t0, a0          # t0 = ponteiro para o início da string
    mv t1, a0          # t1 vai caminhar para achar o final da string

encontra_fim:
    lbu t2, 0(t1)       # carrega byte
    beqz t2, fim_str    # se for nulo, terminou
    addi t1, t1, 1      # anda para o próximo caractere
    j encontra_fim

fim_str:
    addi t1, t1, -1     # recua para antes do \0 (último caractere válido)

troca:
    bge t0, t1, fim     # se começo >= fim, terminou

    lbu t2, 0(t0)       # t2 = *t0
    lbu t3, 0(t1)       # t3 = *t1

    sb t3, 0(t0)        # *t0 = t3
    sb t2, 0(t1)        # *t1 = t2

    addi t0, t0, 1      # avança t0
    addi t1, t1, -1     # recua t1
    j troca

fim:
    ret
