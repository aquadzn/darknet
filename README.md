# Darknet
![darknet](https://camo.githubusercontent.com/e69d4118b20a42de4e23b9549f9a6ec6dbbb0814/687474703a2f2f706a7265646469652e636f6d2f6d656469612f66696c65732f6461726b6e65742d626c61636b2d736d616c6c2e706e67)

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

* Build darknet with `make`

* Make your custom .cfg file with these changes:

```
batch=64
subdivisions=16
max_batches=classes*2000
steps=0.8*max_batches,0.9*max_batches
filters=(classes+5)x3   # filters --> before each yolo layer
```

* Download weights/ or models/ with `.sh` scripts

* Place all images and .txt labels in `data/obj`

* Modify `data/obj.data` and `data/obj.names`. Create `train.txt` and `valid.txt` with `data/train_valid_split.py`.
