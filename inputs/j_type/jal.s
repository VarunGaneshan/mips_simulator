        .text
__start:
        jal target_label    # jump and link
        addiu $t0, $zero, 1    # $ra = 400004

target_label:
        addiu $t0, $zero, 2  # normal code after jump

        addiu $v0, $zero, 10
        syscall

