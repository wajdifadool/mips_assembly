# count he occurence of char in given string

sys_print_int = 1 # $a0 = integer to be printed 
sys_print_string = 4 # $a0 = address of string in memory
sys_read_int = 5 # Integer returned in $v0
sys_read_string = 8 # $a0, $a1 = address, size of string input buffer 
sys_exit = 10 
sys_print_char = 11 # $a0 = character to be printed sys_read_char = 12 # Char returned in $v0

.data
    str1: .asciiz "abracadbra"
    char: .asciiz "a"    
.text

main: nop   # $$$$ MAIN ENtry POINT
    la		$a0, str1			# $a0 = str1
    la		$a1, char			# $a0 = char
    li      $t2 , 0            # counter
    lbu     $t1, 0($a1)         # load char 
    
count:
    lbu		$t0, 0($a0)		    # load upper byte
    addi    $a0 , 1
    beq     $t0 , $t1 , increaseCount  #compare $t0 , $t1
    beq     $t0 , $zero , completed  #
    j       count
    
increaseCount: 
    addi	$t2, 1
    j count
    
# completed     
completed: 
    li      $v0 , sys_print_int
    move    $a0 , $t2
    syscall
    
    jr      $ra
    
