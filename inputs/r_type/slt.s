        .text
__start:
        # SLT test cases

        addiu $t0, $zero, 10        # $t0 = 10
        addiu $t1, $zero, 20        # $t1 = 20

        slt  $t2, $t0, $t1          # $t2 = (10 < 20) = 1
        slt  $t3, $t1, $t0          # $t3 = (20 < 10) = 0

        addiu $t4, $zero, -5        # $t4 = -5
        addiu $t5, $zero, 5         # $t5 = 5

        slt  $t6, $t4, $t5          # $t6 = (-5 < 5) = 1
        slt  $t7, $t5, $t4          # $t7 = (5 < -5) = 0

        # Exit syscall
        addiu $v0, $zero, 10
        syscall

