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
    echo "The number of iput is not one"
    exit 1
fi

if [[ ! -e $1 || ! -r $1 ]]
then 
    echo "$1 is not exists or readable!"
    exit 2
fi

output="schedule.out"
exec 4> $output
echo "	07:00 08:00 09:00 10:00 11:00 12:00 13:00 14:00 15:00 16:00 17:00" >&4
while read line 
do
    user=$(echo $line | cut -d ' ' -f1)
    time=$(echo $line | cut -d ' ' -f2 | cut -d ',' -f1- )
    echo "$time"
    var_str=$time
done < data.txt





