#!/bin/bash

echo "-----Convert Media Home------";
while true;
do 
    echo "Choose the Option (Select the number)"
    echo "1) Convert gif to frames"
    echo "2) Convert mp4 to frames"
    read option

    case "$option" in 
            1) echo "one" ;;
            2) echo "two" ;;
            *) exit ;;
    esac
done
