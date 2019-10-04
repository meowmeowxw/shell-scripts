#!/bin/bash
#it is a virtual-host bruteforcer/fuzzer (i don't know exactly what it is)
#it must be run as root/sudo
#give to the script as the 1st argument the file which contains
#the list of dns, and as the 2nd argument the ip to try

help ()
{
	echo "use : ./dns-bruteforce.sh wordlist_file ip_address"
}

if [ $# -ne 2 ]
then
	help 
	exit 1
fi

WORDLIST=$1
IP=$2
for DNS in $( cat $WORDLIST );
do
	cp /etc/hosts /etc/hosts.origin
	echo "$IP $DNS" >> /etc/hosts
	curl https://$DNS -s -k > file.output
	count=$(cat file.output | wc -l)
	if [ $count -gt 100 ]
	then 
		echo "$DNS is the right one"
	fi
	cp /etc/hosts.origin /etc/hosts 
done
rm /etc/hosts.origin 
rm file.output

