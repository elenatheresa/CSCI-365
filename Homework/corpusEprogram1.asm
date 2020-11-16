	.text	
	.globl start
	.data  
	
buffer:		
	.space  300
board:  		.asciiz "  1   2   3\n1   |   |   \n -----------\n2   |   |   \n -----------\n3   |   |   \n"
          															
grid: 
	.word , 0 ,0, 0, 0 ,0 , 0 ,0 ,0 ,0
	
playgame:		.asciiz   	"\n Do you want to play Tic Tac Toe? \n"
picklocation:		.asciiz	  	"\n         Choose location (1-9): \n "		

yn:			.asciiz   	"\n Y or N? \n"
ynanwser:		.space 256				

taken:			.asciiz   	"\n Pick a different spot (1-9) \n"
invalid:		.asciiz   	"\n Invalid, Pick the next spot (1-9):  "
playerx:		.asciiz   	"X "
playero:		.asciiz	  	"O "
gameover:		.asciiz 	"\n game over !!!! "		
keepplaying:		.asciiz 	"\n Continue Playing? Yes [1] or No[99] \n"
menu:			.asciiz  	"\n\n Choose an option:\n[1] New Game\t[99] Quit\nOption: "
clean: 			.byte ' '																

insert_text:		.word 4   				

selected:		.asciiz   	"\n You selected:   \n"

.text 

start:
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
	la $s1, board		
		
	la $s2, picklocation	#user picks location 
	la $s3, gameover	#game over
	
	#clear board
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
	
	
#play the game
	li 	$v0, 4 		   	#print string
	la 	$a0, playgame 		
	syscall			   	#prints what is in $a0
			   	
#y or n to game
	li 	$v0, 4		   	
	la 	$a0, yn	 		#y or n  
	syscall			  	#prints whats in $a0

#insert text for user 
	la 	$a0, insert_text 	#space allocated for writing
	la 	$a1, insert_text	#length of the space in $a1 to avoid max
	li 	$v0, 8 		   	#go to $v0
	syscall				#8 = input string, put in $a0	
	
#print board 
printboard:
	li 	$v0, 4 		    	#current board
	la 	$a0, board

	syscall
	
	add $s5, $s5, 1
	
	rem $t0, $s0, 2
	add $s0, $s0, 1
	bnez $t0, O
	
#player x 	
X:
	lb 	$a1, playerx 		#print x 
	sb	$a1, 7($s2)   		#where to move
	sb 	$a1  8($s3)		#won?
	j begingame
	
#player o		
O:
	lb 	$a1, playero 		#print o
	sb	$a1, 7($s2)   	 	#where to move
	sb	$a1, 8($s3)		#won ? 
 		    		
begingame:		
					#4 = print 
        li 	$v0, 4		  	#recieves the selected and save s  
	la 	$a0, picklocation 	#loads input into memory
	syscall
	
					#output messages to user
	li $v0, 4 			#recieves the selected and saves
	la $a0, selected 		#prints what is in a0
	syscall 


	li $v0, 5
	syscall 
	move $s6, $v0
	
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
	
	li 	$v0, 4
	la	$a0, invalid  		#invalid move 
	syscall
	
	li 	$v0, 4
		la 	$a0, keepplaying #continue playing ?
		syscall
	J begingame

					#each condition allows for x option and o option

condition1:	
	bnez 	$t1, nospot  		#occupied 
	bnez 	$t0, spot12
	spot11: #x11 
		li $t1, 1
		sb $a1, 14($s1)     	#board 
		j  check
	spot12:	#021 
		li $t1, 2
		sb $a1, 14($s1)     	#board 
		j  check
condition2:	
		bnez $t2, nospot  	#occupied 
		bnez $t0, spot22	
	spot21: #x12
		li $t2, 1
		sb $a1, 18($s1)     	#board 
		j  check
	spot22:	 #022
		li $t1, 2
		sb $a1, 18($s1)     	#board 
		j  check
