# Ask user for a word
word = input("Enter a word please: ")

# Length of word
print(f"Your word has {len(word)} characters.")

# Uppercase and Lowercase 
print(f"Here's your word in uppercase: {word.upper()}")
print(f"Here's your word in lowercase: {word.lower()}")

# Receive a letter and count how many appears in the word
letter = input("Type one letter: ")
print(f"{letter} appears {word.count(letter)} time(s) in {word}.")

# How many times substring appears in the word
substring = input("Type a substring: ")
print(f"{substring} appears in {word} {word.count(substring)} time(s)")

# Reverse the word
word_backwards = word[::-1]

# Get start/end index and slice the word
start_index = int(input("Enter a starting number: "))
end_index = int(input("Enter a ending number: "))
sliced_word = word[start_index:end_index]

print(f"You sliced {word} into {sliced_word}")

# Replace a character
u_char = input("Enter a character: ")
r_char = word.replace(u_char, "X")
print(f"You replaced {u_char} with 'X'")

# Add another word to the original word using concatenation
sec_word = input("Enter another word: ")
print(f"Concatenated: {word}{sec_word}")

# Is 'word' palindrome
if word == word_backwards:
    print("This word is palindrome")
else:
    print("This word is not palindrome")

# Valid python identifier
is_valid_id = word.isidentifier()
print(f"{word} is a valid python identifier: {is_valid_id}")
