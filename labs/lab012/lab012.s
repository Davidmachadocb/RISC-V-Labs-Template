.section .data
color_strings:
    .word black, blue, green, red, white  # array de ponteiros para strings
black:
    .string "Black"
blue:
    .string "Blue"
green:
    .string "Green"
red:
    .string "Red"
white:
    .string "White"

type_strings:
    .word convertible, supercar, suv, minivan
convertible:
    .string "Convertible"
supercar:
    .string "Supercar"
suv:
    .string "SUV"
minivan:
    .string "Minivan"

output_format:
    .string "A [%s] [%s]!\n"  # formato da saída

.section .text
.global num_to_string

num_to_string:
    # a0 = ponteiro para a struct car
    # carrega campos da struct
    lw t0, 0(a0)          # t0 = color
    lw t1, 4(a0)           # t1 = type

    # jumptable para cores (duvida)
    la t2, color_strings   # t2 = endereço da tabela de cores
    slli t0, t0, 2         # t0 *= 4 (índice para palavras)
    add t2, t2, t0         # t2 = color_strings + offset
    lw t3, 0(t2)           # t3 = ponteiro para a string da cor

    # jumptable para tipos (duvida)
    la t4, type_strings     # t4 = endereço da tabela de tipos
    slli t1, t1, 2         # t1 *= 4
    add t4, t4, t1         # t4 = type_strings + offset
    lw t5, 0(t4)           # t5 = ponteiro para a string do tipo

    # prepara para chamar printf (usando a convenção de chamada C)
    # printf(output_format, t3, t5)
    la a0, output_format   # a0 = formato
    mv a1, t3              # a1 = string da cor
    mv a2, t5              # a2 = string do tipo
    call printf            # Chama printf (linkado com libc)

    ret