# Commands

## Train with 2 GPUs:

```bash
nvidia-docker run --rm -it -v "$(pwd):/usr/src/app" -w "/usr/src/app" --runtime=nvidia --name train_darknet william/darknet:latest detector train data/obj.data cfg/custom/customv3-tiny.cfg weights/yolov3-tiny.conv.11 -dont_show -gpus 1,2
```

## Compute MAP:
```bash
nvidia-docker run -it --rm -v "$(pwd):/usr/src/app" -w "/usr/src/app" --runtime=nvidia --name train_darknet_tiny william/darknet detector map data/obj.data cfg/custom/customv3-tiny.cfg backup/customv3-tiny_final.weights -dont_show
```

## Detect on test image:
```bash
nvidia-docker run -it --rm -v "$(pwd):/usr/src/app" -w "/usr/src/app" --runtime=nvidia --name train_darknet_tiny william/darknet detector test data/obj.data cfg/custom/customv3-tiny.cfg backup/customv3-tiny_final.weights samples/photo_demo_Ionel/test_2.jpg -dont_show
```

# Custom object detection

```
batch=64
subdivisions=16
max_batches=classes*2000
steps=0.8*max_batches,0.9*max_batches
filters=(classes+5)x3
```

need to try:

> Only if you are an expert in neural detection networks - recalculate anchors for your dataset for width and height from cfg-file: darknet.exe detector calc_anchors data/obj.data -num_of_clusters 9 -width 416 -height 416 then set the same 9 anchors in each of 3 [yolo]-layers in your cfg-file. But you should change indexes of anchors masks= for each [yolo]-layer, so that 1st-[yolo]-layer has anchors larger than 60x60, 2nd larger than 30x30, 3rd remaining. Also you should change the filters=(classes + 5)*<number of mask> before each [yolo]-layer. If many of the calculated anchors do not fit under the appropriate layers - then just try using all the default anchors.

