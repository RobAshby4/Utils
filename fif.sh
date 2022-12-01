#! /usr/bin/bash

findinfile () {
    OIFS="$IFS"
    IFS=$(echo -en "\n\b")
    echo -e "\n"
    for file in $(find -O3 -type f )
    do
        if [ -r $file ]; then
            CURRENTFILE=$(grep -c $1 $file)
            if [ $CURRENTFILE -gt 0 ]; then
                    echo "MATCH:" $(realpath $file)
                    grep -C 1 -n $1 $file
                    echo -e "\n"
            fi
        fi
    done
    IFS="$OIFS"
}

if [ -z $1 ]; then
    echo "Please put in grep expression"
else
    findinfile $1
fi
