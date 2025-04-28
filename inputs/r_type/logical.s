        .text
__start:
        # Logical R-type tests
	ori  $t0, $t0, 0x000a      # $t0 = 0x0000F0F0
	ori  $t1, $t1, 0x0005       # $t1 = 0x00000F0F

        and $t2, $t0, $t1           # $t2 = 0xF0F0 & 0x0F0F = 0x00000000
        or  $t3, $t0, $t1           # $t3 = 0xF0F0 | 0x0F0F = 0x0000FFFF
        xor $t4, $t0, $t1           # $t4 = 0xF0F0 ^ 0x0F0F = 0x0000FFFF
        nor $t5, $t0, $t1           # $t5 = ~(0xF0F0 | 0x0F0F) = 0xFFFF0000

        # Exit syscall
        addiu $v0, $zero, 10
        syscall

