.text
__start:
    lui   $t0, 0x1001             # $t0 = 0x10010000
    ori   $t0, $t0, 0x0000        # $t0 = 0x10010000

    li    $t1, 0xF234F678         # $t1 = 0xF2345678
    sw    $t1, 0($t0)             # store 0xF2345678 at 0x10010000

    lb    $t2, 0($t0)             # Load byte 0x78 (lower byte)
    lb    $t3, 1($t0)             # Load byte 0xF6 -sign extended
    lb    $t4, 2($t0)             # Load byte 0x34
    lb    $t5, 3($t0)             # Load byte 0xF2 (MSB)-sign extended

    addiu $v0, $zero, 10
    syscall

