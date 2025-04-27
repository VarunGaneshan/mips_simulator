.text
__start:
    lui   $t0, 0x1001             # $t0 = 0x10010000 base address
    ori   $t0, $t0, 0x0000       

    lui   $t1, 0xF234            
    ori   $t1, $t1, 0x5678        # $t1 = 0xF2345678

    sw    $t1, 0($t0)             # store word 0x12345678 at address 0x10010000

    lh    $t2, 0($t0)             # Load lower halfword (0x00005678) → $t2
    lh    $t3, 2($t0)             # Load upper halfword (0xFFFFF234) → $t3

    addiu $v0, $zero, 10
    syscall

