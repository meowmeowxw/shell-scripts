#!/bin/bash
for ((i=32;i<255;i++))
do 
	printf "\\$(printf %03o "$i")"; 
	printf "\n%d\n" $i
done;
printf "\n"
