FROM franc0r/ros2-base:galactic

# Setup environment
ENV ROS_DISTRO galactic
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV USER user

# Use bash to be able to source ros environment.
SHELL ["/bin/bash", "-c"]

########################################################
# Install dependencies
RUN \
    # Build and simulation packages.
    ## Install dependencies.
    apt-get update \
    && apt-get install -q -y --no-install-recommends \
    ros-galactic-interactive-markers \
    ros-galactic-vision-opencv \
    libbox2d-dev \
    libboost-date-time-dev \
    libboost-system-dev \
    libboost-filesystem-dev \
    liblua5.2-dev \
########################################################
# Clean up
    && apt-get clean 

USER $USER
RUN \
    ## Get sources.
    cd \
    && mkdir -p ros2/src \
    && cd ros2/src \
    && git clone --branch ros2-master https://github.com/schmiddey/flatland.git \
    && git clone --branch master https://github.com/schmiddey/simulator_utility.git \
    && cd .. \
    && source /opt/ros/galactic/setup.bash \
    && colcon build \
    && source install/setup.bash

# Setup workdir
WORKDIR /home/$USER/ros2