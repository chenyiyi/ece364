#! /bin/bash
#
#$Author: ee364f04 $ Yiyi Chen
#$Date: 
#$Revision:  
#$HeadURL: 
#$Id: 

Num_Of_Param=$#
Param_Values=$@
word1=(b a n a n a)
word2=(p a r s i m o n i o u s)
word3=(s e s q u i p e d a l i a n)
wordgue=()
guessed=0
user=0
get=0

ran=$RANDOM
(( ran=$ran%3 ))
#ran=0
if (( ran==0 )) 
then
    len=${#word1[*]}
    echo "YOur word is $len letters long."
    echo -n "Word is: "
    for (( i = 0; i < $len; i++ ))
    do 
	wordgue[$i]='.'
	echo -n ". "
    done
    echo ""

    while (( guessed != $len ))
    do
	echo -n "Make a guess: "
	read user
	for (( i = 0; i < $len; i++ ))
	do 
	    if [[ ${word1[i]} == $user ]]
	    then
		echo  "Good going!"
		get=1
		break
	    fi
	done
	if (( $get==0 ))
	then
	    echo "Sorry, try again. "
	    get=0
	fi
	get=0
	
 #print word
	echo ""

	for (( i = 0; i < $len; i++ ))
	do 
	    if [[ ${word1[i]} == $user ]]
	    then
		wordgue[i]=${word1[i]}
		guessed=$guessed+1
	    fi
	done
	if (( $guessed == $len ))
	then
	    echo -n "Congratulation! You guessed the word: "
	else
	    echo -n "Work is: " 
	fi
	for (( i = 0; i < $len; i++ ))
	do 
	    echo -n "${wordgue[i]}"
	done
	echo ""
    done
 
fi

if (( ran==1 )) 
then
    len=${#word2[*]}
    echo "YOur word is $len letters long."
    echo -n "Word is: "
    for (( i = 0; i < $len; i++ ))
    do 
	wordgue[$i]='.'
	echo -n ". "
    done
    echo ""

    while (( guessed != $len ))
    do
	echo -n "Make a guess: "
	read user
	for (( i = 0; i < $len; i++ ))
	do 
	    if [[ ${word2[i]} == $user ]]
	    then
		echo  "Good going!"
		break
	    elif (( $i==$len ))
	    then
		echo "Sorry, try again. "
	    fi
	done
	
 #print word
	echo ""

	for (( i = 0; i < $len; i++ ))
	do 
	    if [[ ${word2[i]} == $user ]]
	    then
		wordgue[i]=${word2[i]}
		guessed=$guessed+1
	    fi
	done
	if (( $guessed == $len ))
	then
	    echo -n "Congratulation! You guessed the word: "
	else
	    echo -n "Work is: " 
	fi
	for (( i = 0; i < $len; i++ ))
	do 
	    echo -n "${wordgue[i]}"
	done
	echo ""
    done
 
fi

if (( ran==2 )) 
then
    len=${#word3[*]}
    echo "YOur word is $len letters long."
    echo -n "Word is: "
    for (( i = 0; i < $len; i++ ))
    do 
	wordgue[$i]='.'
	echo -n ". "
    done
    echo ""

    while (( guessed != $len ))
    do
	echo -n "Make a guess: "
	read user
	for (( i = 0; i < $len; i++ ))
	do 
	    if [[ ${word3[i]} == $user ]]
	    then
		echo  "Good going!"
		break
	    elif (( $i==$len ))
	    then
		echo "Sorry, try again. "
	    fi
	done
	
 #print word
	echo ""

	for (( i = 0; i < $len; i++ ))
	do 
	    if [[ ${word3[i]} == $user ]]
	    then
		wordgue[i]=${word3[i]}
		guessed=$guessed+1
	    fi
	done
	if (( $guessed == $len ))
	then
	    echo -n "Congratulation! You guessed the word: "
	else
	    echo -n "Work is: " 
	fi
	for (( i = 0; i < $len; i++ ))
	do 
	    echo -n "${wordgue[i]}"
	done
	echo ""
    done
 
fi

