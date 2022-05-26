;fibonacci
;0 1 1 2 3 5 8 (9 13 21..     50)
; cit a, b
;
;
;c1=0;
;c2=1;
;sum=0;
;
;while (sum < a)
;{
;	sum=c1+c2;
;	c1=c2;
;	c2=sum;
;}
;while(sum < b)
;{
;	cout<< sum + " ";
;	sum=c1+c2;
;	c1=c2;
;	c2=sum;
;}
;
;$t0 - c1
;$t1 - c2
;$t2 - sum
;$t3 - a
;$t4 - b

.data
mesaj1: .asciiz "introd a"
mesaj2: .asciiz "introd b"
mesaj3: .asciiz "fibonacci:"
spatiu: .asciiz " "

.text

la $a0, mesaj1
li $v0, 4
syscall

geti $t3

la $a0, mesaj2
li $v0, 4
syscall

geti $t4

la $a0, mesaj3
li $v0, 4
syscall

li $t0, 0
li $t1, 1
li $t2, 0

loop:
add $t2,$t1,$t0
move $t0,$t1
move $t1, $t2
blt $t2, $t3, loop 

loop1:
puti $t2
putc spatiu
add $t2,$t1,$t0
move $t0,$t1
move $t1, $t2
blt $t2, $t4, loop1