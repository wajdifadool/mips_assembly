
# remove char Example abracadbra --> a --> brcdbr
sys_print_int = 1 # $a0 = integer to be printed 
sys_print_string = 4 # $a0 = address of string in memory
sys_read_int = 5 # Integer returned in $v0
sys_read_string = 8 # $a0, $a1 = address, size of string input buffer 
sys_exit = 10 
sys_print_char = 11 # $a0 = character to be printed 
sys_read_char = 12 # Char returned in $v0

.data
    str1: .asciiz "abracadbraabamama"
    str2: .asciiz "a"
.text 

main: nop # #### Main ####
    la $a0 , str1 
    la $a1 , str2 
    lbu $t0, 0($a0)   # to increase 
    lbu $t1 , 0($a1 )
    move  $s0, $a0 
compare: nop # compare
    move  $t2, $a0 # string pointer copy 1
    move  $t3, $a0  # string pointer copy 2
    lbu $t0, 0($a0)
    beq $t1 , $t0 , remove
    addi $a0 , $a0 , 1 # increase by one one
    beq  $t0 , $zero , completed 
    j compare
remove:
    # copy of string 
    # get the next 
    addi  $t2, $t2, 1
    lbu   $t4, 0($t2) # b 
    sb    $t4, 0($t3) 
    addi  $t3 , $t3 , 1 
    bne   $t4, $zero , remove
    addi  $a0 , $a0 , 1 
    j compare
    
completed:
    move 	$a0, $s0		# $a0 = $s0
    li      $v0 , sys_print_string
    syscall
    jr $ra