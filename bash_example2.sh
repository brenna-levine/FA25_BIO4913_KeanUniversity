#! /bin/bash

#set variable BTS equal to value of file name
BTS="BTS_data.txt"

#create list of unique BTS IDs in field 1 without header
tail -n +2 $BTS | cut -f 1 | sort -k1 | uniq > BTS_ids.txt

#echo a phrase to standard out
echo -e "These are my favorite snakes:"

#loop through BTS_ids.txt and echo lines to standard out
while read LINE   #while reading variable LINE
do
	echo $LINE #echo value of variable LINE
	echo -e "\n" #echo a new line
done < BTS_ids.txt #file to loop through
