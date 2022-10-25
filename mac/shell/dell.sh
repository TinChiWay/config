#!/usr/local/bin/bash
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
