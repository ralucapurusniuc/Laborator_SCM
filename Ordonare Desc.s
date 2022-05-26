#Sa se citeasca un numar natural n si sa se afiseze 
#cifrele sale ordonate descrescator.
.data
afisare_n:
	.asciiz "n= "
afisare_vector_sortat:
	.asciiz "Cifrele ordonate descrescator: "
	.align 4
tablou:
	.space 100
	
.text

	li $v0, 4
	la $a0, afisare_n
	syscall
	li $v0, 5    #read integer
	syscall
	move $t0, $v0
	la $t8, tablou # adresa tabloului
	li $t4, 10
	li $t9, 0 #contor cifre
loop:
	div $t0, $t4 #n/10
	mfhi $t7 #restul
	mflo $t0 #catul
    sw $t7, ($t8) #memoram o cifra in tablou
	addi $t9, $t9, 1 #ct++
	addi $t8,$t8, 4
	bnez $t0, loop
	
ordonare:
	li $t0, 0			#t0<- 0 (i<-0)
	move $t7, $t9		#t7<- ct
	addi $t7,$t7, -1 	#t7<- ct-1
for1:
	li $t1, 0
	addi $t1,$t1, -1 	#t1<- -1 (j care incepe de la -1)
	move $t6, $t7 
	addi $t6, $t6, -1 	#t6<- ct-i-1
	la $t8, tablou		#t8<-adr tablou
	
for2:
	addi $t1, $t1, 1 	#incepem cu j=0, j++
	lw $t2, ($t8)		#t2<- tablou[j]
	lw $t3, 4($t8)		#t3<- tablou[j+1]
	bgt $t2,$t3, continua
	move $t4, $t2		#aux<-tablou[j]
	move $t2,$t3		#tablou[j]<-tablou[j+1]
	move $t3, $t4		#tablou[j+1]<-aux
	sw $t2, ($t8)		#t2<- tablou[j]
	sw $t3, 4($t8)	
continua:
	addi $t8,$t8, 4
	blt $t1, $t6, for2 	#compara j cu n-i-1
	addi $t0,$t0,1 		#i++
	blt $t0, $t7, for1	#compara i cu n-1
	li $v0, 4
	la $a0, afisare_vector_sortat
	syscall
	la $t8, tablou	#$t0<-adresa tabloului 
afisare:
		
lw $a0, ($t8)		#afisare tablou[i]
	li $v0, 1
	syscall 
	putc ' '
	addi $t8, $t8, 4
	addi $t9, $t9, -1
	bgtz $t9, afisare
	done
	