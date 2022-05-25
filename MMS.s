.data

textIntro: .asciiz "Introduceti un numar nr = "
textCifraMax: .asciiz "Cifra maxima = %d \n"
textCifraMin: .asciiz "Cifra minima = %d \n"
textSumaCifre: .asciiz "Suma cifrelor = %d \n"

	.align 2
afisareMax:	.word textCifraMax
valoareMax: .space 4

afisareMin:	.word textCifraMin
valoareMin: .space 4

afisareSuma: .word textSumaCifre
valoareSuma: .space 4

.text

.global main

main:

;citire numar de prelucrat
	addi r1, r0, textIntro
	jal InputUnsigned
	
;initializare registrii salvare valori

	;r2 - maximul cifrelor
	;r3 - minimul cifrelor
	;r27 - suma cifrelor
	
	addi r2, r0, -32000
	addi r3, r0, 32000
	addi r27, r0, 0
	addi r4, r1, 0	
		
;salvare numar
	add r9, r1, 0

loopCifre:
;salvare numar dupa eliminare cifra
	add r8, r1, 0
;preluare cifra
;impartire la 10
	addi r5, r0, 10

;calcul cifra in r6	
;r1 = r1 / 10
;r6 = r1 * 10
;r6 = r8 - r6 = restul impartirii = ultima cifra
	div r1, r1, r5
	multu r6, r1, r5
	sub r6, r8, r6

;check maxim
maxim:
	sgt r10, r6, r2
;daca ne mai mare decat ultimul maxim setat
;vom verifica daca e minim
	beqz r10, minim
;daca nu, vom salva noul maxim
	addi r2, r6, 0

;check minim
minim:
	slt r10, r6, r3
;daca ne mai mare decat ultimul minim setat
;vom aduna la suma
	beqz r10, suma
;daca nu, vom salva noul minim
	addi r3, r6, 0
	
;add to the sum
suma:
	add r27, r27, r6
	
;daca numarul mai are cifre, repetam loop-ul
	bnez r1, loopCifre
;daca nu, afisam maximul, minimul si suma cifrelor
;afisare maxim
	sw valoareMax, r2
	addi r14, r0, afisareMax
	trap 5
;afisare minim
	sw valoareMin, r3
	addi r14, r0, afisareMin
	trap 5
;afisare suma
	sw valoareSuma, r27
	addi r14, r0, afisareSuma
	trap 5
	trap 0