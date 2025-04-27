        .text
__start:
        # SRL test cases

        addiu $t0, $zero, 0x10       # $t0 = 0x00000010
        srl   $t1, $t0, 1            # $t1 = 0x00000008

        lui   $t2, 0x8000            # $t2 = 0x80000000
        srl   $t3, $t2, 31           # $t3 = 1 (MSB shifted to LSB)

        ori   $t4, $zero, 0xFF00     #t4 = 0xFF00
        srl   $t5, $t4, 8            # $t5 = 0x000000FF

        # Exit syscall
        addiu $v0, $zero, 10
        syscall

