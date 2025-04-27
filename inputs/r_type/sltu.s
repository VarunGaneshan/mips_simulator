        .text
__start:
        # SLTU test cases

        addiu $t0, $zero, 10        # $t0 = 10
        addiu $t1, $zero, 20        # $t1 = 20

        sltu $t2, $t0, $t1          # $t2 = (10 < 20) = 1
        sltu $t3, $t1, $t0          # $t3 = (20 < 10) = 0

        addiu $t4, $zero, -5        # $t4 = 0xFFFFFFFB (big unsigned number)
        addiu $t5, $zero, 5         # $t5 = 5

        sltu $t6, $t4, $t5          # $t6 = (0xFFFFFFFB < 5) = 0
        sltu $t7, $t5, $t4          # $t7 = (5 < 0xFFFFFFFB) = 1

        # Exit syscall
        addiu $v0, $zero, 10
        syscall

