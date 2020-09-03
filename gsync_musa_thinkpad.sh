#!/bin/bash

local_directory="/home/musa/Projects/program-inputs"
filenames=`find "$local_directory"/* -type d`

for filename in $filenames; do
	echo ${filename#"$local_directory"} && gsync $filename -d ${filename#"$local_directory"} -fg & ./google-oauth2.sh refresh update
done

