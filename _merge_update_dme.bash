#!/bin/bash

#Usage statement
if [ $# -ne 2 ]; then
    echo "Usage: $0 <new tgstation.dme file> <old jollystation.dme file>"
    exit 1
fi

if [ ! -f $1 ]; then
    echo "Error: $1 file not found. This should be the new tgstation.dme."
    exit 1
fi

if [ ! -f $2 ]; then
    echo "Error: $2 file not found. This should be the old jollystation.dme"
    exit 1
fi


tempfile=temp_"$1"
sed '$d' $1 >> $tempfile
grep '#include "jollystation_modules' $2 >> $tempfile
echo "// END_INCLUDE" >> $tempfile
cp $tempfile $2
rm $tempfile
