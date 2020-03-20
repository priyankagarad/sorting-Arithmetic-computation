#!/bin/bash -x
echo "computes different arithmetic expression"

#input from user
read -p "enter number:" a
read -p "enter number:" b
read -p "enter number:" c

#calculate expression
result1=`echo "$a+$b*$c" | bc`
result2=`echo "$a*$b+$c" | bc`
result3=`echo "scale=2; $c+$a/$b" | bc -l`
result4=`echo "scale=2; $a%$b+$c" | bc -l`

#create Dictionary
declare -A dictionary
dictionary[1]=$result1
dictionary[2]=$result2
dictionary[3]=$result3
dictionary[4]=$result4

echo "${!dictionary[@]}"
echo "${dictionary[@]}"


