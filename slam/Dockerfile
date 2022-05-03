FROM franc0r/ros2-base:galactic

# Setup environment
ENV ROS_DISTRO galactic
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV USER user

SHELL ["/bin/bash", "-c"]

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
    libxml++2.6-dev \
    liblua5.1-dev \
    libopenni-dev \
    libudev-dev \
    freeglut3-dev \
    libboost-thread-dev \
    ## Get sources.
    && cd /tmp \
    && git clone --branch master https://github.com/autonohm/obviously.git \
    && cd obviously/build/release \
    ## Only build needed modules.
    && sed -i 's+ADD_SUBDIRECTORY(../../obdevice obdevice)+#ADD_SUBDIRECTORY(../../obdevice obdevice)+g' CMakeLists.txt \
    && sed -i 's+ADD_SUBDIRECTORY(../../applications applications)+#ADD_SUBDIRECTORY(../../applications applications)+g' CMakeLists.txt \
    && export OBVIOUSLY_ROOT=/tmp/obviously \
    && cmake . -DCMAKE_BUILD_TYPE=Release \
    && make -j8 \
    ## Install library
    && make install \
    && cp ../../obcore/base/System.inl /usr/local/usr/include/obviously/obcore/base/ \
########################################################
# Clean up
    && apt-get clean \
    && rm /tmp/obviously -rf

USER $USER
RUN \
    # Build slam package.
    cd \
    && mkdir -p ros2/src \
    && cd ros2/src \
    && git clone --branch feature/ros2 https://github.com/franc0r/ohm_tsd_slam.git \
    && cd .. \
    && source /opt/ros/$ROS_DISTRO/setup.bash \
    && colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release \
    && source install/setup.bash

# Setup workdir
WORKDIR /home/$USER
