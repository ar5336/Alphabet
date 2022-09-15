import string
import random

alphabet = 'abcdefghijklmnopqrstuvwxyz'

while True:
    expected_index = random.randint(0, 25)
    expected_letter = alphabet[expected_index]
    print("index of "+expected_letter)
    input_index = int(input())
    #input_index = string.lowercase.index(input_letter)
    
    diff = input_index - (expected_index + 1)
    if diff == 0:
        print("good job\n")
    else:
        if diff < 0 :
            print("wrong, "+str(abs(diff))+" low. \t"+expected_letter+" is "+str(expected_index+1)+"\n")
        if diff > 0:
            print("wrong, "+str(abs(diff))+" high. \t"+expected_letter+" is "+str(expected_index+1)+"\n")
