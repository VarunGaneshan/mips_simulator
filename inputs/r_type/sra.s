        .text
__start:
        # SRA test cases

        addiu $t0, $zero, 0x10       # $t0 = 16
        sra   $t1, $t0, 1            # $t1 = 8 (positive, normal shift)

        addiu $t2, $zero, -8         # $t2 = -8 (0xFFFFFFF8)
        sra   $t3, $t2, 1            # $t3 = -4 (should replicate 1s)

        addiu $t4, $zero, -1          # $t4 = -1 (0xFFFFFFFF)
        sra   $t5, $t4, 31            # $t5 = -1 (all 1's stay)

        # Exit syscall
        addiu $v0, $zero, 10
        syscall

