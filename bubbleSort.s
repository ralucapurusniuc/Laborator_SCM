#Bubble sort
#for(i=0; i<n; i++)
# 	for(j=0; j<n-i-1; j++ )
#		if(a[j], a[j+1])
#			swap
.data
afisare_n:
	.asciiz "n= "
citire_nr:
	.asciiz "Introduceti numerele: "
afisare_vector_sortat:
	.asciiz "Vectorul sortat este: "
	.align 4
n:
	.space 4
tablou:
	.space 100

	.text

	li $v0, 4
	la $a0, afisare_n
	syscall
	li $v0, 5    #read integer
	syscall
	
	move $a1, $v0		#a1<-ct. nr.
	la $t8, n			#memorare n
	sw $a1, ($t8)

	li $v0,4
	la $a0, citire_nr
	syscall
	la $t8, tablou          #$t8<-adresa tabloului de numere
	move $t1,$a1			#$t1<-ct. nr
citeste:
	li $v0, 5
	syscall
	sw $v0, ($t8)
	addi $t8, $t8, 4
	addi $t1, $t1, -1
	bgtz $t1, citeste

	jal bubbleSort
	li $v0, 4
	la $a0, afisare_vector_sortat
	syscall
	la $t8, tablou		#$t0<-adresa tabloului 
repeta:
	lw $a0, ($t8)		#afisare tablou[i]
	li $v0, 1
	syscall 
	putc ' '
	addi $t8, $t8, 4
	addi $a1, $a1, -1
	bgtz $a1, repeta

	done
	

bubbleSort:
	li $t0, 0			#t0<- 0 (i<-0)
	move $t7, $a1		#t7<- n
	addi $t7,$t7, -1 	#t7<- n-1
for1:
	li $t1, 0
	addi $t1,$t1, -1 	#t1<- -1 (j care incepe de la -1)
	move $t6, $t7 
	addi $t6, $t6, -1 	#t6<- n-i-1
	la $t8, tablou		#t8<-adr tablou
	
for2:
	addi $t1, $t1, 1 	#incepem cu j=0, j++
	lw $t2, ($t8)		#t2<- tablou[j]
	lw $t3, 4($t8)		#t3<- tablou[j+1]
	blt $t2,$t3, continua
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
	jr $ra 
	