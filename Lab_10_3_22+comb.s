#combinari:n!/k!(n-k)!
.data
mesaj1: .asciiz "n=  "
mesaj2: .asciiz "k=  "
mesaj3: .asciiz "Rezultatul ="
n: .word
k: .word
.text
.globl main
main :
li $v0,4
la $a0,mesaj1
syscall

li $v0,5
syscall
move $a1,$v0

la $t0,n
sw $a1,($t0)

li $v0,4
la $a0,mesaj2
syscall

li $v0,5
syscall
move $a1,$v0

la $t1,k
sw $a1,($t1)



#n factorial
move $a0, $t0
    jal factorial
    move $t2, $v0    # $t2 = n!

#k factorial
move $a0, $t1
    jal factorial
    move $t3, $v0     # $t3 = k!

sub $a0, $t0, $t1 # $a0 = n - k
    jal factorial
    move $t4, $v0 # $t4 = (n-k)!

mul $t3, $t3, $t4 # $t3 = k! * (n-k)!
    div $t1, $t1, $t3 # $t1 = n! / (k! * (n-k)!)
factorial:
subu $sp,$sp,12
sw $ra,8($sp)
sw $fp,4($sp)
sw $a0,($sp)
addu $fp,$sp,12
lw $v1,($sp)
bgtz $v1,continua
li $v1,1
j sfarsit_recursivitate

continua:
subu $a0,$v1,1
jal factorial
lw $t0,($sp)
mul $v1,$v1,$t0

sfarsit_recursivitate:
lw $ra,8($sp)
lw $fp,4($sp)
addu $sp,$sp,12
jr $ra
