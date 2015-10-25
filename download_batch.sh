#!/bin/bash
mkdir -p parsed
mkdir -p raw
cat pdflist.txt | while read line
do
   # do something with $line here
    for i in {2014..2015}
    do
        ./download.sh $line $i
    done
done



