        .text
__start:
        # ORI test cases
        lui   $t0, 0x0000
        ori   $t0, $t0, 0x0F0F      # $t0 = 0x00000F0F

        ori   $t1, $t0, 0xF0F0      # $t1 = 0x0F0F | 0xF0F0 = 0x0000FFFF

        lui   $t2, 0x0000
        ori   $t2, $t2, 0x1234      # $t2 = 0x00001234

        ori   $t3, $t2, 0x00F0      # $t3 = 0x1234 | 0x00F0 = 0x000012F4

        # Exit syscall
        addiu $v0, $zero, 10
        syscall

