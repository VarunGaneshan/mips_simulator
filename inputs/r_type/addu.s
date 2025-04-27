        .text
__start:
        # ADDU test cases
        addiu $t0, $zero, 100       # $t0 = 100
        addiu $t1, $zero, 200       # $t1 = 200

        addu  $t2, $t0, $t1         # $t2 = 100 + 200 = 300

        addiu $t3, $zero, -1        # $t3 = 0xFFFFFFFF
        addiu $t4, $zero, 2         # $t4 = 2

        addu  $t5, $t3, $t4         # $t5 = 0xFFFFFFFF + 2 = 1 (wrap-around)

        # Exit syscall
        addiu $v0, $zero, 10
        syscall

