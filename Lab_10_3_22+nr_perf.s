.data
d0:
.asciiz "Introduceti nr:"
d1:
.asciiz "E perfect"
d2:  
.asciiz "Nu e perfect "

.text
main:
puts d0
    geti $t0

li $t1,2 #divizor si impartitor
li $t5,1 #suma
div $t0,$t1
mflo $t4

et:
    bgt $t1,$t4,sfarsit
div $t0,$t1
mfhi $t3
beqz $t3,suma
add $t1,$t1,1
j et

suma:
add $t5,$t5,$t1
add $t1,$t1,1
j et

sfarsit:
beq $t5,$t0,afis_msg
puts d2
j end

afis_msg:
puts d1

end:
    done
