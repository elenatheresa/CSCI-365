#Elena Corpus
#program2
	
	.text		
	.globl boardsetup
	.data   					
board:  
          .ascii "  1   2   3\n1   |   |   \n -----------\n4   |   |   \n -----------\n7   |   |     	   1|2|3\n                   -----" 
          .ascii  "\n                   4|5|6\n                   -----"
          .asciiz "\n                   7|8|9\n"       													

start:				.asciiz   	"\n Play Tic Tac Toe? \n"
picklocation:			.asciiz	  	"\n User   Choose location (1-9): \n "
computerlocation:		.asciiz   	"\n Comp    Choose location (column|line): \n "		
yn:				.asciiz  	"\n y[1] or n[99]? \n"			
spacetaken:			.asciiz   	"\n Invalid, space is taken, please select another spot!  \n"
invalidsquare:			.asciiz  	"\n Invalid, please select the next square (1-9):  "
invalidcomputer:		.asciiz  	"\n Invalid, please select the next square (column|line):  "
xplayer:			.asciiz   	"X"  
oplayer:			.asciiz	   	"O"  
output8:   			.asciiz	   	"  "
gamewinner:			.asciiz 	"\nUser     won first, Congratulations!		 \n"	
blockcom:			.asciiz 	"\nUser     blocked next move User Wins!	\n"
blockuser:			.asciiz 	"\nComp     blocked next move Comp Wins!	\n"		
draw:				.asciiz 	"\nDraw \n!!"	
playagain:			.asciiz 	"\nDo you want to continue? yes [1] or No[99] \n"
menu:				.asciiz  	"\n\n Choose an option:\n[1] New Game\t[99] Quit\nOption: "
clean: 				.byte ' '																

insert_text:			.word 4   					
useroutput:			.asciiz   	"\n User is @: "
comoutput:			.asciiz   	"\n Computer is @: "
		
boardsetup:
	#board grid
	li $t1, 0
	li $t2, 0
	li $t3, 0
	li $t4, 0
	li $t5, 0
	li $t6, 0
	li $t7, 0
	li $t8, 0
	li $t9, 0

	li $s0, 0
	li $s5, 0
	
	#setup board
	la $s1, board				#board	
	la $s2, picklocation			#user 
	la $s3, computerlocation		#computer 
	la $s4, gamewinner			#win
	
	#clear the bard 
	lb $a1, clean
	sb $a1, 14($s1)
	sb $a1, 18($s1)
	sb $a1, 22($s1)
	sb $a1, 40($s1)
	sb $a1, 44($s1)
	sb $a1, 48($s1)
	sb $a1, 66($s1)
	sb $a1, 70($s1)
	sb $a1, 74($s1)
	

	li 	$v0, 4 		   		# print string
	la 	$a0, start 			
	syscall			   		#prints a0	
		   	
	#Y or N to game 
	li 	$v0, 4		   		#y or n  
	la 	$a0, yn	 				
	syscall			  	 	#prints a0

	li 	$v0, 5				
	syscall	
			   	
	bne 	$v0, 99, printboard 		#99 = clear board 
	li 	$v0, 10				#end the game 
	syscall					#8 = input string, put in a0	

printboard:
	li 	$v0, 4 		    		#current board 
	la 	$a0, board	
	syscall
	
	#is it a tie ? 
	beq 	$s5, 9, tie
	
	add 	$s5, $s5, 1
	
	rem 	$t0, $s0, 2
	add 	$s0, $s0, 1
	bnez 	$t0, O

X:
	lb 	$a1, xplayer 			#prints x  
	sb	$a1, 7($s2)   			#where to move 
	sb 	$a1  8($s4)			# win ? 
	j playinggame

O:
	lb 	$a1, oplayer 			#prints o
	sb	$a1, 7($s3)   	 		#where to move
	sb	$a1, 8($s4)			# win ? 
	j computer

