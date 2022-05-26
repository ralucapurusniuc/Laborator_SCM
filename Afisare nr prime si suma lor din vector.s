#Sa se citeasca de la tastatura un vector cu n elemente, 
#n introdus de utilizator. Sa se afiseze elementele prime 
#din vector si sa se afiseze suma acestora
.data
afisare_n:
	.asciiz "n= "
suma: 
.asciiz "\t Suma numerelor  prime este: "
citire_nr:
	.asciiz "Introduceti numerele: "
afisare_vector_sortat:
	.asciiz "\tVectorul cu nr prime este: "
	.align 4
n:
	.space 4
tablou:
	.space 100
prime:
	.space 100
.text

	li $v0, 4
	la $a0, afisare_n
	syscall
	li $v0, 5    #read integer
	syscall
	move $t0, $v0 #t0 <-n
	move $t1, $v0 # t1<-contor de numerele
	li $v0,4
	la $a0, citire_nr
	syscall
	la $t8, tablou          #$t8<-adresa tabloului de numere
citeste:
	li $v0, 5
	syscall
	sw $v0, ($t8)
	addi $t8, $t8, 4
	addi $t1, $t1, -1
	bnez $t1, citeste # cat timp mai am de citit
	
	li $t3,2
    li $t6, 2 #t6=d=2
	li $t5, 0 #contor prime
	la $t8, tablou
	addi $t8, $t8, -4
	la $t1, prime
parcurgere_tablou:
	addi $t8, $t8, 4 #incepem de pe pozitia 0
    lw $t4, ($t8)   #punem in t4 ce se gaseste la pozitia 0
	div $t9, $t4, $t3 #n/2
for:div $t4, $t6     #n/d
    mfhi $t7 #$t7 punem restul
	beqz $t7, parcurgere_tablou #se imparte exact deci nu e prim
	bnez prim
	addi $t6, $t6, 1 #d++
	addi $t0, $t0, -1
	ble $t6, $t9, for
prim:
	sw $t4, ($t1) #nr prim il salvam in acel vector 
	addi $t1, $t1, 4
	addi $t0, $t0, -1
	addi $t5, $t5, 1
	bnez $t0, parcurgere_tablou # pana la sf vectorului

    li $t9, 0 #suma
	li $v0, 4
	la $a0, afisare_vector_sortat
	syscall
	la $t8, prime	#$t0<-adresa tabloului 
afisare:
		
	lw $a0, ($t8)		#afisare tablou[i]
	li $v0, 1
	syscall 
	putc ' '
	add $t9, $t9, $v0
	addi $t8, $t8, 4
	addi $t5, $t5, -1
	bnez $t5, afisare
	
	li $v0, 4
	la $a0, suma
	syscall
	puti $t5
	done
	