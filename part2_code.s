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
    li s2,1
    mv t5,t4
    lw a0,0(t5)
    add t3,t3,a0
    li a0,1
    slli a0,a0,2
    add t5,t5,a0
loop2:
    lw a0,0(t5)
    add t3,t3,a0
    li a0,1
    add s2,s2,a0
    slli a0,a0,2
    add t5,t5,a0
    sub a0,s2,t1
    bltz a0,loop2
    

div:
    li t0,0          
divloop:
    sub t3,t3,t1    
    bltz t3,done     
    addi t0,t0,1    
    j divloop            
done:
    sw t0,0(t6)
    #divu t0,t3,t1
	#sw t0,0(t6)
    li a0,1
    add s1,s1,a0
    slli a0,a0,2
    add t6,t6,a0
    slli a0,t1,2
    add t4,t4,a0
    sub a0,s1,t2
    bltz a0,loop
    li a7, 10	
    ecall

    
    
    
    