        .text
__start:
        # ADDI test cases
        addi $t0, $zero, 10        # $t0 = 10
        addi $t1, $t0, -5          # $t1 = 10 - 5 = 5
        addi $t2, $t1, 0           # $t2 = 5 + 0 = 5
        addi $t3, $zero, -32768    # $t3 = -32768 (min 16-bit)
        addi $t4, $t3, 32767       # $t4 = -1
        addi $zero, $t0, 123       # writing to $zero — ignored

        # ADDIU test cases
        addiu $t5, $zero, 20       # $t5 = 20
        addiu $t6, $t5, -10        # $t6 = 10
        addiu $t7, $t6, 0          # $t7 = 10
        addiu $s0, $zero, -32768   # $s0 = -32768
        addiu $s1, $s0, 32767      # $s1 = -1
        addiu $zero, $s1, 555      # writing to $zero — ignored

        # Exit syscall
        addiu $v0, $zero, 10       # syscall code for exit
        syscall

