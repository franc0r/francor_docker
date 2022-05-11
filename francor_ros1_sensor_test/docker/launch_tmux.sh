#!/bin/bash

source /opt/ros/kinetic/devel/setup.bash && roslaunch ohm_rrl_perception_launch camera.launch&
sleep 2s
source /opt/ros/kinetic/devel/setup.bash && roslaunch ohm_rrl_perception_launch hazmat.launch&
sleep 2s
source /opt/ros/kinetic/devel/setup.bash && roslaunch ohm_rrl_perception_launch motion.launch
