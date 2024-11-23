.data
array: .word 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 0
.text
main:
    #initialize registers
    li $s0, 0
    la $t0, array
loop:
    #get first value of array
    lw $t1, 0($t0)
    #check if value is 0
    beqz $t1, isZero
    #increment
    addi $s0, $s0, 1
    #next value
    addi $t0, $t0, 4
    j loop

isZero:
    #print count
    move $a0, $s0
    li $v0, 1
    syscall

    li $v0, 10
    syscall