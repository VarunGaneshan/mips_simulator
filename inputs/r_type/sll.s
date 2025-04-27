        .text
__start:
        # SLL test cases

        addiu $t0, $zero, 5          # $t0 = 5 (0x00000005)
        sll   $t1, $t0, 1            # $t1 = 5 << 1 = 10

        addiu $t2, $zero, 0x0001     # $t2 = 1
        sll   $t3, $t2, 15           # $t3 = 1 << 15 = 0x00008000

        addiu $t4, $zero, 0x0001     # $t4 = 1
        sll   $t5, $t4, 31           # $t5 = 1 << 31 = 0x80000000

        # Exit syscall
        addiu $v0, $zero, 10
        syscall

