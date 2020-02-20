#!/bin/bash

if [ "$1" == "-h" ]; then
  printf "Usage: `basename $0` - Select the pretrained weights you want to download.\n"
  exit 0
fi

printf "Enter the number of one of the following choices:\n"
printf "\n\t(1) - darknet53.conv.74 (yolov3) [155 MB]\n"
printf "\t(2) - yolov3-tiny.conv.11 [6 MB]\n"
printf "\t(3) - csresnext50-panet-spp.conv.112 [133 MB]\n\n"

read -p ">>> " n

case $n in
    "1")
        wget https://pjreddie.com/media/files/darknet53.conv.74
        ;;
    "2")
        wget --load-cookies /tmp/cookies.txt \
            "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=18v36esoXCh-PsOKwyP2GWrpYDptDY8Zf' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=18v36esoXCh-PsOKwyP2GWrpYDptDY8Zf" \
            -O yolov3-tiny.conv.11 && rm -rf /tmp/cookies.txt
        ;;
    "3")
        wget --load-cookies /tmp/cookies.txt \
            "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=16yMYCLQTY_oDlCIZPfn_sab6KD3zgzGq' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=16yMYCLQTY_oDlCIZPfn_sab6KD3zgzGq" \
            -O csresnext50-panet-spp.conv.112 && rm -rf /tmp/cookies.txt
        ;;
    *)
    printf "\nInvalid choice.\n"
    ;;
esac
