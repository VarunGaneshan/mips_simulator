.text
__start:
    # Setup values
    lui   $t0, 0x0001
    ori   $t0, $t0, 0x0000          # $t0 = 0x00010000 (65536)

    lui   $t1, 0x0002
    ori   $t1, $t1, 0x0000          # $t1 = 0x00020000 (131072)

    multu $t0, $t1                  # Unsigned multiply  0x200000000

    addiu $v0, $zero, 10
    syscall

