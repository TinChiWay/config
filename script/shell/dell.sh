#!/usr/local/bin/bash

#### param: [path] 
if (($# > 0))
then
    cd $1
else
    echo "don't change path"
fi

echo `pwd`

for file in ./*
do
    if test -d "$file"
    then
        echo "$file"
        cd "$file" || exit
        ls
        cd ..
    fi
done
