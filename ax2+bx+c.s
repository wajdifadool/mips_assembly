.text 
main:
	# read an integer from the user 
	la 		$a0, prom1 
	jal		prompt_int				# jump toprompt_int and save position to $ra
	
	# we want to save x 
	sw 		$v0, x
	
	# Acsses registars throgh memorey offset 
	addi	 $t3, $t3, 4
	
	#load in hr base adress form the constants label 
	lw 		$t4,0($t3)
		
	# Load on The Constants 
	lw 		$t0, 0($t4)
	lw 		$t1, 4($t4)
	lw 		$t2, 8($t4)
			
	#do the caluclation 
	lw 		$s0,x
		
	mul 	$t5 , $s0,$s0 # x*x
	mul 	$t5 , $t5,$t0 # a *x*x
	mul 	$t6 ,$t1,$s0 #bx
	add 	$t5, $t5,$t6  #axx+bx
	add 	$t5 , $t5, $t2 # axx + bx + c
			
	#we want to have 2 argumnet for the function
	la 		$a0, prom2  # a0 is the string 
	move 	$a1, $t5  # $a1 The equation result
	jal 	print_init
		
	jal terminate
			
.data
# Stores address of "constants" label
mem_a: .word 5
mem_b: .word 3
mem_c: .word 1

# some space to store the result of x 
x: .word 0 
prom1: .asciiz "Enter the value for x " 
prom2: .asciiz  "THe result for Ax^2 + Bx +c = " 

.include "utils.asm" 						 
						 						 						 
			