        .text
__start:
        addiu $t0, $zero, 5        # t0 = 5
        addiu $t1, $zero, 6        # t1 = 6

        bne $t0, $t1, label1       # branch should be taken (5 != 6)

        addiu $t2, $zero, 1      # skipped if branch taken

label1:
        addiu $t3, $zero, 2      # should execute after branch

        bne $t0, $t0, label2       # branch not taken (5 == 5)

        addiu $t4, $zero, 3     # should execute normally

label2:
        addiu $t5, $zero, 4     # arrive here if second branch skipped

        addiu $v0, $zero, 10
        syscall

