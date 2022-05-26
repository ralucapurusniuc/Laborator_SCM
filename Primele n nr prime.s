;DLX
;$r0-31 -> $r1=n,$r2=d,$r3=a,$r4=ct
;$r5=a/2, $r6=a%d
.data
n: .asciiz "n="
prim: .asciiz "nr prime:"
p: .ascizz "%d "
.align2
p1: .word p1
p2: .space 4

.text
addi r1,r0,n
jal InputUnsigned

addi r7,r0,2
addi r3,r0,1

while:

	addi r3,r3,1
	addi r2,r0,2
	addi r4,r0,0
	;.....
	;D=I*C+R
	;R=D-(I*C)
	div r5,r3,r7      ;C
	multu r9,r3,r7    ;I*C
	sub r8,r3,r9	  ;R = D-(I*C)

bnez r1,while

trap 0




