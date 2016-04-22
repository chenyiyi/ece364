#! /bin/bash
#
#$Author: ee364f04 $ Yiyi Chen
#$Date: 
#$Revision:  
#$HeadURL: 
#$Id: 

Num_Of_Param=$#
Param_Values=$@
#pro=(a i)
#fastest=(0 0 0 5000)

if (( $#!=1 ))
then 
    echo "Usage: yards.bash <filename>"
    exit 1
fi

if [[ ! -e $1 ]]
then 
    echo "Error: $1 is not exitsted"
    exit 2
fi

time=$(head -n 1 $1 | cut -d ' ' -f3)

echo "Parsing file \"$1\". Timestamp: $time "

#need to modify!!!!!!!

printf "Your choices are:\n1) Active user IDs\n2) N Higherst CPU usages\n3) N Highest mem usage\n4) Top 3 longest running processes\n5) All processes by a specific user\n6) Exit\n\n"
#       Input choice
echo -n "Please enter your choice: "
read userinput

while (( $userinput != 6 ))
do
    if (( $userinput == 1 ))
    then
	user=$(head -n 1 $1 | cut -d ' ' -f8)
	echo "Total number of active user IDs: $user"
    elif (( $userinput == 2 ))
    then
	echo -n "Enter a value for N: "
	read N
	tail -n +8 $1 | head -n $N | sort -k9,9 -n -r > new.txt
	while read line 
	do
	    user2=$(echo $line | cut -d ' ' -f2)
	    usage2=$(echo $line | cut -d ' ' -f9)
	    echo "User $user2 is utilizing CPU resources at $usage2%"
	done < new.txt

    elif (( $userinput == 3 ))
    then
	echo -n "Enter a value for N: "
	read N
	tail -n +8 $1 | sort -k10,10 -n -r | head -n $N > new.txt
	while read line
	do
	    user3=$(echo $line | cut -d ' ' -f2)
	    usage3=$(echo $line | cut -d ' ' -f10)
	    echo "User $user3 is utilizing mem resources at $usage3%"
	done < new.txt

    elif (( $userinput == 4 ))
    then
	tail -n +8 $1 | sort -k11,11 -n -r | head -n 3 > new.txt
	while read line
	do
	    user4=$(echo $line | cut -d ' ' -f1)
	    usage4=$(echo $line | cut -d ' ' -f12)
	    echo "PID: $user4, cmd: $usage4"
	done < new.txt

    elif (( $userinput == 5 ))
    then
	echo -n "Please enter a valid username: "
	read userinput5
	grep $userinput5 $1 > new.txt 
	while read line
	do
	    user5=$(echo $line | cut -d ' ' -f9)
	    usage5=$(echo $line | cut -d ' ' -f12)
	    echo "$user5, $usage5"
	done < new.txt 
    fi
    echo ""
    echo -n "Please enter your choice: "
    read userinput
done

if (( $userinput == 6 ))
then
    exit 0
else
    echo "Error! Invalid Selection!"
    exit 0
fi

exit 0