#!/bin/bash -x
echo "computes different arithmetic expression"

#input from user
read -p "enter number:" a
read -p "enter number:" b
read -p "enter number:" c

#calculate expression
result1=`echo "$a+$b*$c"| bc`

