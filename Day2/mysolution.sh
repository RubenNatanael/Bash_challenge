#!/bin/bash

#Part 1
echo " Welcom to my programm"

while true;
do
    echo "Here you can se all the files in the current path:"
    files=$(ls)
    for item in $files
    do
        size=$(du -sh "$item" | awk '{print $1}')
        echo "$item  -size: $size"
    done
    #Part 2
    read -p "Please insert a string " input
    counter=${#input}
    if [ $counter = 0 ];then
        break
    fi
    echo "Total number of characters $counter"
done

