#!/bin/bash
#$Revision:001$

#Variables
BASE=/home/riya/files
DAYS=30
DEPTH=1
RUN=0

#check if the directory is present or not
if [ ! -d $BASE ]
then
	echo "directory does not exist: $BASE"
	exit 1
fi

#create 'archive' folder if not present
if [ ! -d $BASE/archive ]
then
	mkdir $BASE/archive
fi

#find the list of files larger than 20M
for i in 'find $BASE -maxdepth $DEPTH -type f -size +20M'
do
	if [ $RUN -eq 0 ]
	then
		echo "[$(date "+%Y-%m-%d %H:%M:%S")] archiving $i ==> $BASE/archive" 
		gzip $i || exit 1
		mv $i.gz $BASE/archive || exit 1
	fi
done
