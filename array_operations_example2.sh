#! /bin/bash

################ Array operations in-class bash script #2
############### Making a file with counts of yum-scale of fruit.txt

#extract the yummy-scale data without the heading
grep -v Yum-Scale fruit.txt | cut -f 2 | sort | uniq > yum_scale.txt

###create a yum scale array
#initialize counter
COUNTER=0

#while loop to make array
while read line
do
	yum_array[$COUNTER]=$line
	let COUNTER=COUNTER+1
done < yum_scale.txt

####use array to get count of yum scale in fruit.txt
#reset counter
COUNTER=0

#get number of elements in array and write to a variable
MAX=$(echo ${#yum_array[@]})

#while loop to write counts to a file called "counts.txt"
while [ $COUNTER -lt $MAX ]
do
	sort -k 2 fruit.txt | grep ${yum_array[$COUNTER]} | wc -l >> counts.txt
	let COUNTER=COUNTER+1
done

#while loop to write yummy scale to a file
#reset counter
COUNTER=0
while [ $COUNTER -lt $MAX ]
do
	echo ${yum_array[$COUNTER]} >> scale.txt
	let COUNTER=COUNTER+1
done

#join the two columns
paste scale.txt counts.txt > yum

#create header
echo Yum-Rating Count > header

#cat header and data
cat header yum > yum_counts.txt

#remove intermediate files
rm scale.txt counts.txt yum_scale.txt yum header
