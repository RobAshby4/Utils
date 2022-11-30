#! /usr/bin/bash

iteratedir () {
    for file in $(ls)
    do
        if [ -d $file ]; then
            (cd $file; iteratedir $1)
        else 
            if [ $(cat $file | grep -c $1) -gt "0" ]; then
                echo -e "\n"
                echo "--------------------------------------------------------------"
                echo "MATCH:" $(realpath $file)
                (cat $file | grep -C 1 -n $1)
            fi
        fi
            
    done
}

if [ -z $1 ]; then
    echo "Please put in grep expression"
else
    iteratedir $1
fi
