.text
__start:
    lui   $t0, 0x1001             # $t0 = 0x10010000
    ori   $t0, $t0, 0x0000        # $t0 = 0x10010000

    li    $t1, 0xFFFFFF81         # $t1 = 0xFFFFFF81
    sw    $t1, 0($t0)             # store 0xFFFFFF81 at 0x10010000

    lbu   $t2, 0($t0)             # Load byte 0x81 (lowest byte) → $t2
    lbu   $t3, 1($t0)             # Load byte 0xFF
    lbu   $t4, 2($t0)             # Load byte 0xFF
    lbu   $t5, 3($t0)             # Load byte 0xFF

    addiu $v0, $zero, 10
    syscall

