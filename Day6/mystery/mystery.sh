#!/bin/bash

# Welcome to the Mysterious Script Challenge!
# Your task is to unravel the mystery behind this script and understand what it does.
# Once you've deciphered its objective, your mission is to improve the script by adding comments and explanations for clarity.

# DISCLAIMER: This script is purely fictional and does not perform any harmful actions.
# It's designed to challenge your scripting skills and creativity.

# The Mysterious Function
mysterious_function() {
    local input_file="$1"
    local output_file="$2"
    
    # Move each letter with 13 positions in the alphabet
    tr 'A-Za-z' 'N-ZA-Mn-za-m' < "$input_file" > "$output_file"

    # Reverse the "translated" word
    rev "$output_file" > "reversed_temp.txt"

    #Create a random number from 0 to 10
    random_number=$(( ( RANDOM % 10 ) + 1 ))
    echo "Random number = $random_number"
    # Mystery loop: Loop random_number times,if it is odd number the output is the inpit file, else we obtain the word moved with 13 positions and reversed
    for (( i=0; i<$random_number; i++ )); do
        # Reverse again the word(if it's the first time we obtain again the output file)
        rev "reversed_temp.txt" > "temp_rev.txt"

        # Move again the letters with 13 positions(if it's the first time we obtain the input file) and save the output in temp_enc
        tr 'A-Za-z' 'N-ZA-Mn-za-m' < "temp_rev.txt" > "temp_enc.txt"

        # rename the temp_enc
        mv "temp_enc.txt" "reversed_temp.txt"
    done

    # Clean up temporary files
    rm "temp_rev.txt"

    # The mystery continues...
    # The script will continue with more operations that you need to figure out!
    cat "reversed_temp.txt" > $output_file
    rm "reversed_temp.txt"
}

# Main Script Execution

# Check if two arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <input_file> <output_file>"
    exit 1
fi

input_file="$1"
output_file="$2"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: Input file not found!"
    exit 1
fi

# Call the mysterious function to begin the process
mysterious_function "$input_file" "$output_file"

# Display the mysterious output
echo "The mysterious process is complete. Check the '$output_file' for the result!"
