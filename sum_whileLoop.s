#compute the sum of 1 + 2 + 3 + ... + N 
sys_print_int = 1 # $a0 = integer to be printed 
sys_print_string = 4 # $a0 = address of string in memory
sys_read_int = 5 # Integer returned in $v0
sys_read_string = 8 # $a0, $a1 = address, size of string input buffer 
sys_exit = 10 
sys_print_char = 11 # $a0 = character to be printed 
sys_read_char = 12 # Char returned in $v0

.data 
    msg1: .asciiz "Enter N: " 
    msg2: .asciiz "Result is:\n" 

.text 
    main: nop # main entrety Point

    li $v0 , 4 
    la $a0 , msg1 
    syscall 
    # value retuerned in $ v0
    li $v0 , 5 
    syscall 
    move $t0 ,$v0  #$t0 = N
    
    # init vars with 0 
    li $t1 , 0 
    li $t2 , 0 
    j sum
    
# $t1 = conut 
# $t2 = sum
sum: 
    addi $t1 , 1 
    add $t2 , $t2 , $t1  # sum = sum + $t1 
    beq $t1 , $t0 , done 
    j sum
done:
    li $v0 , 4 
    la $a0 , msg2
    syscall 
    li $v0 , sys_print_int
    move $a0 , $t2
    syscall
    jr $ra 