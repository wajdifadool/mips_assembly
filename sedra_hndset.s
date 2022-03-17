# nth elemnet of  Geometric progression
 
sys_print_int = 1 # $a0 = integer to be printed  
sys_print_string = 4 # $a0 = address of string in memory 
sys_read_int = 5 # Integer returned in $v0 
sys_read_string = 8 # $a0, $a1 = address, size of string input buffer 
sys_exit = 10 
sys_print_char = 11 # $a0 = character to be printed 
sys_read_char = 12 # Char returned in $v0

.data 
    str0:   .asciiz "Enter a1 : " 
    str1:   .asciiz "Enter q : " 
    str2:   .asciiz "Enter n : " 
    str3:   .asciiz " nth element is : "
    
.text 
main: 

    # a 1
    li $v0 , sys_print_string 
    la $a0 ,str0 
    syscall 
    li $v0 , sys_read_int
    syscall 
    move 	$t0, $v0		# $t0 = $v0

    # q
    li $v0 , sys_print_string 
    la $a0 ,str1
    syscall
    li $v0 , sys_read_int
    syscall 
    move 	$t1, $v0		# $t0 = $v0

    # n
    li $v0 , sys_print_string 
    la $a0 ,str2
    syscall 
    li $v0 , sys_read_int
    syscall 
    move 	$t2, $v0		# $t0 = $v0

    # fourmila an = a1 * q^(n-1)
    # t0 = a1 
    # t1 = q
    # t2 = n
    # let $t3 = an 
    
# find Q^n-1
    addi    $t2 , $t2 , -2
    move 	$t3, $t1		# $t3 = $t1
    
expo1:
    mult	$t3, $t1			# $t0 * $t1 = Hi and Lo registers
    mflo	$t3		
    addi    $t2  , $t2,  -1 
    bne		$t2, $zero  , expo1	
    
    mult	$t3, $t0			# $t0 * $t1 = Hi and Lo registers
    mflo	$t3					# a0py Lo to $t2
     
    # print sum 
    li  $v0, sys_print_int
    move  $a0 , $t3 
    syscall 
    jr $ra
    
    
     
    
    









    