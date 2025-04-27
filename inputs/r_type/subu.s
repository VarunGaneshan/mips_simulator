        .text
__start:
        # SUBU test cases
        addiu $t0, $zero, 300       # $t0 = 300
        addiu $t1, $zero, 100       # $t1 = 100

        subu  $t2, $t0, $t1         # $t2 = 300 - 100 = 200

        addiu $t3, $zero, 50        # $t3 = 50
        addiu $t4, $zero, 100       # $t4 = 100

        subu  $t5, $t3, $t4         # $t5 = 50 - 100 0xFFFFFFCE

        # Exit syscall
        addiu $v0, $zero, 10
        syscall

