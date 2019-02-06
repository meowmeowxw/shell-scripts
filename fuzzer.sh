#!/bin/bash

WORDLIST=$1
for KEY in $( cat $WORDLIST );
do
	#insert url here
	curl https://localhost/$KEY -k -s > file.output
        COUNT=$(wc -w file.output)
	COUNT=${COUNT::-12}
	if [ $COUNT -gt 870 ] || [ $COUNT -lt 600 ] 
	then
		if [ $COUNT -ne 0 ]
		then 		
			echo "word is : $KEY"
			echo "word count is : $COUNT"
		fi
	fi
done
rm file.output
