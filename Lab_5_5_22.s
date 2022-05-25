.data
Prompt_n: .asciiz "Introduceti n=>1 : "
Prompt_k: .asciiz "Introduceti k=>1 : "

PrintfFormat_aranjamente: .asciiz "Aranjamente = %g\n\n"

PrintfFormat_combinari: .asciiz "Combinari = %g\n\n"
.align 2
Printf_aranjamente: .word PrintfFormat_aranjamente
PrintfValue_aranjamente:
.space 8
Printf_combinari: .word PrintfFormat_combinari
PrintfValue_combinari:
.space 8


.text
.global main
main:
;*** Read value from stdin into R1
addi r1,r0,Prompt_n
jal InputUnsigned

;*** init values
movi2fp f10,r1 ;R1 -> D0 D0..Count register
cvti2d f0,f10 ; n -> D0

addi r1,r0,Prompt_k
jal InputUnsigned

;*** init values
movi2fp f10,r1 ;R1 -> D6 D0..Count register
cvti2d f6,f10 ;k -> D6


addi r2,r0,1
movi2fp f11,r2
cvti2d f2,f11 ;1 -> D2 D2.. n! result

cvti2d f8,f11 ;1 -> D8 D8.. k! result

movd f4,f2 ;1-> D4 D4..Constant 1

;*** Break loop if D6 < 1
Loop: ltd f6,f4 ;D6<1 ?
bfpt Finish

;*** Multiplication and next loop
multd f2,f2,f0 ;f2 = n * (n-1) * ... * (n-k+1) = aranjamente
multd f8,f8,f6 ;f8 = k!

subd f0,f0,f4 ;n
subd f6,f6,f4 ;k
j Loop

Finish: ;*** write result to stdout
divd f10, f2, f8 ;f10 = combinari

sd PrintfValue_aranjamente,f2
addi r14,r0,Printf_aranjamente
trap 5

sd PrintfValue_combinari,f10
addi r14,r0,Printf_combinari
trap 5

;*** end
trap 0