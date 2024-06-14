#!/bin/bash

FILE=/tmp/free.txt
touch $FILE

curl --quiet -o $FILE https://m.joyreactor.cc/tag/%D0%A5%D0%B0%D0%BB%D1%8F%D0%B2%D0%B0/new

cat $FILE | sed 's/ /\n/g' | grep Постов | sed 's/[</>":]/ /g' | awk '{print $8}'
