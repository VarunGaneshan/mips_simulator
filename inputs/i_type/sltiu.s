        .text
__start:
        # SLTIU test cases
        addiu $t0, $zero, 5          # $t0 = 5
        sltiu $t1, $t0, 10           # 5 < 10 → $t1 = 1
        sltiu $t2, $t0, 5            # 5 < 5 → $t2 = 0
        sltiu $t3, $t0, 3            # 5 < 3 → $t3 = 0

        addiu $t4, $zero, -1          # $t4 = 0xFFFFFFFF (big unsigned number)
        sltiu $t5, $t4, 0             # 0xFFFFFFFF < 0 → 0 (false)

        addiu $t6, $zero, 0           # $t6 = 0
        sltiu $t7, $t6, 1             # 0 < 1 → 1 (true)

        # Exit syscall
        addiu $v0, $zero, 10          # syscall exit
        syscall