playinggame:		

        li 	$v0, 4		  	 	#print   
	la 	$a0, picklocation 		#loads input into memory
	syscall	

	li 	$v0, 4 				#reveives the selected and saves 
	la 	$a0, useroutput 		#stores
	syscall 				#prints a0		

	li 	$v0, 5
	syscall 
	move 	$s6, $v0
	
	#what has to be met in order to win
	beq $s6, 1, condition1
	beq $s6, 2, condition2
	beq $s6, 3, condition3
	beq $s6, 4, condition4
	beq $s6, 5, condition5
	beq $s6, 6, condition6
	beq $s6, 7, condition7
	beq $s6, 8, condition8
	beq $s6, 9, condition9

	slti $t1, $v0, 10   			#index > 9
	slti $t1, $v0, 1   			#index < 1. 	
	

   	li 	$v0, 4
	la	$a0, invalidsquare 		#invalid move
	syscall	
	J playinggame	
	
condition1:	
		bnez 	$t1, taken		#occupied 
		bnez 	$t0, spot12
	spot11: #x11
		li $t1, 1
		sb $a1, 14($s1)     		#new board 
		j  check
	spot12:	 #021
		li $t1, 2
		sb $a1, 14($s1)     		#new board 
		j  check
condition2:	
		bnez $t2, taken			#occupied 
		bnez $t0, spot22	
	spot21: #x12
		li $t2, 1
		sb $a1, 18($s1)     		#new board 
		j  check
	spot22:	 #022
		li $t1, 2
		sb $a1, 18($s1)     		#new board 
		j  check
condition3:
		bnez $t3, taken			#occupied 
		bnez $t0, spot32
	spot31: #x31
		li $t3, 1
		sb $a1, 22($s1)     		#new board 
		j  check
	spot32:	 #031
		li $t3, 2
		sb $a1, 22($s1)     		#new board 
		j  check
condition4:
		bnez $t4, taken			#occupied 
		bnez $t0, spot42
	spot41: #x12
		li $t4, 1
		sb $a1, 40($s1)     		#new board 
		j  check
	spot42:	 #012
		li $t4, 2
		sb $a1, 40($s1)     		#new board 
		j  check
condition5:
		bnez $t5, taken			#occupied 
		bnez $t0, spot52
	spot51: #x31
		li $t5, 1
		sb $a1, 44($s1)     		#new board 
		j  check
	spot52:	 #031
		li $t5, 2
		sb $a1, 44($s1)     		#new board 
		j  check
condition6:
		bnez $t6, taken 		#occupied 
		bnez $t0, spot62
	user61: #x61
		li $t6, 1
		sb $a1, 48($s1)     		#new board 
		j  check
	user62:	 #061
		li $t6, 2
		sb $a1, 48($s1)     		#new board 
		j  check
condition7:
		bnez $t7, taken			#occupied 
		bnez $t0, spot72
	spot71: #x71
		li $t7, 1
		sb $a1, 66($s1)     		#new board 
		j  check
	spot72:	 #071
		li $t7, 2
		sb $a1, 66($s1)     		#new board 
		j  check
condition8:
		bnez $t8, taken			#occupied 
		bnez $t0, spot82	
	spot81: #x81
		li $t8, 1
		sb $a1, 70($s1)     		#new board 
		j  check
	spot82:	 #081
		li $t8, 2
		sb $a1, 70($s1)     		#new board 
		j  check
condition9:
		bnez $t9, taken			#occupied 
		bnez $t0, spot92	
	spot91: #x91
		li $t9, 1
		sb $a1, 74($s1)     		#new board 
		j  check
	spot92:	 #091
		li $t9, 2
		sb $a1, 74($s1)     		#new board 
		j  check	
		
		
		
	
