.section .data
texto_m: .asciz "m = "
texto_n: .asciz " n = "
newline: .byte 10, 0

.section .text
.globl ackermann
ackermann:
    # Salvando contexto (stack frame)
    addi sp, sp, -32   # aloca mais espaço para a pilha
    sw ra, 0(sp)       # salva o endereço de retorno
    sw s0, 4(sp)       # salva s0
    sw s1, 8(sp)       # salva s1
    sw s2, 12(sp)      # salva s2
    sw s3, 16(sp)      # salva s3

    # Guardar m em s0, n em s1
    mv s0, a0          # s0 = m
    mv s1, a1          # s1 = n

    # Exibir m e n
    li a7, 1           # syscall print_int
    mv a0, s0
    ecall              # print m
    li a7, 11          # syscall print_char
    li a0, 32          # espaço
    ecall
    li a7, 1           # print_int
    mv a0, s1
    ecall
    li a7, 11
    li a0, 10          # \n
    ecall

    # if (m == 0) return n + 1
    beqz s0, m_zero

    # if (m > 0 && n == 0) return ackermann(m-1, 1)
    beqz s1, n_zero

    # caso1: A(m-1, A(m, n-1))
    # chamada recursiva interna: A(m, n-1)
    addi a0, s0, 0     # a0 = m
    addi a1, s1, -1    # a1 = n - 1
    call ackermann     # resultado vai estar em a0
    mv s2, a0          # s2 = resultado interno

    # Segunda chamada recursiva: A(m-1, resultado)
    addi a0, s0, -1    # a0 = m - 1
    mv a1, s2          # a1 = resultado da primeira chamada
    call ackermann     # resultado final em a0
    j fim

m_zero:
    addi a0, s1, 1     # return n + 1
    j fim

n_zero:
    addi a0, s0, -1    # a0 = m - 1
    li a1, 1           # a1 = 1
    call ackermann
    j fim

fim:
    # restaurar contexto
    lw ra, 0(sp)
    lw s0, 4(sp)
    lw s1, 8(sp)
    lw s2, 12(sp)
    lw s3, 16(sp)
    addi sp, sp, 32   # restaura a pilha
    ret
