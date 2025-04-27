        .text
__start:
        addiu $t0, $zero, -5      # t0 = -5 (negative)
        addiu $t1, $zero, 0       # t1 = 0
        addiu $t2, $zero, 5       # t2 = 5 (positive)

        bltz $t0, label_neg       # branch taken (-5 < 0)

        addiu $t3, $zero, 3     # skipped if branch taken

label_neg:
        bgez $t1, label_zero      # branch taken (0 >= 0)

        addiu $t4, $zero, 4     # skipped if branch taken

label_zero:
        bgez $t2, label_pos       # branch taken (5 >= 0)

        addiu $t5, $zero, 5     # skipped if branch taken

label_pos:
        addiu $t6, $zero, 6

        addiu $v0, $zero, 10
        syscall

