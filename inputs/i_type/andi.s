        .text
__start:
        # ANDI test cases
        lui   $t0, 0x0000
        ori   $t0, $t0, 0xF0F0      # $t0 = 0x0000F0F0

        andi  $t1, $t0, 0x0F0F      # $t1 = 0xF0F0 & 0x0F0F = 0x00000000

        lui   $t2, 0x0000
        ori   $t2, $t2, 0xFFFF      # $t2 = 0x0000FFFF

        andi  $t3, $t2, 0x00FF      # $t3 = 0xFFFF & 0x00FF = 0x000000FF

        addiu $t4, $zero, 0x1234    # $t4 = 0x00001234
        andi  $t5, $t4, 0x00F0      # $t5 = 0x1234 & 0x00F0 = 0x00000030

        # Exit syscall
        addiu $v0, $zero, 10
        syscall

