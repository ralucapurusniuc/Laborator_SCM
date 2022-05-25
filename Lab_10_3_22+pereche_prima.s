#ii) Scrieţi un program care afişează primele n perechi de numere prime impare consecutive (n
#- număr natural citit de la tastatură). Exemplu: (3,5), (5,7), etc.
#LAB 3 EX ii
    .data
msg: .asciiz "Introduceti n (n>1)"
.text
.globl main
main:
geti $t9                      #in a0 va fi n ul; nr de numere prime
li $t1, 3                     #t1 primeste numarul care trebuie verificat (incepem cu )
putc 0x28                     #paranteza (    
puti $t1                      #afisarea pe ecran
addi $t9, $t9, -1             #se decrementeaza a0
next_number: addi $t1, $t1, 1 #se incrementeaza numarul si dupa vom avea nevoie de jum lui
li  $t0, 2                    #punem 2-ul intr un registru ca sa l putem folosi mai tarziu pt impartirea la 2
div $t1, $t0                  #se afla jumatatea numarului
mflo $t2                      #se pune rezultatul de la impartireala 2 de mai sus in t2
next_div: div $t1, $t0        #verificam daca nr nostru se divide cu primul divizor
mfhi $t3                      #am mutat in t2 move from high
                              #avem nevoie de rest sa vedem daca se divide
beqz $t3, next_number         #verificarea restului
addi $t0, $t0, 1              #trecem la urmatorul divizor
blt $t0,$t2, next_div         #daca t0 e mai mic decat t2 sar la urmatorul div
puti $t1                      
putc 0x2C                     #virgula ,
puti $t1                      #nr e prim => afisarea pe ecran
putc 0x29                     #paranteza )
addi $t9, $t9, -1             #decrementam n
bgtz $t9, next_number         #se compara a0 cu 0 si cat timp e mai mare decat 0 se merge sa se verifice nr urmatorul
done
