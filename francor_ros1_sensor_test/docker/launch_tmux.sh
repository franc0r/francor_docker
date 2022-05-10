#!/bin/bash

tmux new-session -d -s roscore '(source /opt/ros/kinetic/devel/setup.bash && roscore)'
sleep 2s
tmux new-session -d -s usb_cam '(source /opt/ros/kinetic/devel/setup.bash && roslaunch ohm_rrl_perception_launch camera.launch)'
sleep 2s
tmux new-session -d -s hazmat '(source /opt/ros/kinetic/devel/setup.bash && roslaunch ohm_rrl_perception_launch hazmat.launch)'
tmux new-session -d -s motion '(source /opt/ros/kinetic/devel/setup.bash && roslaunch ohm_rrl_perception_launch motion.launch)'
