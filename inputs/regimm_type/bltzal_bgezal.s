        .text
__start:
        addiu $t0, $zero, -5    # t0 = -5
        addiu $t1, $zero, 0     # t1 = 0
        addiu $t2, $zero, 5     # t2 = 5

        bltzal $t0, label_bltzal  # should branch and save $ra

        bltzal $t0, after_bltzal # returns after jr    

label_bltzal:
        jr $ra                  # jump back to PC+4 stored by BLTZAL
        addiu $t3, $zero, 3   # (would be skipped by jump)

after_bltzal:
        bgezal $t2, label_bgezal # should branch and save $ra

        bgezal $t1, after_bgezal   # returns after jr   

label_bgezal:
        jr $ra                  # jump back to PC+4 stored by BGEZAL
        addiu $t4, $zero, 4    # (would be skipped by jump)

after_bgezal:
        addiu $t5, $zero, 5    # finally execute something

        addiu $v0, $zero, 10
        syscall

