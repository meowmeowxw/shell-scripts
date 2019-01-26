#!/bin/bash
ps aux > /tmp/aux 
awk -v search="$1" 'BEGIN { print "USER\t\tPID\t\tSTAT\t\tCOMMAND" } $0~search { print $1,"\t",$2,"\t\t",$8",\t\t",$11 }' /tmp/aux 
rm /tmp/aux
