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
    william/darknet:0.1 \
        darknet train \
            data/obj.data \
            cfg/obj.cfg \
            weights/obj.weights
