#!/bin/bash

if [ "$1" == "-h" ]; then
  printf "Usage: `basename $0` - Select the models you want to download.\n"
  exit 0
fi

printf "Enter the number of one of the following choices:\n"
printf "\n\t(1) - yolov3.weights [236 MB]\n"
printf "\t(2) - yolov3-tiny.weights [34 MB]\n"
printf "\t(3) - yolov3-spp.weights [240 MB]\n"
printf "\t(4) - ALL [$((236 + 34 + 240)) MB]\n\n"

read -p ">>> " n

case $n in
    "1")
        wget https://pjreddie.com/media/files/yolov3.weights
        ;;
    "2")
        wget https://pjreddie.com/media/files/yolov3-tiny.weights
        ;;
    "3")
        wget https://pjreddie.com/media/files/yolov3-spp.weights
        ;;
    "4")
        wget https://pjreddie.com/media/files/darknet53.conv.74
        wget https://pjreddie.com/media/files/yolov3.weights
        wget https://pjreddie.com/media/files/yolov3-tiny.weights
        wget https://pjreddie.com/media/files/yolov3-spp.weights
        ;;
    *)
    printf "\nInvalid choice.\n"
    ;;
esac
