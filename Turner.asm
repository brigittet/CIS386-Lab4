    .data
A:  .word 1, 2, 3, 4, 5, 6, 7, 8
B:  .word 1, 2, 3, 4, 5, 6, 7, 8
    .text
main:
     li $s0, 2
     li $s1, 1
     la $s2, A
     la $s3, B  
     #get address of B[3]
     addi $t0, $s3, 12
     #get i-j
     sub $t1, $s0, $s1
     #get i+j
     add $t2, $s0, $s1
     #get A[i-j]
     sll $t3, $t1, 2
     add $t4, $s2, $t3
     lw $t5, 0($t4)
     #get A[i+j]
     sll $t6, $t2, 2
     add $t7, $s2, $t6
     lw $t8, 0($t7)
     #get A[i-j] + A[i+j]
     add $t9, $t5, $t8
     #assign to B[3]
     sw $t9, 0($t0)
     