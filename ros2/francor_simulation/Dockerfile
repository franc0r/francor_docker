FROM franc0r/ros2-gui:humble

# Setup environment
ENV ROS_DISTRO humble
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV USER user

# Install francor library
RUN \
    # Install dependencies for francor related stuff.
    apt-get update \
    && apt-get install -q -y --no-install-recommends \
    ros-$ROS_DISTRO-gazebo-ros-pkgs

# Setup workdir
WORKDIR /home/$USER