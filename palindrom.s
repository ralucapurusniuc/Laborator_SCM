;palindrom 
;12321
;
;
;$t0 - n
;$t1 - c
;$t2 - 10
;$t3 - copie n
;$t4 - nou = 0

.data
mesaj1: .asciiz "introd nr "
mesaj2: .asciiz "e palindrom"
mesaj3: .asciiz "nu e palindrom"

.text

la $a0, mesaj1
li $v0, 4
syscall

geti $t0

li $t2, 10
move $t3, $t0
li $t4, 0

xor $t4, $t4, $t4
loop:

div $t0,$t2
mfhi $t1
mflo $t0

mul $t4,$t4,$t2
add $t4,$t4, $t1

bnez $t0, loop

beq $t3,$t4, et
puts mesaj3
done


et:
puts mesaj2
done