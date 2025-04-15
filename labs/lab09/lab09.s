.section .text
.globl printlen

printlen:
    # a0 contém o ponteiro da string
    mv t0, a0        # t0 = ponteiro da string (vai ser usado para percorrer)
    li t1, 0         # t1 = contador (length)

loop:
    lb t2, 0(t0)     # carrega 1 byte (caractere) de t0 para t2
    beq t2, zero, fim # se t2 == 0 (null terminator), fim

    # imprimir caractere
    mv a0, t2
    li a7, 11        # syscall print_char
    ecall

    addi t1, t1, 1   # incrementa contador
    addi t0, t0, 1   # avança para o próximo caractere
    j loop

fim:
    # imprimir '\n'
    li a0, 10        # 0x0A
    li a7, 11
    ecall

    mv a0, t1        # retorna o tamanho da string em a0
    ret
