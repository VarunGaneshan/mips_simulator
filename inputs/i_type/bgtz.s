        .text
__start:
        addiu $t0, $zero, 5        # t0 = 5 (positive)
        addiu $t1, $zero, -3       # t1 = -3 (negative)
        addiu $t2, $zero, 0        # t2 = 0

        bgtz $t0, label_pos        # branch taken (5 > 0)

        addiu $t3, $zero, 1     # skipped if branch taken

label_pos:
        bgtz $t1, label_neg        # not taken (-3 not > 0)

        addiu $t4, $zero, 2      # executed normally

label_neg:
        bgtz $t2, label_zero       # not taken (0 not > 0)

        addiu $t5, $zero, 3      # executed normally

label_zero:
        addiu $t6, $zero, 4

        addiu $v0, $zero, 10
        syscall

