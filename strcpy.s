# Wajde fadool 
# Name srtcpy 
# Description : simple implimntaion for strcpy 
# Given: str1: sorce 
#        str2: destaniton 

.data
    str1: .asciiz "What did the fox say?" 
    str2: .space 32        

.text 

main:  nop # Main entry point 
    la		$t0, str1		# 
    la		$t1, str2		# 

loop: 
    lbu		$t2, 0($t0)		#  load the first byte of $t0 into $t2 
    sb		$t2, 0($t1)		#  store to first byte of $t1 what ever in $t2
    
    addi	$t0, $t0, 1			# $t0 = $t0 + 1
    addi	$t1, $t1, 1			# $t1 = $t1 + 1
    
    bnez    $t2, loop       # while $t2 != null meaning no character  
    jr		$ra					    # jump to $ra
        