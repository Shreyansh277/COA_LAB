.data

prompt1: .asciiz "Enter a number a: "
prompt2: .asciiz "Enter a number b: "

result: .asciiz "Sum of two number is: "

.text

.globl main

main: 
    la $a0 ,prompt1
    li $v0 ,4
    syscall

    li $v0 ,5
    syscall
    move $s0,$v0

    la $a0 ,prompt2
    li $v0 ,4
    syscall

    li $v0 ,5
    syscall
    move $s1,$v0

    add $s2,$s1,$s0


    la $a0 ,result
    li $v0 ,4
    syscall

    move $a0,$s2
    li $v0,1
    syscall

    li $v0 ,10
    syscall

    