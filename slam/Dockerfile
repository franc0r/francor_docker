FROM francor/ros2/base:1.0

# Setup environment
ENV ROS_DISTRO galactic
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV USER user

########################################################
# Install dependencies
RUN \
    # Build and install libobviously.
    ## Install dependencies.
    apt-get update \
    && apt-get install -q -y --no-install-recommends \
    libgsl-dev \
    libgslcblas0 \
    libann-dev \
    libflann-dev \
    libvtk6-dev \
    ## Get sources.
    && cd /tmp \
    && git clone https://github.com/autonohm/obviously.git \
    && cd obviously \
    && export OBVIOUSLY_ROOT=/tmp/obviously \
    && cmake build/release -DCMAKE_BUILD_TYPE=Release \
    && make -j8 \
    && make install \
########################################################
# Clean up
    && apt-get clean \
    && rm /tmp/obviously -rf

# Setup workdir
WORKDIR /home/$USER

