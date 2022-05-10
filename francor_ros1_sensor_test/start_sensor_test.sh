#!/bin/bash
#video_link=$(readlink -f /dev/v4l/by-path/pci-0000:00:14.0-usb-0:4.3:1.0-video-index0)
video_link=/dev/video0
echo "Used video device $video_link"
docker run -it --rm --net=host --pid=host --privileged --env VIDEO_DEVICE=$video_link --device=$video_link --name francor_ros1_sensor_test franc0r/ros1-sensor-test
