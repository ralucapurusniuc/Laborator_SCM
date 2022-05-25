#$t0=n , $t1=suma , $t2=elementele, $t3=contor
.data
mesaj:
.asciiz "Introduceti n: "
mesaj1:
.asciiz "Introduceti numerele "
afissuma:
.asciiz "Suma este "
.text

main:
li $v0, 4
la $a0, mesaj
syscall
li $v0,5
syscall
xor $t0,$t0,$t0
addi $t0,$v0,0
li $v0, 4
la $a0, mesaj1
syscall
xor $t1,$t1,$t1
xor $t2,$t2,$t2
xor $t3,$t3,$t3
xor $t4,$t4,$t4
addi $t3,$t3,1
suma:
li $v0,5
syscall
addi $t2, $v0, 0
add $t1,$t1,$t2
addi $t3,$t3,1
ble $t3,$t0