# Arithmetic progression
sys_print_int = 1 # $a0 = integer to be printed  
sys_print_string = 4 # $a0 = address of string in memory 
sys_read_int = 5 # Integer returned in $v0 
sys_read_string = 8 # $a0, $a1 = address, size of string input buffer 
sys_exit = 10 
sys_print_char = 11 # $a0 = character to be printed 
sys_read_char = 12 # Char returned in $v0

.data 
    str0:   .asciiz "Enter a1 :" 
    str1:   .asciiz "Enter d : " 
    str2:   .asciiz "Enter n : " 
    str3:   .asciiz "an (the the n-th term)" 
    str4:   .asciiz "\nSn ( the sum of the first n terms )" 
     
    
.text 
main: 
    # a 1
    li $v0 , sys_print_string 
    la $a0 ,str0 
    syscall 
    li $v0 , sys_read_int
    syscall 
    move 	$t0, $v0		# $t0 = $v0

    # d 
    li $v0 , sys_print_string 
    la $a0 ,str1
    syscall
    li $v0 , sys_read_int
    syscall 
    move 	$t1, $v0		# $t0 = $v0

    # d 
    li $v0 , sys_print_string 
    la $a0 ,str2
    syscall 
    li $v0 , sys_read_int
    syscall 
    move 	$t2, $v0		# $t0 = $v0
    
    # make copy 0of n 
    move $s0 , $t2 
    

    # fourmila an = a1 + d.(n-1)
    # t0 = a1 
    # t1 = d
    # t2 = n
    # let $t3 = an 
    li      $t3 , 0 
    addi    $t2 , $t2 , -1 
    mult	$t2, $t1			# $t0 * $t1 = Hi and Lo registers
    mflo	$t3					# copy Lo to $t2
    add		$t3, $t3, $t0		# $t3 = $t3 + $t0
    # $ t3 is now an move it to $ s1
    move $s1  , $t3 
    
    
    
    # s1 = an 
    # $t0 , a1 
    # now i want to find Sn Fourmila Sn = 0.5 * n(a1 + an)
    add $t0 , $t0 , $s1  
    mult	$t0, $s0			# $t0 * $s0 = Hi and Lo registers
    mflo	$t0					# copy Lo to $t2
    sra     $t0 , $t0 , 1       # divied by 2 
    # save the sn in $s2 
    move $s2  , $t0
    
    #print an , sn 
    li  $v0,sys_print_string
    la  $a0 , str3
    syscall 
    
    li  $v0,sys_print_int
    move  $a0, $s1
    syscall 
    
    
    #print  sn 
    li  $v0,sys_print_string
    la  $a0 , str4
    syscall 
    
    li  $v0,sys_print_int
    move  $a0 , $s2
    syscall 
    
    jr $ra
    
    
     
    
    









    