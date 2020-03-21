#!/bin/bash -x
echo "computes different arithmetic expression"

#input from user
read -p "enter number:" a
read -p "enter number:" b
read -p "enter number:" c

#calculate expression
result1=`echo " $a+$b*$c" | bc `
result2=`echo " $a*$b+$c" | bc `
result3=`echo " $c+$a/$b" | bc `
result4=`echo " $a%$b+$c" | bc `

#create Dictionary and store result in dictionary
declare -A dictionary
dictionary[1]=$result1
dictionary[2]=$result2
dictionary[3]=$result3
dictionary[4]=$result4

#store result in dictionary
echo "${!dictionary[@]}"
echo "${dictionary[@]}"

#created array and store dictionary value in array
declare -A array
key=1
for key in ${!dictionary[@]};
do
	array[$key]=${dictionary[$key]}
done

echo "${array[@]}"

#sorted array in descending order
for (( i=1;i<=4;i++ ))
do
	for (( j=$((i+1));j<=4;j++ ))
	do
		if [[ ${array[$i]} -lt ${array[$j]} ]]
		then
			temp=${array[$i]}
			array[$i]=${array[$j]}
			array[$j]=$temp
		fi
	done
done
echo "${array[@]}"

#sorted array in ascending order
for (( i=1;i<=4;i++ ))
do
	for (( j=$((i+1));j<=4;j++ ))
	do
		if [[ ${array[$i]} -gt ${array[$j]} ]]
		then
			temp=${array[$j]}
			array[$j]=${array[$i]}
			array[$i]=$temp
		fi
	done
done
echo "${array[@]}"


