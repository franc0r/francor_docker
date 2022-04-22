FROM francor/ros2:base

# Setup environment
ENV ROS_DISTRO galactic
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV USER user

# Install francor library
RUN \
    # Install dependencies for francor related stuff.
    apt-get update \
    && apt-get install -q -y --no-install-recommends \
    libflann-dev \
    can-utils \
    # Get source of libfrancor, build and install it.
    && git clone --branch feat/rmd_x8_drives https://github.com/franc0r/libfrancor.git /opt/francor/libfrancor \
    && mkdir -p /opt/francor/libfrancor/build \
    && (cd /opt/francor/libfrancor/build && cmake -D BUILD_OPENCV_COMPONENTS=Off -D BUILD_EXAMPLES=Off .. && make && make install) \
    && rm -r /opt/francor/libfrancor/build

# Setup workdir
WORKDIR /home/$USER