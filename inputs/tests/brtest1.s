        # Advanced branch test
	.text

        # J, JR, JAL, JALR, BEQ, BNE, BLEZ, BGTZ, BLTZ, BGEZ, BLTZAL, BGEZAL
        # BLTZAL, BGEZAL
main:
        addiu $v0, $zero, 0xa

        # Set up some comparison values in registers
        addiu $3, $zero, 1
        addiu $4, $zero, -1

        # Checksum register
        addiu $5, $zero, 0x1234

        # Test jump
        j l_1
l_0:
        addu $5, $5, $ra
        beq   $zero, $zero, l_2
l_1:
        addiu $5, $5, 7
        jal l_0
        j l_8
l_2:    
        addiu $5, $5, 9
        bne $3, $4, l_4
l_3:
        # Taken
        addiu $5, $5, 5
        bgez $zero, l_6
l_4:
        # Not taken #Taken
        addiu $5, $5, 11
        blez  $3, l_3
l_5:
        # Taken
        addiu $5, $5, 99
        bgtz  $3, l_3
l_6:
        # here
        addiu $5, $5, 111
        jr $ra
        # Should go to l_1, then go to l_8
l_7:
        # Should not get here
        addiu $5, $5, 200
        
        syscall
l_8:    
        addiu $5, $5, 215
        jal l_10
l_9:
        # Should not get here
        addiu $5, $5, 1
        syscall        
l_10:    
        addu $5, $5, $6
        bltzal $4, l_12
l_11:
        # Should not get here
        addiu $5, $5, 400
        syscall
l_12:    
        addu $5, $5, $6
        bgezal $4, l_11
        
l_13:   
        lui $6, 0xbeb0         #addiu $5, $5, 0xbeb0063d
	ori $6, $6, 0x063d     
	addu $5, $5, $6        # add large constant

        syscall
        
        
