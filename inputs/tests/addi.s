        .text
__start:addi $t0, $zero, 10      # $t0 = 10
        addi $t1, $t0, -5        # $t1 = 10 - 5 = 5
	addi $t2, $t1, 0         # $t2 = 5 + 0 = 5
        #sltiu $t2, $t1, 0      
        addi $t3, $zero, -32768  # $t3 = -32768 (min 16-bit signed)
        addi $t4, $t3, 32767     # $t4 = -1 (edge case)
        addi $zero, $t0, 123 #Should NOT change $zero
        addi $v0, $zero, 10      # Exit syscall
        syscall