condition3:
		bnez $t3, nospot 	#occupied 
		bnez $t0, spot32
	spot31: #x31
		li $t3, 1
		sb $a1, 22($s1)     	#board 
		j  check
	spot32:	 #031
		li $t3, 2
		sb $a1, 22($s1)     	#board 
		j  check
condition4:
		bnez $t4, nospot 	#occupied 
		bnez $t0, spot42
	spot41: #x12
		li $t4, 1
		sb $a1, 40($s1)     	#board 
		j  check
	spot42:	 #012
		li $t4, 2
		sb $a1, 40($s1)     	#board 
		j  check
condition5:
		bnez $t5, nospot  	#occupied 
		bnez $t0, spot52
	spot51: #x31
		li $t5, 1
		sb $a1, 44($s1)     	#board 
		j  check
	spot52:	 #031
		li $t5, 2
		sb $a1, 44($s1)     	#board 
		j  check
condition6:
		bnez $t6, nospot  	#occupied 
		bnez $t0, spot62
	spot61: #x61
		li $t6, 1
		sb $a1, 48($s1)     	#board 
		j  check
	spot62:	 #061
		li $t6, 2
		sb $a1, 48($s1)     	#board 
		j  check
condition7:
		bnez $t7, nospot  	#occupied 
		bnez $t0, spot72
	spot71: #x71
		li $t7, 1
		sb $a1, 66($s1)     	#board 
		j  check
	spot72:	 #071
		li $t7, 2
		sb $a1, 66($s1)     	#board 
		j  check
condition8:
		bnez $t8, nospot  	#occupied 
		bnez $t0, spot82	
	spot81: #x81
		li $t8, 1
		sb $a1, 70($s1)     	#board 
		j  check
	spot82:	 #081
		li $t8, 2
		sb $a1, 70($s1)     	#board 
		j  check
condition9:
		bnez $t9, nospot 	#occupied 
		bnez $t0, spot92	
	spot91: #x91
		li $t9, 1
		sb $a1, 74($s1)     	#board 
		j  check
	spot92:	 #091
		li $t9, 2
		sb $a1, 74($s1)     	#board 
		j  check
nospot:
	li $v0, 4
	la $a0, taken  			#occupied 
	syscall
	j begingame
		
check:
# if this then win 

	and $s7, $t1, $t2
	and $s7, $s7, $t3
	bnez $s7, win

	and $s7, $t4, $t5
	and $s7, $s7, $t6
	bnez $s7, win

	and $s7, $t7, $t8
	and $s7, $s7, $t9
	bnez $s7, win

	and $s7, $t1, $t4
	and $s7, $s7, $t7
	bnez $s7, win

	and $s7, $t2, $t5
	and $s7, $s7, $t8
	bnez $s7, win

	and $s7, $t3, $t6
	and $s7, $s7, $t9
	bnez $s7, win

	and $s7, $t1, $t5
	and $s7, $s7, $t9
	bnez $s7, win

	and $s7, $t7, $t5
	and $s7, $s7, $t3
	bnez $s7, win
	j printboard
	
Continue:
	li 	$v0, 4
	la 	$a0, keepplaying 	#continue playing 
	syscall
	j win
	
win:
	li 	$v0, 4
	la 	$a0, board
	syscall
			
	li 	$v0, 4
	la 	$a0, gameover 		#gameover
	syscall
	j newgame
			
#user to continue ? 
newgame:
	
	li 	$v0, 4			#command to output
	la 	$a0, keepplaying	#continue? 
	syscall
					#options menu
        li 	$v0, 4		   	#4 = print string   
	la 	$a0, menu 		#loads the input
	syscall			   	#prints what is in a0
	
	li 	$v0, 5			#inputs integer
	syscall
	bne $v0, 99, start
		
exit:	
	li $v0, 10
	syscall
