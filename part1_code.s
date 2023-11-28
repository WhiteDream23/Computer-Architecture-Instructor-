.data
num:    .word 0,1,2,3,4,5
result:    .word 0,0,0
row:    .word 2
col:    .word 3

.text

main:
    la a0,col
    lw a0,0(a0)
    mv t1,a0
    la a0,row
    lw a0,0(a0)
    mv t2,a0
    la t4,num
    la t6,result
    li s1,0
loop:
    li t3,0    #sum=0
    li s2,0
    mv t5,t4
loop2:
    lw a0,0(t5)
    add t3,t3,a0
    li a0,1
    add s2,s2,a0
    slli a0,t1,2
    add t5,t5,a0
    sub a0,s2,t2
    bltz a0,loop2
    

# input£ºa0 - dividend, a1 - divisor
# output£ºt0 - quotient
div:
    li t0,0          # set quotient 0
divloop:
    sub t3,t3,t2     # culculate remainder£¨dividend - divisor£©
    bltz t3,done     # if remainder<0£¬jump to done
    addi t0,t0,1     # quotient++
    j divloop        # loop again
done:
    sw t0,0(t6)      #write the result
    
	#divu t0,t3,t2
	#sw t0,0(t6)
    li a0,1
    add s1,s1,a0
    slli a0,a0,2
    add t4,t4,a0
    add t6,t6,a0
    sub a0,s1,t1
    bltz a0,loop
    li a7, 10	
    ecall

    
    
    
    