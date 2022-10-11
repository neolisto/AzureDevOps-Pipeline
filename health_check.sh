#!/bin/bash

declare -i counter="0"
declare -i access="0"

while [ "$counter" -ne "10" ]
do
    curl 142.132.183.11:4200
    result=$(echo $?)


    if  [ "$result" -ne "0" ]
    then
        counter=$(( $counter + 1 ))
        echo "Host unreachable"
    else
        echo "Host is active!!!"
        counter="10"
        access="1"
    fi
done

if [ "$access" -eq "1" ]
then
    echo "Script exit with 0 exit code."
else
    echo "Service unreachable. Try later."
fi
