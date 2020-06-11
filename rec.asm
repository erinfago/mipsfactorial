	.data
	.text

main:
	addi $a0, $zero, 6 #n = 6
	jal fact

	move $a0, $v0
	li $v0, 1
	syscall
	li $v0, 10
	syscall

fact:
	addi $sp, $sp, -8 # adjust stack for 2 items
	sw $ra, 4($sp) # save return address
	sw $a0, 0($sp) # save argument n
	
	slti $t0, $a0, 1 # test for n=1
	beq $t0, $zero, L1 # if n>=1 go to L1

	addi $v0, $zero,1 # return 1
	addi $sp, $sp, 8 # pops 2 items off the stack

	jr $ra # return to caller

L1:	
	addi $a0, $a0,-1 # n>=1 argument gets n-1
	jal fact # call fact with n-1
	
	lw $a0, 0($sp) # return jal : store arg n
	lw $ra, 4($sp) # restore the pointer address
	addi $sp, $sp, 8 # adjust stack pointer

	mul $v0, $a0, $v0 # return  n*fact(n-1)

	jr $ra
