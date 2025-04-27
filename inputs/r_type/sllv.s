        .text
__start:
        # SLLV test cases

        addiu $t0, $zero, 5          # $t0 = 5
        addiu $t1, $zero, 2          # $t1 = 2 (shift amount)

        sllv $t2, $t0, $t1           # $t2 = 5 << 2 = 20

        addiu $t3, $zero, 1          # $t3 = 1
        addiu $t4, $zero, 31         # $t4 = 31 (shift amount)

        sllv $t5, $t3, $t4           # $t5 = 1 << 31 = 0x80000000

        # Exit syscall
        addiu $v0, $zero, 10
        syscall

