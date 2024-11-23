.data
input_str: .space 100
input: .asciiz "Enter a number: \n"

.text
main:
    #prompt input
    li $v0, 4
    la $a0, input
    syscall
    #get input
    li $v0, 8
    la $a0, input_str
    li $a1, 100
    syscall
    #remove newline at the end
    la $t0, input_str
trim_newline:
    lb $t1, 0($t0)
    #check if last char is 0
    beqz $t1, end_trim
    #check if last char is newline
    beq $t1, 10, remove_newline
    #go to next char
    addi $t0, $t0, 1
    j trim_newline

remove_newline:
    sb $zero, 0($t0)
end_trim:
    #initialize registers and call procedure
    la $a0, input_str
    li $v1, 0
    li $t0, 0
    jal parseInt
    #print result
    li $v0, 1
    move $a0, $v1
    syscall
    
    li $v0, 10
    syscall

parseInt:
    #get first charactefr
    lb $t1, 0($a0)
    #stop if null
    beq $t1, 0, end
    #stop if non-digit
    li $t2, '0'
    li $t3, '9'
    blt $t1, $t2, nondigit
    bgt $t1, $t3, nondigit
    #convert to int
    sub $t0, $t1, $t2
    #move to next decimal place
    mul $v1, $v1, 10
    #add to result
    add $v1, $v1, $t0
    #next character
    addi $a0, $a0, 1
    j parseInt

nondigit:
    #set result equal to -1
    li $v1, -1
    j end

end:
    jr $ra