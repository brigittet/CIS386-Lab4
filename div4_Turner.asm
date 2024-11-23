.data
array: .word 1, 2, 4, 8, 9, 11, 12, 16, 21, 24
.text
main:
    #i
    addi $s0, $zero, 0
    #length
    addi $s1, $zero, 10
    #count
    addi $s2, $zero, 0
    #address of array
    la $t0, array
loop:
    #check if i is greater than length
    bge $s0, $s1, exit
    lw $t1, 0($t0)
    li $t2, 4
    move $t3, $t1
subtract:
    #subtract 4 from value
    sub $t3, $t3, $t2
    #check if value is less than zero
    blt $t3, $zero, isNegative
    #if positive, keep subtracting
    j subtract

isNegative:
    #undo prev subtraction
    add $t3, $t3, $t2
    #check if equal to zero (is divisible)
    bnez $t3, notDivisible

    #increase count
    addi $s2, $s2, 1

notDivisible:
    #move to next array value
    addi $s0, $s0, 1
    addi $t0, $t0, 4

    j loop

exit:
    #print count
    move $a0, $s2
    li $v0, 1
    syscall

    li $v0, 10
    syscall