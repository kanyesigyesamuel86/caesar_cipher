#!/bin/bash

shift_alphabet_backwards() {
    k=$1
    input_string=$2
    result=""

    for ((i=0; i<${#input_string}; i++)); do
        char="${input_string:$i:1}"
        if [[ "$char" =~ [a-zA-Z] ]]; then
            if [[ "$char" =~ [a-z] ]]; then
                ascii_val=$(($(printf '%d' "'$char") - $(printf '%d' "'a") - $k))
                shifted_char=$(printf \\$(printf '%03o' $(( (ascii_val + 26) % 26 + $(printf '%d' "'a")))))
            else
                ascii_val=$(($(printf '%d' "'$char") - $(printf '%d' "'A") - $k))
                shifted_char=$(printf \\$(printf '%03o' $(( (ascii_val + 26) % 26 + $(printf '%d' "'A")))))
            fi
        else
            shifted_char="$char"
        fi
        result="${result}${shifted_char}"
    done

    echo "$result"
}

echo -n "Enter the encrypted text here: "
read original_text

while true; do
    echo -n "Enter the trial key here: "
    read key
    shifted_text=$(shift_alphabet_backwards $key "$original_text")
    echo "$shifted_text"

    echo -n "Is the text meaningful? (y/n): "
    read prompt

    if [ "$prompt" == "y" ]; then
        break
    fi
done

