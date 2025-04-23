.section .data

fmt_str:    .asciz "A %s %s!\n"

# color string pointers (jump table style)
colors:
    .word black, blue, green, red, white

# type string pointers
types:
    .word conv, super, suv, mini

# strings
black:  .asciz "BLACK"
blue:   .asciz "BLUE"
green:  .asciz "GREEN"
red:    .asciz "RED"
white:  .asciz "WHITE"

conv:   .asciz "CONVERTIBLE"
super:  .asciz "SUPERCAR"
suv:    .asciz "SUV"
mini:   .asciz "MINIVAN"


.section .text
.global func

func:
    addi sp, sp, -16
    sw ra, 12(sp)

    # Get color/type ints
    lw t0, 0(a0)         # color
    lw t1, 4(a0)         # type

    #Get address of color
    la t2, colors        # base of color table
    slli t3, t0, 2       # offset = color * 4
    add t2, t2, t3       # address of &colors[color]
    lw a1, 0(t2)         # a1 = string pointer

    # Get address of type
    la t2, types         # base of type table
    slli t3, t1, 2       # offset = type * 4
    add t2, t2, t3       # address of &types[type]
    lw a2, 0(t2)         # a2 = string pointer

    # Call printf("A %s %s!\n", a1, a2)
    la a0, fmt_str
    call printf

    lw ra, 12(sp)
    addi sp, sp, 16
    ret
