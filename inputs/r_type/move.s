.text
__start:
    lui   $t0, 0x1234
    ori   $t0, $t0, 0x5678         # $t0 = 0x12345678

    lui   $t1, 0x9ABC
    ori   $t1, $t1, 0xDEF0         # $t1 = 0x9ABCDEF0

    mthi  $t0                      # HI = $t0
    mtlo  $t1                      # LO = $t1

    mfhi  $t2                      # $t2 = HI
    mflo  $t3                      # $t3 = LO

    addiu $v0, $zero, 10
    syscall

