        .text
__start:
        # Proper overflow test for ADD
        lui  $t0, 0x7FFF          # t0 = 0x7FFF0000
        ori  $t0, $t0, 0xFFFF     # t0 = 0x7FFFFFFF (2,147,483,647)

        addiu $t1, $zero, 1       # t1 = 1

        add   $t2, $t0, $t1       # t2 = 0x80000000

        addiu $v0, $zero, 10
        syscall

