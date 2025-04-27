        .text
__start:
        # Test JR

        jal jump_here          # save return address ($ra = PC + 4)
        addiu $t0, $zero, 1    # after jump_here
	j jump_after_return
jump_here:
        addiu $t1, $zero, 2
        jr $ra                 # jump back to where we came from

jump_after_return:
        addiu $t2, $zero, 3   

        addiu $v0, $zero, 10
        syscall

