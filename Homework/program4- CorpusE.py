'''
Elena Corpus 
Program 4 
Finish the ad hoc scanner designed to handle the following language. The
input for the scanner will be the output from the previous program. Each
line of input will contain a token and characters that make up the token.
The input for an execution can be considered “a program.” State that the
program is correct or halt the program with a simple error message if a
lexical error is found or when an <error> token is read. If there is an error
condition, with either an <error> token or a lexical error, be sure to state
what invalid text was found. 
'''

#Take in user input
operation = raw_input('Input your operation here: ')

fileName = input("Enter your file name: ")
if open(FileName, "r") == True: 
    
else: 
    print("File is not found")


def wPlus():
	print "PLUS"
	return
def wMinus():
	print "MINUS"
	return
def wDiv():
	print "DIV"
	return
def wMult():
	print "MULT"
	return
def wLparen():
	print "LPAREN"
	return
def wRparen():
	print "RPAREN"
	return
def wDot():
	print "DOT"
	return

options = {"+": wPlus, "-": wMinus, '/': wDiv, '*': wMult, '(': wLparen, ')': wRparen, '.': wDot}

#For each character in the operation
for i in range(0,len(operation)):
	#If the character is a digit, print int(character)
	if operation[i].isdigit():
		print "Int(" + operation[i] + ")"
	#If the character is one of the operations defined in our dictionary, print out
	#the corresponding token
	elif operation[i] != " " and operation[i] in options:
		options[str(operation[i])]()
	#If the character is an empty space, simply skip it
	elif operation[i] == " ":
		continue
	#If none of those cases fit, it is an invalid character and we want to stop the scanner.
	else:
		print "Error, invalid character: " + operation[i]
		break
