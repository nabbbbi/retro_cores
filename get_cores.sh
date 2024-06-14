#!/bin/bash

URL=https://github.com/christianhaitian/retroarch-cores/tree/master/aarch64
URL_RAW=https://github.com/christianhaitian/retroarch-cores/raw/master/aarch64/
FILE_PATH=/tmp/index.txt
FILE_PATH2=/tmp/index2.txt
DIRECTORY=/usr/lib/aarch64-linux-gnu/libretro/

touch $FILE_PATH
touch $FILE_PATH2

# removing all old cores
rm $DIRECTORY*.zip

# get trash url
wget --quiet -O $FILE_PATH $URL

# get core urls for downloading
cat $FILE_PATH | awk '{print $3}' | grep libretro | sed 's/aarch64\//\n/g' | sed 's/\".*//g' | cat > $FILE_PATH2

I=0

# download all cores

while read line ; do
    if test ${line##*.} == zip; then
	wget --quiet --directory-prefix=$DIRECTORY $URL_RAW$line
	unzip -q $DIRECTORY$line -d $DIRECTORY
	echo -n '*'
    fi
done < $FILE_PATH2

echo " "

# removing zip files
rm $DIRECTORY*.zip


