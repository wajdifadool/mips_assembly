# Working with stack 
# push the power of 2 into stack 
# pop and print the whole stack 
# Rememeber: Stacks are based on the LIFO principle, 
#i.e., the element inserted at the last, 
#is the first element to come out of the list. 

sys_print_int = 1 # $a0 = integer to be printed 
sys_print_string = 4 # $a0 = address of string in memory
sys_read_int = 5 # Integer returned in $v0
sys_read_string = 8 # $a0, $a1 = address, size of string input buffer 
sys_exit = 10 
sys_print_char = 11 # $a0 = character to be printed sys_read_char = 12 # Char returned in $v0

.data
    new_line: .asciiz "\n"
    
.text
main: nop # $$$$ MAIN ENtry POINT
    li      $s0 , 8 
    li      $t0 , 1             # Number to push
    li      $t1 , 0             # count up till 8 
    
# do the callculation with left logical shifiting!
# then push to the stack    
push:
    sll		$t0, $t0,    1			# $t0 = $t0 << 1
    addi    $t1, $t1,    1       # $t1 = $t1 + 1 
    addi    $sp, $sp,   -4 
    sw      $t0, 0($sp) 
        
    bne		$t1, $s0,push     # if $t1 != $s0 then powers
#pop the last 8 elements from the stack     
pop:
    lw		$a0, ($sp)
    li      $v0 , sys_print_int
    syscall
    li      $v0 , sys_print_string
    la      $a0 , new_line
    syscall
    addi    $sp, $sp,   4 
    addi    $t1 , $t1 , -1 
    bne     $t1 , $zero , pop 
    
    jr      $ra
    

  
    
