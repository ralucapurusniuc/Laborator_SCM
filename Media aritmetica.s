#Calculeaza media aritmetica a n nr citite de la tastatura
	.data
afisare_n:
	.asciiz "n = "
citire_nr:
	.asciiz "Introduceti numerele: "
msg_afisare_medie:
	.asciiz "Media aritmetica (cat, rest) = "
n:
	.space 4
numere:
	.space 100
	.text
	.globl main
main:

	li $v0, 4
	la $a0, afisare_n
	syscall
	li $v0, 5    #read integer
	syscall
	move $t0, $v0 #$t0<-n
    move $t1, $v0 # t1<-contor de numerele
	li $v0,4
	la $a0, citire_nr
	syscall
	
	li $t2, 0		#t2<-suma
	la $t8, numere		#t1<-adresa unde se vor memora
citeste:
	li $v0, 5
	syscall
	sw $v0, ($t8)
	add $t2, $t2, $v0 #facem suma
	addi $t8, $t8, 4
	addi $t1, $t1, -1
	bnez $t1, citeste # cat timp mai am de citit

	div $t2, $t0
	mfhi $t5
	mflo $t6
	puts msg_afisare_medie
	puti $t6
	putc ','
	puti $t5


sfarsit:
	done
