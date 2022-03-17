# Wajde fadool 
# Name srtcpy 
# Description : simple implimntaion for strlen 
.data
    str1: .asciiz "Wa"      
    str2: .asciiz "String length is:\n"      
.text 

main:  nop # Main entry point 
    la		$t0, str1		# 
    
loop: 
    lbu		$t2, 0($t0)		#  load the first byte of $t0 into $t2 
    addi	$t0, $t0, 1			# $t1 = $t1 + 1
    addi	$t3, $t3, 1			# $t1 = $t1 + 1
    
    bnez    $t2, loop       # while $t2 != null meaning no character  
    # loop completed !
    
    # print  string  in $a0
    li		$v0, 4		# $v0 = 4
    la		$a0, str2		
    syscall
    # print integer in $a0 
    move 	$a0, $t3		# $v0 = $t1
    li		$v0, 1		# $v0 = 4
    syscall
    jr		$ra					    # jump to $ra