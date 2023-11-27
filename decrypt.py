def shift_alphabet_backwards(k, input_string):
    result = []
    for char in input_string:
        if char.isalpha():
            if char.islower():
                shifted_char = chr(((ord(char) - ord('a') - k) % 26) + ord('a'))
            else:
                shifted_char = chr(((ord(char) - ord('A') - k) % 26) + ord('A'))
        else:
            shifted_char = char
        result.append(shifted_char)
    return ''.join(result)

original_text = input('Enter the encrypted text here: ')
while True:
    key = int(input('Enter the trial key here:'))
    decrypted_text = shift_alphabet_backwards(key, original_text)
    print(decrypted_text)
    prompt = input('Is the text meaningful?(y/n):')
    if prompt == 'y':
        break


