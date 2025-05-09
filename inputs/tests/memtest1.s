        # Basic half word/full word
	.text
main:
        #;;  Set a base address
        lui    $3, 0x1000

        lui    $5, 0x0000
        ori    $5, $5, 0xcafe

        lui    $6, 0x0000
        ori    $6, $6, 0xfeca

        lui    $7, 0x0000
        ori    $7, $7, 0xbeef

        lui    $8, 0x0000
        ori    $8, $8, 0xefbe
                
        #;; Place a test pattern in memory
        sb     $5, 0($3)
        sb     $6, 1($3)
        sb     $7, 6($3)
        sb     $8, 7($3)

        lbu    $9,  0($3)
        lbu    $10, 1($3)
        lb     $11, 6($3)
        lb     $12, 7($3)

        addiu  $3, $3, 4
        sh     $5, 0($3)
        sh     $6, 2($3)
        sh     $7, 4($3)
        sh     $8, 6($3)

        lhu    $13,  0($3)
        lhu    $14,  2($3)
        lh     $15,  4($3)
        lh     $16,  6($3)
               
        #;; Calculate a "checksum" for easy comparison
        add    $17, $zero, $9
        add    $17, $17, $10
        add    $17, $17, $11
        add    $17, $17, $12
        add    $17, $17, $13
        add    $17, $17, $14
        add    $17, $17, $15
        add    $17, $17, $16
        
        #;;  Quit out 
        addiu $v0, $zero, 0xa
        syscall

