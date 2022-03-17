.data
str1: .asciiz "Enter name" 
str2: .asciiz "Your name is" 
buf: .space 20 

.text 
main: 

    # print String 
    li			$v0, 4
	la 			$a0, str1
	syscall
    
    
    #read String 
    li $v0 , 8 
    la $a0 , buf 
    li $a1 , 20 
    syscall
    
    move 	$t0, $a0		
    
    # print msg2 
    li $v0 , 4 
    la $a0 , str2
    syscall 
    
    move $a0 , $t0 
    syscall
     
    jr $ra
    
