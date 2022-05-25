.data
d0: .asciiz "n= "
d1: .asciiz "k= "
d2: .asciiz "Combinari: "
d3: .asciiz "   Aranjamente: "

.text
main:
    puts d0
geti $t2 # n
puts d1
geti $t3 # k
blt $t2,$t3,end


move $a0,$t2
jal fact #n!
move $t4,$s0
move $a0,$t3
jal fact #k!
move $t5,$s0
sub $t2,$t2,$t3
move $a0,$t2
jal fact #(n-k)!
move $t6,$s0

mul $t7,$t6,$t5
div $t7,$t4,$t7
puts d2
puti $t7
div $t7,$t4,$t5
puts d3
puti $t7
j end

fact:
move $t0,$a0
li $t1,1 #produs factorial
et:
    beqz $t0,sf
mul $t1,$t1,$t0
add $t0,$t0,-1
j et

sf:
move $s0,$t1
jr $ra

end:
    done
