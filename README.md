# Darknet
![darknet](https://pjreddie.com/static/img/darknet.png)

---

### Notebooks instructions

| Notebooks | Description |
| --- | --- |
| [drive_darknet.ipynb](drive_darknet.ipynb) | Notebook for training a new model |
| [drive_detect.ipynb](drive_detect.ipynb) | Notebook for inference only (cropping and splitting images) |
| [drive_scripts.ipynb](drive_scripts.ipynb) | Notebook that contains some images scripts |

### Darknet instructions

| Darknet task | Command |
| --- | --- |
| Train with 2 GPUs | `nvidia-docker run --rm -it -v "$(pwd):/usr/src/app" -w "/usr/src/app" --runtime=nvidia --name train_darknet william/darknet:latest detector train data/obj.data cfg/custom/customv3-tiny.cfg weights/yolov3-tiny.conv.11 -dont_show -gpus 1,2` |
| Compute MAP | `nvidia-docker run -it --rm -v "$(pwd):/usr/src/app" -w "/usr/src/app" --runtime=nvidia --name train_darknet_tiny william/darknet detector map data/obj.data cfg/custom/customv3-tiny.cfg backup/customv3-tiny_final.weights -dont_show` |
| Predict one test image | `nvidia-docker run -it --rm -v "$(pwd):/usr/src/app" -w "/usr/src/app" --runtime=nvidia --name train_darknet_tiny william/darknet detector test data/obj.data cfg/custom/customv3-tiny.cfg backup/customv3-tiny_final.weights samples/test_1.jpg -dont_show` |


#### How to do custom object detection ?

Change these settings in each .cfg file:

```
batch=64
subdivisions=16
max_batches=classes*2000
steps=0.8*max_batches,0.9*max_batches
filters=(classes+5)x3   # filters --> before each yolo layer
```
