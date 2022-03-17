# Wajde fadool 
# Name reverse in place  
# Description : simple implimntaion for strlen 
.data 
input: .asciiz "wajde"
output: .space 128

.text
main: nop # ENTREY

    la          $t0,    input
    # find the string length 
    addi        $sp, $sp, -4 
    sw          $ra, ($sp)
    jal         length
    lw          $ra ($sp)
    addi        $sp, $sp, 4
    
    
    # hold addresses for first and last char 
    # hold addresses for first and last char 
    addi    $t0 , 0
    addi	$t1, $s0, -1			# $t1 = $ts0+ -1
    
    
    addi        $sp , $sp , -4 
    sw          $ra, ($sp )
    jal         swap_chars
    lw          $ra , ($sp)
    addi        $sp , $sp , 4 
    
    
    # print the strign 
    li $v0 ,4   
    la $a0 , input 
    syscall 
    jr $ra
    
    
swap_chars:    
	# lb		$t5, input($t1) 	# 
	# lb		$t6, input($t2) 	# 
	# sb		$t6, input($t1) 	# 
	# sb		$t5, input($t2) 	# 
	# addi	$t1, $t1, 1			# 
	# addi	$t2, $t2, -1		#
	# slt		$t3, $t1, $t2		# $t3 = ($t2 < $t1) ? 1 : 0
	# bne		$t3, $zero, swap_chars	# if $t3 != $zero then swap_chars
	# jr		$ra
    
    lb      $t2 , input($t0)
    lb      $t3, input($t1)
    
    sb      $t3 , input($t0)
    sb      $t2 , input($t1) 
    
    addi    $t0 ,$t0 , 1 
    addi    $t1, $t1, -1
        
    slt		$t4, $t0, $t1		# $t4 = ($t0 < $t1) ? 1 : 0
    bnez    $t4  , swap_chars 
    jr $ra
    
#   Description : find length iof given string
#   Arguments:     $t1, 
#   return: $s0 
length: 
    lbu     $t2 , 0($t0)  #loa the first byte of $t0 in $t2
    addi    $t0 , $t0 , 1   # increase $t0 address count 
    addi    $t3 , $t3 , 1 
    bne     $t2 , $zero , length 
    #strore  length in $s0 and clear $t3 , $t2 , $t0 
    addi    $s0 ,  $t3, -1   
    li		$t0, 	0 	# $t0 = 
    li		$t2, 	0
    li		$t3, 	0
    jr $ra
    
    
	
    
 

