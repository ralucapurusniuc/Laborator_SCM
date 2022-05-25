.data
array: word 1, 2, 3, 4, 5...
n: word 5
sum : word
 .text
 .globl main
#ct li $t4,0
main:
la $t1, array($t1<-0x1000)
for :lw $t2, ($t1)    //valoarea registrului t2 se pune in adresa indicata de registrul t1 
     addi $t1,$t1,4  //+4
jump if(  $t3 <-sum)
sw $t3, sum


Pentru exemplificare vom scrie codul necesar afisarii unui mesaj de tipul: “solutia corecta = 10”.
 .data 
str:
 .asciiz “solutia corecta =” 
.text
 li $v0, 4  # codul apelului sistem pentru afisare de string 
la $a0, str # adresa sirului de tiparit
 syscall    # afiseaza sirul
li $v0, 1   # codul apelului sistem pentru afisare de întreg
li $a0, 10 # valoarea întreaga de tiparit 
syscall # afiseaza valoarea

În momentul rularii secventei de instructiuni vom observa ca instructiunea li $v0, 4 – care este de fapt o pseudoinstructiune, este înlocuita de instructiunea ori $2, $0, 4; instructiunea de încarcare imediata în registru se obtine printr-o operatie de SAU între registrul 0, care este întotdeauna 0, si valoarea respectiva.


PROBLEMA LAB 2
"Simularea si optimizarea arhitecturilor de calcul in aplicatii practice"
  -- program de calcul a sumei de n numere întregi aflate în memorie la adresa 0x10010000. Afişare sumă şi scriere în memorie la adresa 0x10010030. Calcul medie aritmetică, afişare cât şi rest.  --

.data
array: .word 1,3,7,5,9
n: .word 5
sum:: word 0x10010030
cat :: word
.text
.globl main
main:
  la $t1,array
  lw $t4, n  # n ul se va decrementa mai incolo; se considera contor
  li $t3, 0
for: lw $t2, ($t1)
      add $t3, $t3, $t2
      addi $t1, $t1, 4  #se incrementeaza adresa cu +4 (avem 4 octeti in word)
       addi $t4, $t4, -1 #se decrementeaza contorul
 bgtz $t4, for
 sw $t3, sum
done
#de aici incepe media aritmetica
lw $t4, n #se incarca n intr un nou registru pt ca l am tot decrementat mai sus; in t3 am suma; in t4 am nr de elemente
div $t3, $t4 #aici este 25/5 aici e media aritmetica ; catul se va pune in registrul low si restul in registrul high
mfhi $t5  #move from high
sw $t5, cat
mflo $t5 #move from low aici e catul
la $t6, cat
sw $t5, 4 ($t6)
done
