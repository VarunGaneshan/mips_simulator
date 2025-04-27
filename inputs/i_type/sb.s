.text
__start:
    lui   $t0, 0x1001             
    ori   $t0, $t0, 0x0000        

    # Store initial word 0x12345678
    lui   $t1, 0x1234             
    ori   $t1, $t1, 0x5678        
    sw    $t1, 0($t0)             

    # First SB: store 0xAB into Byte[0]
    lui   $t2, 0x0000
    ori   $t2, $t2, 0x00AB
    sb    $t2, 0($t0)

    # Verify immediately
    lw    $t4, 0($t0)     

    # Second SB: store 0xCD into Byte[1]
    lui   $t3, 0x0000
    ori   $t3, $t3, 0x00CD
    sb    $t3, 1($t0)

    # Verify again
    lw    $t5, 0($t0)  

    # Third SB: store 0xEF into Byte[3]
    lui   $t6, 0x0000
    ori   $t6, $t3, 0x00EF
    sb    $t6, 3($t0)
	
    # Verify again
    lw    $t7, 0($t0) 

    # Exit
    addiu $v0, $zero, 10
    syscall

