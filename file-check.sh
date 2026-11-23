#!/bin/bash

read -p "Enter the file you want to check for: " file

if [ -f $file ]; then
	echo "File Available"
else
	echo "File Not Found"
	echo $?
fi
