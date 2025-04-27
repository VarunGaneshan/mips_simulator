.text
__start:
    lui   $t0, 0x1001             # $t0 = 0x10010000
    ori   $t0, $t0, 0x0000        

    lui   $t1, 0x1234             
    ori   $t1, $t1, 0x5678        # $t1 = 0x12345678
    sw    $t1, 0($t0)             # Memory[0x10010000] = 0x12345678

    lui   $t2, 0x0000
    ori   $t2, $t2, 0xABCD        # $t2 = 0xABCD
    sh    $t2, 0($t0)             # Store 0xABCD in lower half

    lhu    $t4, 0($t0)        # Load lower 16 bits (should be 0xABCD)
    lhu    $t5, 2($t0)        # Load upper 16 bits (should still be 0x1234 from original word)

    lui   $t3, 0x0000
    ori   $t3, $t3, 0xDCBA
    sh    $t3, 2($t0)             # Store 0xDCBA in upper half

    lw    $t6,0($t0)
    #lhu    $t6, 0($t0)        # Load lower 16 bits (should still be 0xABCD)
    #lhu    $t7, 2($t0)        # Load upper 16 bits (should now be 0xDCBA)

    addiu $v0, $zero, 10
    syscall

