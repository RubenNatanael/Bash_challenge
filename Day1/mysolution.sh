#!/bin/bash
#Task1
#This program will do...
#Task2
echo "The first programm of the challenge"
#Task 3,4
echo "x="
read x
echo "y="
read y
echo $(( x + y ))
#Task5
echo $PWD
echo $SHELL
echo $LOGNAME
#Task6
find /home/ruben/Desktop/probleme/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Challenges/Day_1 -name '*.sh' | xargs basename -a


