#!/bin/bash

while read line
do
	cpanm -n $line
	if [ "$?" != "0" ]; then
		echo "fail on $line\n";
		exit 1
	fi
done </root/modules.txt

