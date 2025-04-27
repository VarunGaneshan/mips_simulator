        .text
__start:
        # LUI test cases
        lui $t0, 0x1234            # $t0 = 0x12340000
        lui $t1, 0xFFFF            # $t1 = 0xFFFF0000
        lui $t2, 0x0000            # $t2 = 0x00000000
        lui $t3, 0xABCD            # $t3 = 0xABCD0000

        # Exit syscall
        addiu $v0, $zero, 10
        syscall

