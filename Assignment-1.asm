# Assignment 1
# Ranaelle Modo Modo
# this program gets the users's name and 3 integers 
# then calculates 3 expressions and display the results

.data
namePrompt:      .asciiz "What is your name? "
integersPrompt:  .asciiz "Please enter an integer between 1-100: "
msg:             .asciiz "your answers are: "
name:            .space 20
a:               .word 0
b:               .word 0
c:               .word 0
ans1:            .word 0
ans2:            .word 0
ans3:            .word 0


.text
main:
     # output prompt for name
     li $v0, 4
     la $a0, namePrompt
     syscall
     
     #get name from user 
     li $v0, 8
     li $a1, 20
     la $a0, name
     syscall
     
     #output prompt integers
     li $v0, 4
     la $a0, integersPrompt
     syscall
     
     #get first integer
     li $v0, 5
     syscall
     
     #save first integer
     sw $v0, a
     
     #output prompt integers
     li $v0, 4
     la $a0, integersPrompt
     syscall
     
     #get second integer
     li $v0, 5
     syscall
     
     #save second integer
     sw $v0, b
     
     #output prompt integers
     li $v0, 4
     la $a0, integersPrompt
     syscall
     
    #get third integer
     li $v0, 5
     syscall
     
    #save second integer
     sw $v0, c
     
     #load values  into registers
     lw $t0, a
     lw $t1, b
     lw $t2, c
     li $s0, 1
     li $s1, 2
     li $s2, 3
     li $s3, 4
     
     #calculate ans1
     add $t3, $t0, $t0
     sub $t4, $t3, $t2
     add $t5, $t4, $s3
     sw $t5,  ans1
     
     #calculate ans2
     sub $t3, $t1, $t2
     sub $t4, $t0, $s1
     add $t5, $t3, $t4
     sw $t5,  ans2
     
     #calculate ans3
     add $t3, $t0, $s2
     sub $t4, $t1, $s0
     add $t5, $t2, $s2
     sub $t6, $t3, $t4
     add $t7, $t6, $t5
     sw  $t7,  ans3
     
     #display user's name
     li $v0, 4
     la $a0, name
     syscall
     
     #display the results prompt
     li $v0, 4
     la $a0, msg
     syscall
    
     #display the first answer
     li $v0, 1
     lw $a0, ans1
     syscall
     
     #print a whitespace between the first answer and the second answer
     li $v0, 11
     li $a0, ' '
     syscall
     
     #display the second answer
     li $v0, 1
     lw $a0, ans2
     syscall
     
     #print a whitespace between the second answer and the third answer
     li $v0, 11
     li $a0, ' '
     syscall
     
     #display the third answer
     li $v0, 1
     lw $a0, ans3
     syscall
     
exit:
     #exit the program
     li $v0, 10
     syscall
     
     
#First sample run I used a=13, b=-14, c=90
# and I expected ans1=-60, ans2=-93 and ans3=124

#  What is your name? Rita
#  Please enter an integer between 1-100: 13
#  Please enter an integer between 1-100: -14
#  Please enter an integer between 1-100: 90
#  Rita
#  your answers are: -60 -93 124
#  -- program is finished running --

      
#Second sample run I used a=-80, b=-65, c=-35
#and I expected ans1=-121, ans2=-112 and ans3=-43 
  
#  What is your name? Juan
#  Please enter an integer between 1-100: -80
#  Please enter an integer between 1-100: -65
#  Please enter an integer between 1-100: -35
#  Juan
#  your answers are: -121 -112 -43
#  -- program is finished running --
   
     
     
      
    
     
     
     