;//cit un nu
;//se constr un alt nr din cifrele pare ale acestiua
;
;n,c,nou=0
;
;while(n!=0)
;{
;	c=n%10;
;	if(c%2==0)
;		nou=nou*10+c;
;	n=n/10;
;}

;$t0 - n
;$t1 - c
;$t2 - nou =0
;$t3 - 10
;$t4 - 2

.data
mesaj1: .asciiz "introdu nr"
mesaj2: .asciiz "noul nr este:"

.text
li $v0,4
la $a0, mesaj1
syscall

li $v0,5
syscall

move $t0,$v0

li $t2,0
li $t3,10
li $t4,2

;xor $t3,$t3,$t3
;addi $t3,$t3,10 

loop:
div $t0, $t3
mfhi $t1 ;c

div $t1, $t4
mfhi $t5

bnez $t5, et

mul $t2,$t2,$t3
add $t2,$t2,$t1

et:
div $t0,$t3
mflo $t0

bnez $t0, loop


li $v0, 4
la $a0, mesaj2
syscall

;li $v0,1
;la $a0,$t2
;syscall

;afis nr intreg
 puti $t2
 done





