.data 0x10000480 # adresa de memorie a primului tablou (Array_A)
Array_A:
 .word 1,1,1,1,2,2,2,2
 .data 0x10000500 # adresa de memorie a celui de-al doilea tablou (Array_B)
Array_B:
 .word 3,3,3,3,4,4,4,4
 .text
 .globl __start
__start:
 la $2, Array_A # incarcare in registrul $2 a adresei primului element al tabloului Array_A
 la $3, Array_B # incarcare in registrul $3 a adresei primului element al tabloului Array_B
 li $6, 0 # $6 – suma
 li $4, 8 # $4 – contorul j
loop:
 lw $5, 0($2) # se citeşte elementul curent din tabloul Array_A
 lw $7, 0($3) # se citeşte elementul curent din tabloul Array_B
 add $6, $6, $5 # suma+= Array_A[j]
 add $2, $2, 4 # elementele tabloului Array_A sunt de tip word, pe 4 octeti
 add $3, $3, 4 # elementele tabloului Array_B sunt de tip word, pe 4 octeti
 addi $4, $4, -1 # decrementare contor: j--
 bgt $4, $0, loop # test continuare bucla: j>0

 li $v0, 10 # apel sisistem de incheiere program si cedare control catre sistemul de
 syscall # operare 