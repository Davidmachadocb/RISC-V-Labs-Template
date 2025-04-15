.section .text
.global stack_operation

stack_operation:
    li t0, 0          # t0 será comparado com a0

    beq a0, t0, push  # se a0 == 0 → Push
    j pop             # senão → Pop

push:
    addi sp, sp, -4   # abre espaço na pilha
    sw a1, 0(sp)      # guarda o valor em a1 na pilha
    ret

pop:
    lw a0, 0(sp)      # pega o valor do topo da pilha (salva em a0)
    addi sp, sp, 4    # remove o valor da pilha
    ret
