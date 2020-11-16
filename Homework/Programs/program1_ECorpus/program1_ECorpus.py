'''
Elena Corpus
CSCI 365
Program 1 
Write a same program in both Python and Java that fill an array/list with random integer values between
0 and 100 inclusive (think test scores, no bonus points), displays the high score, the low score, and the
average (with 2 places after the decimal point). The array/list should store exactly 20 integers.
'''

import random 

array = 0 
array = [random.randint(0,100) for i in range(20)]
#print(array)

def fillArray(array):
    array = random.randint(0,100)

def highValue(array):
    maxValue = 0
    for i in array:
        if maxValue > i:
            maxValue = i 
        elif maxValue < i: 
            maxValue = maxValue 
        elif maxValue == i: 
            maxValue = i

    return maxValue
        
def lowValue(array):
    minValue = 0
    for i in array: 
        if i > minValue:
            minValue = i
        elif i < minValue:
            minValue = minValue             
    return minValue

def averageValue(array):
    total = 0 
    count = 0
    for i in array:
        total = total + i 
        count = count + 1 

    aveValue = total / count
    return aveValue

def displayList(array):
    valueTitle = "Values"
    counter = 1
    print ('Values')
    for num in array:
        print ( format ( counter, "3d"), format( num, '3d'))
        counter += 1

fillArray(array)
print(array)
print(highValue(array))
print(lowValue(array))
print(averageValue(array))
displayList(array)
