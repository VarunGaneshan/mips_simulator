        .text
__start:

        # Load the jump target address into $s0
        la $s0, target_label1   # $s0 = address of target_label #takes 2 cycles as lui+ori

        # Case 1: JALR without rd (rd omitted)
        jalr $s0               # Should save PC+4 into $ra ($31) = 0c

        addiu $t0, $zero, 111  # Should NOT execute (we jump before) #0c

target_label1:
        addiu $t1, $zero, 222   # Should execute after jumping

        # Case 2: JALR with explicit rd
        la $s1, target_label2    # $s1 = address of label2
        jalr $s2, $s1           # Save PC+4 into $s2 and jump to label2

        addiu $t2, $zero, 333   # Should NOT execute (skipped by jump)

target_label2:
        addiu $t3, $zero, 444   # Should execute after jumping #24

        addiu $v0, $zero, 10    # syscall exit
        syscall

