        .text
__start:
        # SRAV test cases

        addiu $t0, $zero, 0x10        # $t0 = 16
        addiu $t1, $zero, 1           # $t1 = 1 (shift amount)

        srav  $t2, $t0, $t1           # $t2 = 16 >> 1 = 8

        addiu $t3, $zero, -8          # $t3 = -8 (0xFFFFFFF8)
        addiu $t4, $zero, 1           # $t4 = 1

        srav  $t5, $t3, $t4           # $t5 = -4 (preserve sign)

        addiu $t6, $zero, -1          # $t6 = -1 (0xFFFFFFFF)
        addiu $t7, $zero, 31          # $t7 = 31

        srav  $s0, $t6, $t7           # $s0 = -1 (all 1's after 31 shift)

        # Exit syscall
        addiu $v0, $zero, 10
        syscall

