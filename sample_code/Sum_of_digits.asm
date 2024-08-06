.data

prompt: .asciiz "Enter a integer max of 10 digit: "
result : .asciiz " Sum of all individuals digits: "

.text

.globl main
main: 
    li $v0 ,4
    la $a0,prompt
    syscall

    li $v0,5
    syscall

    move $s0,$v0
    li $t0,10
    li $s1,0


    j target			
    



target:
    ble $s0,$zero,exit_program
    div $s0,$t0
    mfhi $t1
    mflo $s0
    add $s1,$s1,$t1
    j target





exit_program:
    li $v0,4
    la $a0,result
    syscall

    move $a0 $s1
    li $v0 ,1
    syscall

    li $v0,10
    syscall





