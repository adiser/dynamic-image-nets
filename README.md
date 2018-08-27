# Dynamic Image Networks for Action Recognition
## Supporting codebase for SAA-Action-Recognition

This codebase comes with a script to implement windowed rank pooling

Example:
For a dataset directory structure such as
```
    data/hmdb51_frames/
    ├── video_frames_k
    │   ├── img_00001.jpg
    │   ├── img_00002.jpg
    │   ├── img_00003.jpg
    │   ├── img_00004.jpg
    │   ├── img_00005.jpg
 ```
Run the following command in MATLAB to apply windowed rank pooling for one video folder
```
    compute_windowed_dynamic_images('data/hmdb51_frames', 'video_frames_k', 1, 10)
```
Run the following command in MATLAB to apply windowed rank pooling for all of the frame folders
```
    save_from_folders('data/hmdb51_frames')
```
To generalize, the instruction would be
```
    compute_windowed_dynamic_images(<PATH TO DATASET>, <PATH TO VIDEO FRAMES>, <STRIDE>, <WINDOW_SIZE>)
    save_from_folders(<PATH TO DATASET>)
```

