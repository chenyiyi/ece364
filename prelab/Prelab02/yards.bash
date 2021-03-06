#! /bin/bash
#
#$Author: ee364f04 $ Yiyi Chen
#$Date: 
#$Revision:  
#$HeadURL: 
#$Id: 

Num_Of_Param=$#
Param_Values=$@

avg=0
max=0

if (( $#!=1 ))
then 
    echo "Usage: yards.bash <filename>"
    exit 0
elif [[ ! -e $1 ]]
then 
    echo "Error: $1 is not readable"
    exit 2
else
    while read -a line
    do
	sum=0
	var=0
	for ((i = 1; i < ${#line[*]}; i++))
	do
	    ((sum=$sum+${line[$i]}))
        done
	((avg=$sum/(${#line[*]}-1)))
	for ((i = 1; i < ${#line[*]}; i++))
	do
	    ((var=$var+(${line[$i]}-$avg)*(${line[$i]}-$avg)))
        done
	((var=$var/(${#line[*]}-1)))
	echo "${line[0]} schools averaged $avg yards receiving with a variance of $var"
	if (( $avg > max ))
	then
	    max=$avg
	fi
    done < $1
    echo "The largest average yardage was $max"
fi	
exit 0


