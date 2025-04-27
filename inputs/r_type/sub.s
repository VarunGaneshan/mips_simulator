        .text
__start:
        # SUB test cases
        addiu $t0, $zero, 500       # $t0 = 500
        addiu $t1, $zero, 200       # $t1 = 200

        sub  $t2, $t0, $t1          # $t2 = 500 - 200 = 300

        addiu $t3, $zero, 50        # $t3 = 50
        addiu $t4, $zero, 100       # $t4 = 100

        sub  $t5, $t3, $t4          # $t5 = 50 - 100 = -50

        # Exit syscall
        addiu $v0, $zero, 10
        syscall

