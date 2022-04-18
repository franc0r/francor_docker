FROM ubuntu:focal

# Setup environment
ENV ROS_DISTRO galactic
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# Setup timezone
RUN echo 'Etc/UTC' > /etc/timezone && \
    ln -s /usr/share/zoneinfo/Etc/UTC /etc/localtime && \
    apt-get update && \
    apt-get install -q -y --no-install-recommends tzdata && \
    rm -rf /var/lib/apt/lists/*

# Create workspace
RUN mkdir -p /opt/ros2_ws/src \
    && mkdir -p /opt/francor/

# Install dependencies
RUN apt-get update \
    && apt-get install -q -y --no-install-recommends \
    software-properties-common \
    libflann-dev \
    can-utils \
    nano \
    curl \
    gnupg \
    git \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install repo
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg \
    && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu focal main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null


# Install ROS
RUN apt-get update \
   && apt-get install -q -y ros-galactic-ros-base \
   python3-colcon-common-extensions \
   && rm -rf /var/lib/apt/lists/*

# Install francor library
RUN git clone --branch feat/rmd_x8_drives https://github.com/franc0r/libfrancor.git /opt/francor/libfrancor \
    && mkdir -p /opt/francor/libfrancor/build \
    && (cd /opt/francor/libfrancor/build && cmake -D BUILD_OPENCV_COMPONENTS=Off -D BUILD_EXAMPLES=Off .. && make && make install) \
    && rm -r /opt/francor/libfrancor/build

WORKDIR /opt/ros2_ws/

