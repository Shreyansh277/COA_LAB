.data

number: .space 11

prompt: .asciiz "Enter a integer max of 10 digit: "
result : .asciiz " Sum of all individuals digits: "

newline: .asciiz "\n"


.text
.globl main
main:
    li $v0,4
    la $a0,prompt
    syscall

    la $a0,number
    li,$a1,11
    li $v0,8
    syscall

    li $v0,4
    la $a0,newline
    syscall


    li $v0,4
    la $a0,result
    syscall


    la $s0,number  #inital address of number array
    li $s1,0  #sum
    j target



target:
    lb $t0 ,($s0)
    beq $t0,0xA,exit_loop  #line feed char
    beqz $t0 ,exit_loop   #null char
    and $t1,$t0,0x0f
    addu $s1,$s1,$t1
    add $s0,$s0,1
    j target



exit_loop:
    li $v0 ,1
    move $a0,$s1
    syscall

    li $v0,10
    syscall
        

