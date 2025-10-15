#! /bin/bash

### example of array operation in a bash script

#################### create array 1
#initialize counter
COUNTER=0

#while loop to make array 1 consisting of 500 elements (values 0 - 499)
while [ $COUNTER -lt 500 ]; do a[$COUNTER]=$COUNTER; let COUNTER=COUNTER+1; done

#################### perform operation on array 1
#reset counter
COUNTER=0

######while loop to write every 4th element in array to a file
#make variable with number of elements in array
MAX=$(echo ${#a[*]})

while [ $COUNTER -lt $MAX ] #while the value of COUNTER < value of MAX
do 
	echo -e "The number is:\t ${a[$COUNTER]}" >> numbers.txt #echo the value to a file
	let COUNTER=COUNTER+4 #increase the counter by 4
done #close the while loop

