        .text
__start:
        # JUMP test

        j target_label      # jump to label
        addiu $t0, $zero, 1    # this instruction is skipped

target_label:
        addiu $t0, $zero, 2  # this will execute after jump

        addiu $v0, $zero, 10   # syscall exit
        syscall

