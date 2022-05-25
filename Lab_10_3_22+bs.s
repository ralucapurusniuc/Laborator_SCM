#Bubble sort
#for(k = 1; k < n; k++)
# for(i = 0; i < n-1; i++)
# if(a[i] > a[i+1])
# interschimba-le
.data
msg_afisare_n:
.asciiz "Introduceti numarul de elemente n = "
msg_citire_nr:
.asciiz "Introduceti numerele:\n"
msg_numar_individual:
.asciiz "vector["
msg_numar_individual_continuare:
.asciiz "]: "
msg_afisare_vector_sortat:
.asciiz "Vectorul sortat este: "
.align 4 #aliniaza datele urmatoare într-un domeniu de 2^n octeti.
n:
.space 4 #aloca 4 octeti de spatiu în segmentul curent.
#vector:
# .space 100

adresa_vector:
.word 0x10012000

.text
.globl main
main:
li $v0, 4
la $a0, msg_afisare_n
syscall
li $v0, 5
syscall
move $a1, $v0 #a1<-ct. nr.
la $t0, n #memorare n
sw $a1, ($t0)

li $v0, 4
la $a0, msg_citire_nr
syscall
lw $t0, adresa_vector #$t0<-adresa vectorului
move $t1, $a1 #$t1<-cate nr avem, nr de nr
xor $t9, $t9, $t9
#vector[n]:
citeste:
li $v0, 4 #afisam vector[
la $a0, msg_numar_individual
syscall
li $v0, 1 #afisam pozitia vectorului, t9 il initializam cu 0 mai sus
move $a0, $t9
syscall
li $v0, 4 #afisam ]
la $a0, msg_numar_individual_continuare
syscall
li $v0, 5 #citim nr de la tastatura
syscall
sw $v0, ($t0) #il salvam la adresa t0
addi $t0, $t0, 4 #mergem la adresa urmatoare
addi $t1, $t1, -1 #scadem 1 din nr de numere
addi $t9, $t9, 1 #crestem pozitia vectorului
bgtz $t1, citeste # cat timp t1> 0 citim nr de la tastatura

jal bubble_sort #jump cu pastrare de legatura

li $v0, 4 #afisam mesajul cu "vectorul sortat"
la $a0, msg_afisare_vector_sortat
syscall

lw $t0, adresa_vector #$t0<-adresa initiala a vectorului
repeta:
lw $a0, ($t0) #in a0 punem primul nr
li $v0, 1
syscall
putc ' ' #afiseaza pe consola mesaj
addi $t0, $t0, 4
addi $a1, $a1, -1#a1 are nr de nr
bgtz $a1, repeta#cat timp a1>0 repeta

done

#rutina bubble sort
bubble_sort:
li $t1, 1 #$t1<-1
move $t2, $a1 #$t2<-nr de nr
for1:
li $t3, 0 #$t3<-0
move $t4, $a1 #$t4<-n-1
addi $t4, $t4, -1
lw $t0, adresa_vector #$t0<-adresa vectorului

for2:
lw $t5, ($t0) #$t5<-a[i]
lw $t6, 4($t0) #$t6<-a[i+1]
#daca a trecut de mijl sirului sare la eticheta, daca nu interschimba
sgt $t7, $t5, $t6   #s0 devine 1 daca s-a trecut de mijlocul sirului
beqz $t7, continua #daca t7=0 atunci sare la continua
interschimbare:
sw $t6, ($t0)
sw $t5, 4($t0)
continua:
addi $t0, $t0, 4
addi $t3, $t3, 1
slt $t7, $t3, $t4#daca t3<t4 atunci, t7=1
bnez $t7, for2   #t7 diferit de  0, merge la et for 2

addi $t1, $t1, 1
slt $t7, $t1, $t2
bnez $t7, for1

jr $ra #revine din functie
