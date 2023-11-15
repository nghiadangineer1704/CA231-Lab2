    .data
instr: .asciiz "asdasdasdasd" 
invastr: .asciiz "Invalid input"
count: .space 52
alphacount: .space 52
    .text
main:
    li $t0, 0
    li $t1, 0

    la $s0, instr
    la $s1, count
    la $s2, alphacount

count_loop:

    lb		$t2, ($s0 + $t0)
    beqz    $t2, sorting
    addi    $t0, $t0, 1
    li      $t3, 0

    li      $t6, 65
    li      $t7, 90
    li      $t8, 97
    li      $t9, 122
    
    blt     $t2, $t6, Invalid
    ble		$t2, $t7, search_alphabet
    blt     $t2, $t8, Invalid
    ble     $t2, $t9, search_alphabet
    j       Invalid
    
    
    search_alphabet:
        beq     $t3, $t1, addal
        lb      $t4, ($s2 + $t3)
        beq     $t4, $t2, upd_cou
        addi    $t3, $t3, 1
        j search_alphabet
    
    addal:
        sb      $t2, ($s2 + $t1)
        addi    $t1, $t1, 1
        

    j end
Invalid:
    li $v0, 4
	la $a0, invastr
	syscall
    j end
end: