#!/bin/bash
#The first argument to pass to the function is the wordlist to use
#The second argument is the File to decrypt
#I consider the file decrypted when I can read the ASCII code
#If the file to decrypt that you want to decrypt is not a text file then you need to remove the 13-19 lines.
help()
{
	echo "use : ./openssl-bruteforcer.sh wordlist_file key_file"
}

if [ $# -ne 2 ]
then
	help
	exit 1
fi

WORDLIST=$1 
KEYFILE=$2
for PASSWORD in $( cat $WORDLIST ); 
do
	openssl enc -aes-256-cbc -salt -d -in $KEYFILE -out decrypt_file.txt -pass pass:$PASSWORD 2> /dev/null
	if [ $? -eq 0 ]
	then
		file decrypt_file.txt | grep ASCII >/dev/null 
		if [ $? -eq 0 ]
		then 	
			echo "The password is: " $PASSWORD	
			echo "output saved on: decrypt_file.txt"
			break
		fi
	fi
done

