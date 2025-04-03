# Recursive Fibonacci Sequence 
# is a sequence in which each element is the sum of the two elements that precede it
# Prompt the user to enter a number and display the corresponding Fibonacci number

num_input = int(input("Enter a number: "))
def fibonacci(n):
    # default list to start
    num_list = [0, 1]
    # use to point to the index before the iterator 'num' in for loop
    pointer = 0
    # iterate over a range given by user
    for num in range(1, n):
        # sum of two elements
        sum_of_value = num_list[num] + num_list[pointer] 
        # append the sum of the two elements above to 'num_list'
        num_list.append(sum_of_value)
        # increment the pointer to keep up with the 'num' iterator/variable
        pointer += 1
    # return the value of the user's number entered from the 'num_list'
    return num_list[n]

print(fibonacci(num_input))