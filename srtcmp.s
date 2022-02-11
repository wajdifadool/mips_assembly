# Wajde Fadool 
# the same as strcmp form standerd C libary
# DESCRIPTION
#      The strcmp() and strncmp() functions lexicographically compare the null-
#      terminated strings s1 and s2.

#      The strncmp() function compares not more than n characters.  Because
#      strncmp() is designed for comparing strings rather than binary data,
#      characters that appear after a `\0' character are not compared.

# RETURN VALUES
#      The strcmp() and strncmp() functions return an integer greater than,
#      equal to, or less than 0, according as the string s1 is greater than,
#      equal to, or less than the string s2.  The comparison is done using
#      unsigned characters,

.data
	msg1: .asciiz "Enter string1: "
	msg2: .asciiz "Enter string2: "

	str1: .space 32
	str2: .space 32
.text
main: nop # My Entry Point 

	###  request user input  ###
	#	input 1 
	li		$v0 , 4 
	la		$a0 , msg1
	syscall 
	li		$v0, 8 
	la		$a0, str1
	la		$a1, 32 
	syscall
	
	li		$v0, 4
	la 		$a0, msg2 
	syscall
	li		$v0, 8
	la		$a0, str2
	la		$a1, 32
	syscall 
	
	
	addi	$sp, $sp, -4			
	sw		$ra, ($sp)
	la		$a0, str1			# $a0 = str1
	la		$a1, str2			# $a0 = str1
	jal 	strcmp
	lw		$ra , ($sp)
	addi	$sp, $sp, 4			
	
	li		$v0,	1
	syscall
	
	jr		$ra
	

# compare to string in $a0 , $a1
strcmp: 

	lbu		$t0, 0($a0)			# load first byte of $a0 to $t0
	lbu		$t1, 0($a1)			# load first byte of $a0 to $t0
	
	bne		$t0, $t1, done		# if $t0 != $t1 then done
	beq		$t0, $zero, done	# if $t0 == $0 then done
	
	# increase $a0, $a1, to load the next byte to compare
	add		$a0, $a0 , 1 
	add		$a1, $a1 , 1 
	
	j		strcmp

# the comperasion has completed
done:
	# substract the value of $t0 , $t1 and return it 

	sub		$t2, $t1, $t0			# $t2 = $t1 - $t0
	move 	$a0, $t2				# $a0 = $31
	jr		$ra