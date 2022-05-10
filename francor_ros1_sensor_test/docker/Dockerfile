# Dockerfile for generating a docker image running
# ROS kinetic with find 2d object package for hazmat detection

FROM ros:kinetic-perception-xenial

# Update & Upgrade
RUN apt-get -y update \
    && apt-get -y install \
    tmux \
    ros-kinetic-find-object-2d \
    qt4-default \
    libzbar-dev \
    ros-kinetic-usb-cam \
    nano \
    && apt-get clean

# Create location for repository
RUN mkdir /opt/ros/kinetic/src

# Change work directory to ros
WORKDIR /opt/ros/kinetic/src

# Clone git repo for hazmat detection
RUN git clone https://github.com/autonohm/ohm_rrl_perception.git

# Change workdir to folder
WORKDIR /opt/ros/kinetic/src/ohm_rrl_perception

# Checkout branch
RUN git checkout d79e9b7bf56d14d0926423a3f62f66731f016f9c

# Remove unused folders
RUN rm -r ohm_rrl_cdetection 

# Change workdir to ROS
WORKDIR /opt/ros/kinetic

# Set rosmaster
ENV ROS_MASTER=192.168.2.10
ENV ROS_MASTER_URI=http://192.168.2.10:11311/
ENV ROS_HOSTNAME=192.168.2.10
ENV ROS_IP=192.168.2.10

# Build hazmat node
RUN /bin/bash -c 'source setup.bash && catkin_make'

# Copy edited launchfile
COPY launch/camera.launch /opt/ros/kinetic/src/ohm_rrl_perception/ohm_rrl_perception_launch/launch/
COPY launch/hazmat.launch /opt/ros/kinetic/src/ohm_rrl_perception/ohm_rrl_perception_launch/launch/
COPY launch/motion.launch /opt/ros/kinetic/src/ohm_rrl_perception/ohm_rrl_perception_launch/launch/
COPY launch_tmux.sh /

ENV VIDEO_DEVICE="/dev/video0"

# Launch node
CMD /bin/bash -c "(cd / && ./launch_tmux.sh)"
