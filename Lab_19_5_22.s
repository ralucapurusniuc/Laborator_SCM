*****LAB12_SCM_19.5.2022*****
TEMA: prob85
1/297 . Consideram un procesor scalar pipeline cu 5 nivele (IF, ID, ALU, MEM,
WB) si o secventa de 2 instructiuni succesive si dependente RAW, în
doua ipostaze:
A. i1: LOAD R1, 9(R5)
i2: ADD R6, R1, R3
B. i1: ADD R1, R6, R7
i2: LOAD R5, 9(R1)
a.Stabiliti cu ce întârziere (Delay Slot) starteaza a doua instructiune ?
b.Dar daca se aplica mecanismul de forwarding ?
În acest caz, pentru secventa B, cât ar fi fost întârzierea daca în
cazul celei de a doua instructiuni, modul de adresare nu ar fi fost
indexat ci doar indirect registru ? Comentati.
c.Verificati rezultatele obtinute pe procesorul DLX. Determinati
cresterea de performanta obtinuta aplicând mecanismul de
forwarding [(IRCu forwarding - IRFara forwarding) / IRFara forwarding].
****************************************************************************
I1: LOAD R1, 9(R5)
I2: ADD  R6,R1,R3
-------PENTRU A--------
a) pentru I1 : IF ID ALU MEM WB
   pentru I2 :    IF ID   -  -  ALU MEM WB
   delay slot =2 cicli de delay
b) pentru I1 : IF ID ALU MEM WB
   pentru I2 :    IF ID  -   ALU MEM WB
   delay slot =1 ciclu de delay
I1: ADD R1,R6,R7
I2: LOAD R5, 9(R1)  
-------PENTRU B---------
a) pentru I1 : IF ID ALU MEM WB
   pentru I2 :    IF ID   -   - ALU MEM WB
   delay slot =2 cicli de delay
b) pentru I1 : IF ID ALU MEM WB
   pentru I2 : IF ID ALU MEM WB
   delay slot = 0 cicli de delay
?cât ar fi fost întârzierea daca în cazul celei de a doua instructiuni, modul de adresare
nu ar fi fost indexat ci doar indirect registru ?  I2 : LD R9,(R1)=> delay slot= 1 ciclu

2./297 Scrieti o secventa de program asamblare RISC care sa reprezinte
translatarea corecta a programului scris în limbaj C ? Initial, registrii Ri,
Rk, Rl, Rj, Rm contin respectiv variabilele i, k, l, j si m.
K = X[i-4]+12;  // k,l,m,i,j-registru 12- val imediata
L = Y[j+5] XOR K;  // y[j+5] -valoarea din mem data din []
M = K AND L;

---trebuie calculata adresa

I1 : SUB Ri, Ri, #4

---LOAD citire mem

I2 : LOAD Rk,(Ri)

---prima instructiune

I3 : ADD Rk, Rk, #12  // #nr=> valoare decimala

---a2a instructiune

I4: ADD Rj, Rj,#5

---

I5 : LOAD R4, (Rj)

---a2a instructiune

I6 : XOR Rl, Rl, Rk

--- a3a instructiune

I7 : AND Rm, Rk, Rl

a)Reprezentati graful dependentelor de date (numai dependentele de
tip RAW). 2 este de 1 , 3 ESTE DEPENDENTA DE 2 , 4 NU E DEPENDENTA ,
5 E DEPENDENTA DE 4, 6 E DEPENDENTA DE 3 SI 5
7 E DEPENDENTA DE 6

       1   4
  |   |
       2   5
  |   |
  3 \ |
       \   6
\  |
\ 7
b) În câte impulsuri de tact se executa secventa de program asamblare?
o instructiunea are IF ID ALU MEM WB
NOP===> 1 DELAY SLOT( SE FOLOSESTE INTRE INST DEPENDENTE)
 se executa instructiunea 1: delay slot: 1
 1-NOP-2-NOP-3-4-NOP-5-NOP-6-NOP-7

I1: IF ID ALU MEM WB
I2:    IF ID  ALU    MEM WB

==> RASPUNS: 12 cicli

c) Reorganizati aceasta secventa în vederea minimizarii timpului de executie
(se considera ca procesorul detine o infinitate de registri generali).
impart graful pe layer
* ordine executie secventa organizata=> cu galben *
* 1 4 2 5 3 6 7*

1-4-2-5-3-NOP-6-NOP-7

==> RASPUNS: 9 cicli

d)Aplicând tehnica de forwarding, în câte impulsuri de tact se
executa secventa reorganizata ?
 1 4 2 5 3 6 7

==> RASPUNS: 7 cicli

8/302 Se considera secventa de program RISC:
I1: ADD R1, R2, #15
I2: ADD R3, R4, #17
I3: ADD R5, R3, R1
I4: ADD R6, R5, #12
I5: ADD R3, R7, #3
I6: ADD R8, R3, #2
I7: ADD R9, R8, #14

a) Sa se construiasca graful dependentelor de date (RAW, WAR,
WAW) aferent acestei secvente si precizati în câte impulsuri de tact
se executa secventa, stiind ca latenta de executie a instructiunii
ADD este de 1 ciclu ?

INTRE 2&5 -> WAW
INTRE 3&5 -> WAR
INTRE 2&6 -> RAW

1 2\WAW
RAW \RAW/ \
 3 \WAR\
  RAW| \ |
 4   5 /
 |
 6
 |RAW
 7
 
1-2-NOP-3-NOP-4-5-NOP-6-NOP-7

==> RASPUNS: 11 cicli
