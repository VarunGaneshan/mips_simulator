        .text
__start:
        addiu $t0, $zero, 5         # $t0 = 5
        slti $t1, $t0, 10           # $t1 = 1 → 5 < 10
        slti $t2, $t0, 5            # $t2 = 0 → 5 < 5 is false
        slti $t3, $t0, -1           # $t3 = 0 → 5 < -1 is false
        addiu $t4, $zero, -20       # $t4 = -20
        slti $t5, $t4, -10          # $t5 = 1 → -20 < -10 is true
        slti $t6, $t4, -30          # $t6 = 0 → -20 < -30 is false

        # Exit syscall
        addiu $v0, $zero, 10
        syscall

