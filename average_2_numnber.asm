# constants 
# this program input tw0 numbers from the user and print ther average 
# ex :   n = 10 , m = 20 --> prints 15 

.data
str1: .asciiz "Enter 1st : "
str2: .asciiz "Enter 2nd: "
result: .asciiz " average : "

.text
main: nop # average sub program
    li		$v0, 4		# $v0 = 4
    la		$a0, str1	
    syscall 
    li      $v0, 5
    syscall
    move    $t0 , $v0
    
    li		$v0, 4		# $v0 = 4
    la		$a0, str2
    syscall 
    li      $v0, 5
    syscall
    move    $t1 , $v0    
    
    #stotre the varables in $a0 , $a1
    move    $a0 , $t0    
    move    $a1 , $t1    

    # function  call
    addi	$sp, $sp, -4	# $sp = $sp + -4
    sw		$ra, ($sp)		#  push the ra addres to the Stack 
    jal		avg				# jump to average and save position to $ra
    lw		$ra, ($sp)		#  load to a the word that is holded in the top stack
    addi $sp, $sp, 4
    
    jr $ra
        
# this call compute the average of 2 numbers 
#  wheres the numbers holded by $a0, $a1

avg:
    add		$t0, $a0, $a1   # $t0 = $a0 + $a1
    addi	$t1, $zero, 2	# $t0 = $zero + 2
    div		$t3, $t0 , $t1    # $t3 = $t0 / 2 
    
    li		$v0, 4		# $v0 = 4
    la		$a0, result		#  will print your a0 + a1 / 2 = 
    syscall   
    
    li $v0,1 
	move $a0, $t3
	syscall
    
    jr		$ra					# jump to $ra
    
    
    
    
    
    
    


    
        
    
