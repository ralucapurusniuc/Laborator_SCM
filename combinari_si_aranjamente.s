.data
nrprim:
.asciiz " test"
introdi_n:
.asciiz " Introduceti n:"
introdi_k:
.asciiz "\nIntroduceti k: "
rezultat_comb:
.asciiz "\nRezultatul combinarii este:"
rezultat_aranj:
.asciiz "\nRezultatul aranjamentului este:"
.text
la $a0, introdi_n # adresa sirului de tiparit
li $v0, 4 # codul apelului sistem pentru afisare de string
syscall # afiseaza sirul
li $v0, 5 # codul apelului sistem pentru afisare de string
syscall # afiseaza sirul

move $t0, $v0 #in t0 punem n

la $a0, introdi_k # adresa sirului de tiparit
li $v0, 4 # codul apelului sistem pentru afisare de string
syscall # afiseaza sirul
li $v0, 5 # codul apelului sistem pentru afisare de string
syscall # afiseaza sirul

move $t1, $v0 #in t1 punem k

xor $t2, $t2, $t2  #ne asiguram ca t2 = 0
xor $t3, $t3, $t3  #ne asiguram ca t3 = 0
xor $t4, $t4, $t4  #ne asiguram ca t4 = 0
xor $t5, $t5, $t5  #ne asiguram ca t5 = 0
xor $t6, $t6, $t6  #ne asiguram ca t6 = 0
xor $t7, $t7, $t7  #ne asiguram ca t7 = 0
xor $t8, $t8, $t8  #ne asiguram ca t8 = 0

sub $t2, $t0, $t1 #punem in t2 = n-k
addi $t3, $t3, 1	#t3=1=i
addi $t4, $t4, 1	#t4=1=j
addi $t5, $t5, 1	#t5=1=k

addi $t6, $t6, 1	#t6=n factorial=1
addi $t7, $t7, 1	#t6=k factorial=1
addi $t8, $t8, 1	#t8=nk factorial=1


loop_nf:
	mul $t6, $t6, $t3	#nf=nf*i;
	addi $t3,$t3,1	#i++
ble $t3, $t0, loop_nf

loop_kf:
	mul $t7, $t7, $t4 #kf*=j;
	addi $t4,$t4,1	#k++
ble $t4, $t1, loop_kf

loop_nkf:
	mul $t8,$t8,$t5	#(n-k)!
	addi $t5,$t5,1	#l++
ble $t5, $t2, loop_nkf


mul $t0,$t7,$t8 #t0=k!*(n-k)!
div $t6,$t0	#n!/k!*(n-k)!
mflo $t9 #t9=catul

la $a0, rezultat_comb # adresa sirului de tiparit
li $v0, 4 # codul apelului system
syscall

move $a0, $t9	#afisare catul combinarii
li $v0, 1
syscall

div $t1, $t6, $t8 #n!/(n-k)!
mflo $t9 #t9=catul

la $a0, rezultat_aranj # adresa sirului de tiparit
li $v0, 4 # codul apelului system
syscall

move $a0, $t9	#afisare catul combinarii
li $v0, 1
syscall

done
