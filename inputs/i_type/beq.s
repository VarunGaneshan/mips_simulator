        .text
__start:
        addiu $t0, $zero, 5
        addiu $t1, $zero, 5
        addiu $t2, $zero, 5

start_loop:
        beq $t0, $t1, branch_forward  # branch forward if t0==t1
back:
        addiu $t3, $zero, 1   # skipped if branch taken

	beq $t0,$t0,end_loop

branch_forward:
        addiu $t4, $zero, 2

        beq $t0, $t2, back # branch BACK to start_loop (negative branch)

        addiu $t5, $zero, 3    # skipped if branch taken back

end_loop:
        addiu $t6, $zero, 4

        addiu $v0, $zero, 10
        syscall

