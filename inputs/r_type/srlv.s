        .text
__start:
        # SRLV test cases

        addiu $t0, $zero, 0x10        # $t0 = 0x00000010 (16)
        addiu $t1, $zero, 1           # $t1 = 1 (shift amount)

        srlv $t2, $t0, $t1            # $t2 = 16 >> 1 = 8

        lui   $t3, 0x8000             # $t3 = 0x80000000
        addiu $t4, $zero, 31           # $t4 = 31 (shift amount)

        srlv $t5, $t3, $t4            # $t5 = 0x80000000 >> 31 = 1

        # Exit syscall
        addiu $v0, $zero, 10
        syscall

