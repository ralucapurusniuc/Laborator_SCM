.data
nrperf:
.asciiz "\tEste perfect"
nu_e_perf:
.asciiz "\tNu este perfect"
intr_n:
.asciiz "Introduceti numarul: "
.text
la $a0, intr_n # adresa sirului de tiparit
li $v0, 4 # codul apelului sistem pentru afisare de string
syscall # afiseaza sirul
li $v0, 5 # codul apelului sistem pentru memorare
syscall # afiseaza sirul

move $t0, $v0 #in t0 punem n
move $t7, $t0 #t7=n pentru compare

li $t2, 0 #d = 0
li $t3, 0 # s = 0


li $t4, 2
div $t0, $t4 #aflam n/2
mflo $t1	#t1=n/2

xor $t4, $t4, $t4 #t4=0

loop:
	addi $t2, $t2,1 #d++ pentru impartire
	div $t0, $t2	#n%d
	mfhi $t4	#t4=restul
	beqz $t4, suma		#daca restul este 0 => este divizor => s+=d
	ble $t2,$t1,loop #daca d<=n/2 facem loop
	j afis
suma:
	addu $t3, $t3, $t2
	ble $t2,$t1,loop #daca d<=n/2 facem loop

#sub $t9, $t3, $t7
afis:
bne $t3, $t0, afisare_nu_e_perfect

afisare_perfect:
	la $a0, nrperf # adresa sirului de tiparit
	li $v0, 4 # codul apelului sistem pentru afisare de string
	syscall
	done

afisare_nu_e_perfect:
	la $a0, nu_e_perf # adresa sirului de tiparit
	li $v0, 4 # codul apelului sistem pentru afisare de string
	syscall
	done
	



