#!/bin/bash

# directory path and python file as input parameters
DIRECTORY=$1
PYTHON_FILE=$2

# Check if directory exists
if [ ! -d "$DIRECTORY" ]; then
    echo "Directory $DIRECTORY does not exist."
    exit 1
fi

# Check if python file exists
if [ ! -f "$PYTHON_FILE" ]; then
    echo "Python file $PYTHON_FILE does not exist."
    exit 1
fi

# Record the start time
START_TIME=$(date +%s)

# loop over all .mp4 files in the directory
for VIDEO in "$DIRECTORY"/*.mp4
do
    # strip the .mp4 extension from the video filename
    VIDEO_NAME=$(basename "$VIDEO" .mp4)

    # Add string to end of the video name
    VIDEO_NAME_WITH_SUFFIX="ByteTrack_${VIDEO_NAME}"
    
    # execute python script with video name (without .mp4) as argument
    python "$PYTHON_FILE" --tracking-method bytetrack --yolo-weights /home/user/Documents/yolov5_tracking-8.0-multi-object-counting/yolov5/runs/train/exp2/weights/best.pt --source "$VIDEO" --classes 1 2 --save-vid --device 0 --conf-thres 0.70 --iou-thres 0.20 --imgsz 1920 --save-txt --name "$VIDEO_NAME_WITH_SUFFIX"
done

# Record the end time
END_TIME=$(date +%s)

# Calculate the difference in seconds and print it
ELAPSED_TIME=$((END_TIME - START_TIME))
echo "Total execution time: $ELAPSED_TIME seconds"
