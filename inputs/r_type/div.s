.text
__start:
    # Setup values
    lui   $t0, 0x0000
    ori   $t0, $t0, 0x0014          # $t0 = 20

    lui   $t1, 0xFFFF
    ori   $t1, $t1, 0xFFFB          # $t1 = -5 (0xFFFFFFFB)

    div   $t0, $t1                  # 20 / (-5)

    addiu $v0, $zero, 10
    syscall

