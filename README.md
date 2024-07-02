# Multi-object counting in real-time videos

![Demo](https://github.com/Xuehaiz/MultiMap/blob/main/assets/images/demo.gif)

An online multi-object counting method based on [YOLO](https://github.com/ultralytics/yolov5) and tracking-by-detection (i.e., [StrongSORT](https://github.com/dyhBUPT/StrongSORT) and [ByteTrack](https://github.com/ifzhang/ByteTrack)). The tracking implementation is based on [yolo_tracking](https://github.com/mikel-brostrom/yolo_tracking/releases/tag/v8.0).

Contrary to prevalent tracking algorithms, which output Track ID, our MultiMap algorithm maps each Track ID to a counting indicator based on the object class, and writes them to frames.

# Pipeline

![Pipeline](https://github.com/Xuehaiz/MultiMap/blob/main/assets/images/pipeline.jpg)

# Requirements

```
conda create -n yolo_counter python=3.8
conda activate yolo_counter
python -m pip install -r /path/to/requirements.txt
```

# Usage

```sh
python count.py --tracking-method strongsort --source video.mp4 --yolo-weights trained_best.pt --reid-weights osnet_x0_25_msmt17.pt --classes 0 1
```

## If you find our code helpful for your research, please cite

```
@article{zhou2024advancing,
  title={Advancing tracking-by-detection with MultiMap: Towards occlusion-resilient online multiclass strawberry counting},
  author={Zhou, Xuehai and Zhang, Yuyang and Jiang, Xintong and Riaz, Kashif and Rosenbaum, Phil and Lefsrud, Mark and Sun, Shangpeng},
  journal={Expert Systems with Applications},
  year={2024},
  publisher={Elsevier}
}
```

Please contact me ([xuehai.zhou@mail.mcgill.ca](mailto:xuehai.zhou@mail.mcgill.ca)) if you have any questions!
