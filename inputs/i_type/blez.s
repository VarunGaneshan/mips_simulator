        .text
__start:
        addiu $t0, $zero, -5       # t0 = -5 (negative)
        addiu $t1, $zero, 0        # t1 = 0
        addiu $t2, $zero, 3        # t2 = 3 (positive)

        blez $t0, label_neg        # branch taken (t0 = -5 <= 0)

        addiu $t3, $zero, 3      # skipped if branch taken

label_neg:
        blez $t1, label_zero       # branch taken (t1 = 0 <= 0)

        addiu $t4, $zero, 4      # skipped if branch taken

label_zero:
        blez $t2, label_pos        # not taken (t2 = 3 > 0)

        addiu $t5, $zero, 5      # executed normally

label_pos:
        addiu $t6, $zero, 6

        addiu $v0, $zero, 10
        syscall

