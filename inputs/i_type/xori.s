        .text
__start:
        # XORI test cases
        lui   $t0, 0x0000
        ori   $t0, $t0, 0xAAAA      # $t0 = 0x0000AAAA

        xori  $t1, $t0, 0x5555      # $t1 = 0xAAAA ^ 0x5555 = 0xFFFF

        lui   $t2, 0x0000
        ori   $t2, $t2, 0x1234      # $t2 = 0x00001234

        xori  $t3, $t2, 0x00F0      # $t3 = 0x1234 ^ 0x00F0 = 0x12C4

        # Exit syscall
        addiu $v0, $zero, 10
        syscall

