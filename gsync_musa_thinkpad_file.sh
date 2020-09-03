#!/bin/bash

local_directory="/home/musa/Projects/program-inputs"
filenames=$(<dirnames.txt)

echo "Number of lines is `wc -l dirnames.txt`"

for filename in $filenames; do
	sed -i '1d' dirnames.txt
	echo "Number of lines is `wc -l dirnames.txt`"
	#fname=${filename#$local_directory}
	#fname=${fname#'/'}
	echo $filename
	gupload -p 8 -f $filename -cl -d -V -R 3 
	./google-oauth2.sh refresh update
	gupload -p 8 -f $filename -cl -d -V -R 3 || set -e
done

