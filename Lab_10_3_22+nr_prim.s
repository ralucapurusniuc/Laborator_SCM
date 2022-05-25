.text
.globl main
main:
geti $t0      				#n<-t0
li $t1,2				#t1<-posibile nr prime
puti $t1				#afisez 2
putc 32					#punem spatiu
addi $t0,$t0,-1				#decrementam n
next_nr:addi $t1,$t1,1			#urm nr posibil
li $t3, 2					
div $t1,$t3				#catul -> LO
mflo $t2
li $t4, 2 				#t4<- divizorii
next_div:div $t1,$t4			#restul -> HI
mfhi $t5				#restul -> t5
beqz $t5,next_nr
addi $t4,$t4,1				#next divizor
blt $t4,$t2,next_div
puti $t1				#nr e prim -> afisam
putc 32					#punem spatiu
addi $t0,$t0,-1
bgtz $t0,next_nr 			#if(n>0)->go to next_nr
done
