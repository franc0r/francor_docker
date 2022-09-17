FROM ubuntu:jammy

# Setup environment
ENV UBUNTU_DISTRO jammy
ENV ROS_DISTRO humble
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV USER user

########################################################
# Install dependencies
RUN \
    # Update package sources.
    apt-get update \
    # Install tzdate, because it requires special attention.
    && echo 'Etc/UTC' > /etc/timezone \
    && ln -s /usr/share/zoneinfo/Etc/UTC /etc/localtime \
    && apt-get install -q -y --no-install-recommends tzdata \
    # Install basic and general development stuff.
    && apt-get install -q -y --no-install-recommends \
    apt-utils \
    software-properties-common \
    nano \
    curl \
    gnupg \
    git \
    build-essential \
    sudo \
########################################################
# Install ROS
## Get package archive key and ROS source list entry.
    && curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg \
    && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $UBUNTU_DISTRO main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null \
    && apt-get update \
########################################################
# Install ROS packages
    && apt-get install -q -y --no-install-recommends \
    ros-$ROS_DISTRO-ros-base \
    python3-colcon-common-extensions \
# Install image transport
    ros-$ROS_DISTRO-usb-cam \
    ros-$ROS_DISTRO-image-transport \
    ros-$ROS_DISTRO-image-transport-plugins \
########################################################
# Add non root user for development
    && useradd --create-home --shell /bin/bash $USER \
    && echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && /sbin/usermod -aG sudo $USER \
########################################################
# Add line for sourcing ROS environment.
    && echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> /home/$USER/.bashrc \
########################################################
# Clean up
    && apt-get clean

ENV RMW_IMPLEMENTATION=rmw_fastrtps_cpp

# Setup workdir
WORKDIR /home/$USER

