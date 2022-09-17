#FROM nvidia/cuda:11.0
#FROM nvidia/cuda:11.7.1-base-ubuntu22.04
# Enable line above to use nvidia gpu support. Please see:
# https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker
FROM franc0r/ros2-base:humble

# Setup environment
ENV ROS_DISTRO humble
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV USER user

########################################################
# Install dependencies
RUN \
    # Update package sources.
    apt-get update \
    # Install ROS desktop.
    && apt-get install -q -y --no-install-recommends \
    ros-$ROS_DISTRO-desktop \
########################################################
# Clean up
    && apt-get clean

# Setup workdir
WORKDIR /home/$USER
