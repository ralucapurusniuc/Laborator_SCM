.data
Mesaj:
.asciiz "Introduceti numarul N (par si mai mare ca 6): "
msg1:
.asciiz "\n\tSuma: "
msg2:
.asciiz "+"
err1:
.asciiz "Va rog un numar par !"
err2:
.asciiz "Va rog un nr mai mare ca 6 !"
.text
Start:
li $v0,4 # Citire Numar
la $a0,Mesaj
syscall
li $v0,5
syscall
sle $a0,$v0,6
bnez $a0,eroare1
addi $a3,$v0,0 # in a3 numarul citit - fie N
li $a0,2
div $v0,$a0
mfhi $a0
mflo $a2 # in a2 mijlocul numarului N
bnez $a0,eroare2
j Cont
eroare1:
li $v0,4
la $a0,err2 # afisare mesaj ajutator pentru testarea unui
# numar par ³ 6
syscall
j Start
eroare2:
li $v0,4
la $a0,err1 # afisare mesaj ajutator pentru testarea unui
# numar par
syscall
j Start
Cont:
li $t0,0
Cont1:
addi $t0,$t0,1
sgt $s0,$t0,$a2 # s0 devine 1 daca s-a trecut de
# mijlocul sirului si se incheie
# programul
bnez $s0,Sfarsit
j verif_t0 # daca nu s-a trecut de mijlocul sirului verific
# daca i (primul element din suma) este prim
verif_t0:
li $s2,1
repeta:
addi $s2,$s2,1 # primul divizor s2=2
sge $s5,$s2,$t0 # daca prezumtivul divizor a depasit numarul
# - i - adica s5=1 inseamna ca nu s-a impartit
# niciodata exact cu vreun divizor Þ numarul
# este prim
bnez $s5,EPrim
div $t0,$s2
mfhi $s3
beqz $s3,Cont1 # daca t0 se imparte la unul din divizorii sai
# (s2) atunci numarul curent nu este prim si se
# trece la urmatorul numar - (i+1)
j repeta # se verifica in continuare impartirea
# numarului - i - la un alt posibil divizor
EPrim:
li $s2,1 # daca primul numar a fost prim - i - atunci se
# va testa daca si N-i este prim
sub $s4,$a3,$t0 # s4=a3-t0
repeta_2:
addi $s2,$s2,1 # din nou primul divizor ese s2=2
sge $s5,$s2,$s4 # daca prezumtivul divizor a depasit numarul
# - (N-i) – # adica s5=1 inseamna ca nu s-a
# impartit niciodata exact cu vreun divizor =>
# numarul este prim
bnez $s5,Afisare # daca s5=1 inseamna ca ambele numere sunt
# prime
# deci va fi afisata perechea (i, N-i)
div $s4,$s2
mfhi $s3
beqz $s3,Cont1 # daca (N-i) adica s4 se imparte la unul din
# divizorii sai (s2) atunci numarul curent nu
# este prim si se trece la urmatorul numar
# - (i+1)
j repeta_2 # se verifica in continuare impartirea
# numarului - (N-i) - la un alt posibil divizor
Afisare:
li $v0,4
la $a0,msg1
syscall
li $v0,1
addi $a0,$t0,0
syscall # afisare i (t0)
li $v0,4
la $a0,msg2
syscall
li $v0,1
addi $a0,$s4,0 # afisare N-i (s4)
syscall
j Cont1 # verific o urmatoare pereche de numere
# (i+1, N-i-1)
Sfarsit:
li $v0,10
syscall