.text
__start:
    lui   $t0, 0x0001
    ori   $t0, $t0, 0x0000          # $t0 = 0x00010000 (65536)

    lui   $t1, 0x0000
    ori   $t1, $t1, 0x0010          # $t1 = 0x00000010 (16)

    divu  $t0, $t1                  # 65536 / 16

    addiu $v0, $zero, 10
    syscall

