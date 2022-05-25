# Lab4_b
#b) Realizaţi un program care citeşte de la tastatură două numere naturale n şi k
#(n>k) şi calculează şi afişează pe consolă valorile următoare:

.data
d0: .asciiz "Introduceti n= "
d1: .asciiz "Introduceti k= "
.text
.globl main

main:

puts d0            #afisare
citire_n: geti $a0      #citim n de la tastatura
          blt $a0,0,citire_n
          move $t3, $a0
          jal factorial      #apelam factorial
#puti $t0
          move $t1, $t0
puts d1
citire_k: geti $a0
          blt $a0,0,citire_k
          move $t4, $a0
          jal factorial
#puti $t0
move $t2, $t0
sub $a0, $t3, $t4
jal factorial
move $t5, $t0

mul $t6, $t5, $t2
div $t7, $t1, $t6
puti $t7
done


#factorial:
 #         sw $ra, ($sp) #push $ra
 #        addi $sp, $sp, -4 #decrementam
 #         li $t0
#multiply: mul $t0, $t0, $a0  # sau mult $t0, $a0 si rez=> LO
 #         addi$a0, $a0, -1
 #         bgtz $a0, multiply
 #        addi $sp, $sp , 4 # incrementam
 #         lw $ra, ($sp)      # push  $ra  
#jr $ra


 factorial:
li $t0, 1
beqz $t0, final
multiply:
mul $t0,$t0, $a0
addi $a0, $a0, -1
bgtz $a0, multiply
final:
jr $ra