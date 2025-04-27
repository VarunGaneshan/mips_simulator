.text
__start:
    # Setup values
    lui   $t0, 0x0000
    ori   $t0, $t0, 0x0004         # $t0 = 4

    lui   $t1, 0xFFFF
    ori   $t1, $t1, 0xFFFE         # $t1 = -2 (0xFFFFFFFE)

    mult  $t0, $t1                 # 4 * (-2) = -8

    # Immediately move results
    mfhi  $t2                      # HI → $t2
    mflo  $t3                      # LO → $t3

    addiu $v0, $zero, 10
    syscall

