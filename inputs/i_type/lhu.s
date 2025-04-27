.text
__start:
    lui   $t0, 0x1001             # $t0 = 0x10010000
    ori   $t0, $t0, 0x0000

    lui   $t1, 0xFFFF             # $t1 = 0xFFFF0000
    ori   $t1, $t1, 0x8001        # $t1 = 0xFFFF8001

    sw    $t1, 0($t0)             # Store 0xFFFF8001 at 0x10010000

    lhu   $t2, 0($t0)             # Load lower halfword (0x8001) → $t2
    lhu   $t3, 2($t0)             # Load upper halfword (0xFFFF) → $t3

    addiu $v0, $zero, 10
    syscall

