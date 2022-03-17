# wajde fadool
#   save the powers of 2 into data segment!

sys_print_int = 1 # $a0 = integer to be printed 
sys_print_string = 4 # $a0 = address of string in memory
sys_read_int = 5 # Integer returned in $v0
sys_read_string = 8 # $a0, $a1 = address, size of string input buffer 
sys_exit = 10 
sys_print_char = 11 # $a0 = character to be printed sys_read_char = 12 # Char returned in $v0


.data 
    
    out1:  .asciiz "Enter Higer Exponant: "
    new_line: .asciiz "\n"
    sequ: .align 40
.text

main: nop # $$$$ MAIN ENtry POINT
    li      $v0 , 4 
    la      $a0,    out1 
    syscall 
    li      $v0,    sys_read_int
    syscall 
    
    move 	$s0, $v0    		# $s0 = $a0  store  exponenet int $s0 
    
    li      $t0 , 1 
    li      $t1 , 0 
    la      $t2 , sequ 
# do the callculation with left logical shifiting !     
powers:
    sll		$t0, $t0, 1			# $t0 = $t0 << 1
    addi    $t1 , $t1 , 1       # $t1 = $t1 + 1 
    sw		$t0, 0($t2)		    # $t2 + 0  = $t0 
    addi    $t2 , $t2 , 4       # the next word !
    
    # print the number 
    move 	$a0, $t0		    # $t0 = $t1
    
    li      $v0 , sys_print_int
    syscall 
    
    #print new line 
    li      $v0 , 4
    la      $a0 , new_line
    syscall
    
    bne		$t1, $s0, powers     # if $t1 != $s0 then powers
    jr      $ra
    
    






