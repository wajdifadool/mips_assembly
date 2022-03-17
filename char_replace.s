# replace char with another char in string
# replace all a with * in abracadbra 
sys_print_int = 1 # $a0 = integer to be printed 
sys_print_string = 4 # $a0 = address of string in memory
sys_read_int = 5 # Integer returned in $v0
sys_read_string = 8 # $a0, $a1 = address, size of string input buffer 
sys_exit = 10 
sys_print_char = 11 # $a0 = character to be printed sys_read_char = 12 # Char returned in $v0


.data
    str1: .asciiz "abracadbra"
    char1: .asciiz "a"
    char2: .asciiz "*"
    
.text
main: nop   # $$$$ MAIN ENtry POINT
    la		$a0, str1			# $a0 = str1
    la		$a1, char1			# $a0 = char
    la      $a2, char2
    lbu     $t4, 0($a2)
    lbu     $t1, 0($a1)         # loac "a" in $t1 
    move 	$s0, $a0		    # $s0 = $a0 Holds Pointer for str adress in data 
    
compare:
    lbu		$t0, 0($a0)		    # load upper byte of abracadbra
    beq		$t0, $t1, replace	# if $t0 == $t1 then replace
    addi    $a0 , $a0 , 1
    beq     $t0 , $zero , completed  #
    j       compare

#rpelace the char
replace:
    sb     $t4, 0($a0) # load desierd char to be replaced into $a0
    addi    $a0 , $a0 , 1 
    j compare
# completed     
completed: 
    li      $v0 , sys_print_string
    move 	$a0, $s0		# $a0 = $s0
    syscall
    
    jr      $ra
    
