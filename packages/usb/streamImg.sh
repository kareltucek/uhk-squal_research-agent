#!/bin/bash

feh -Z out.bmp --force-aliasing --reload 0.1 &

while [ true ]
do 
    ./makeImg.sh out
    sleep 0.1
done


