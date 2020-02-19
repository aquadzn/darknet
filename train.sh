#!/bin/bash

if [ "$1" == "-h" ]; then
  printf "Usage: `basename $0`\n"
  printf "\tArg1: *.data file path\n"
  printf "\tArg2: *.cfg file path\n"
  printf "\tArg3: *.weights or *.conv file path\n"
  exit 0
fi

nvidia-docker run --rm \
    -v .:/home/$(whoami) \
    -w /home/$(whoami)/ \
    --runtime=nvidia \
    --name train_darknet \
    william/darknet:latest \
        detector train \
            "$1" \
            "$2" \
            "$3" \
            -dont_show \
            -gpus 1,2

# Example:
# nvidia-docker run --rm -it -v "$(pwd):/usr/src/app" -w "/usr/src/app" --runtime=nvidia \
    # --name train_darknet william/darknet:latest \
    # detector train data/obj.data cfg/customv3-tiny.cfg weights/yolov3-tiny.conv.11 -dont_show -gpus 1,2