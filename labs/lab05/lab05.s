/*
    a0 = source string pointer
    a1 = destination string pointer
*/
.section .text
.global func

func:
    mv t0, a0
    li t1, 0         
    
LEN_LOOP:
    lbu t2, 0(t0)
    beqz t2, REVERSE 
    addi t0, t0, 1   
    addi t1, t1, 1   
    j LEN_LOOP
    
REVERSE:
    add t0, a0, t1   
    addi t0, t0, -1  
    mv t2, a1        
    
COPY_LOOP:
    beqz t1, NULL_TERMINATE  
    lbu t3, 0(t0)            
    sb t3, 0(t2)             
    addi t0, t0, -1          
    addi t2, t2, 1           
    addi t1, t1, -1          
    j COPY_LOOP
    
NULL_TERMINATE:
    sb zero, 0(t2)    
    
    ret              