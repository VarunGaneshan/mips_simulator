.text
__start:
    # Set up base address
    lui $t0, 0x1001         # $t0 = 0x10010000
    ori $t0, $t0, 0x0000

    # Load immediate values
    addiu $t1, $zero, 1234  # $t1 = 1234
    addiu $t2, $zero, 5678  # $t2 = 5678

    # Now actually STORE them into memory!
    sw $t1, 0($t0)          # store 1234 at 0x10010000
    sw $t2, 4($t0)          # store 5678 at 0x10010004

    # Now load back using lw
    lw $t3, 0($t0)          # Load word at 0x10010000 -> $t3
    lw $t4, 4($t0)          # Load word at 0x10010004 -> $t4

    addiu $v0, $zero, 10
    syscall