computer:

        li 	$v0, 4		  	 	#prints  
	la 	$a0, computerlocation 		#loads into memory
	syscall

	li $v0, 4 				#loads 
	la $a0, comoutput 			#stores 
	syscall 				#prints the string 		

	li $v0, 5
	syscall 
	move $s6, $v0
	
	#what has to be met in order to win 
	beq $s6, 11, condition1
	beq $s6, 21, condition2
	beq $s6, 31, condition3  
	beq $s6, 14, condition4
	beq $s6, 24, condition5
	beq $s6, 34, condition6 
	beq $s6, 17, condition7
	beq $s6, 27, condition8 
	beq $s6, 37, condition9  
	

   	li 	$v0, 4
	la	$a0, invalidcomputer 		#invalid computer 
	syscall 
	j computer
	
randomchoice:
	 subu  $sp, $sp, 4        		#subtract
	 sw    $ra, ($sp)         		#give to $ra
	 subu  $sp, $sp, 4        		#subtract $sp
	 sw    $t0, ($sp)        	 	#give the $t0
	 subu  $sp, $sp, 4       	 	#subtract the $sp
	 sw    $t1, ($sp)         		#give the $t1
	 
randomnum:  
	 xor   $a0, $a0, $a0      		#set a number 
	 li    $a1, 10            		#random number from 0 to 8
	 li    $v0, 40            		#random number
         syscall
         add   $t1, $a0, '1'      		#int to char
	 add   $a2, $a0, '1'      		#int to char

	 lb    $t0, board($v1)
	 bne   $t0, ' ', randomnum       	#r1 is not empty
	 move  $v0, $t1           		#move in char
	 lw    $t1, ($sp)        		#pop
	 addu  $sp, $sp, 4        		#add $sp
	 lw    $t0, ($sp)         		#pop $t0
	 addu  $sp, $sp, 4        		#add the $sp
	 lw    $ra, ($sp)         		#pop $ra
	 addu  $sp, $sp, 4        		#add to $sp
	 jr    $ra 

taken:
	li $v0, 4
	la $a0, spacetaken			#occupied
	syscall
	j playinggame

#ways to win
check:
	and  $s7, $t1, $t2      		# H top row
	and  $s7, $s7, $t3
	bnez $s7, victory


	and $s7, $t4, $t5      			#H middle row 
	and $s7, $s7, $t6
	bnez $s7, victory


	and $s7, $t7, $t8      			#H bottom row
	and $s7, $s7, $t9
	bnez $s7, victory


	and $s7, $t1, $t4     			#V left column
	and $s7, $s7, $t7
	bnez $s7, victory


	and $s7, $t2, $t5      			#V middle column 
	and $s7, $s7, $t8
	bnez $s7, victory

		
	and $s7, $t3, $t6     			#V right column
	and $s7, $s7, $t9
	bnez $s7, victory


	and $s7, $t1, $t5			#Diagonal 
	and $s7, $s7, $t9
	bnez $s7, victory


	and  $s7, $t7, $t5
	and  $s7, $s7, $t3  			#Diagonal
	bnez $s7, victory

	j printboard


victory:
	li 	$v0, 4
	la 	$a0, board
	syscall
	li 	$v0, 4
	la 	$a0, gamewinner      		#user win
	syscall
	j newgame
			              		
tie:
	li 	$v0, 4
	la 	$a0, draw
	syscall
	j newgame
	
continue:
	li 	$v0, 4
	la 	$a0, playagain 			#continue playing ?
	syscall
	li 	$v0, 5				#input int
	syscall
	bne $v0, 99, boardsetup 		#endsgame
	j newgame
				
newgame:

	li 	$v0, 4				#Loads
	la 	$a0, playagain			#play again ?  
	syscall

        li 	$v0, 4		   		#loads and prints  
	la 	$a0, menu 			#loads
	syscall			   		#prints a0
	li 	$v0, 5				#input an integer
	syscall
	bne 	$v0, 99, boardsetup		#empty the board
	
exit:	
	li 	$v0, 10
	syscall
