FROM franc0r/ros2-francor-gui:humble

# Install dependencies
RUN apt-get update \
    && apt-get install -y \
        wget unzip python3-numpy \
        libeigen3-dev libgtk-3-dev \
        ffmpeg libavcodec-dev libavformat-dev libswscale-dev \
        libgstreamer1.0-0 libgstreamer1.0-dev \
        libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev \
        gstreamer1.0-plugins-base gstreamer1.0-plugins-bad gstreamer1.0-libav gstreamer1.0-plugins-good \
        gstreamer1.0-plugins-ugly gstreamer1.0-vaapi gstreamer1.0-tools \
    && apt-get clean

# Download and unpack OpenCV
COPY build_and_install.sh /opt/OpenCV/build/build_and_install.sh
RUN mkdir -p /opt/OpenCV/build \
    && wget -O /opt/OpenCV/opencv.zip https://github.com/opencv/opencv/archive/refs/tags/4.7.0.zip \
    && wget -O /opt/OpenCV/opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/refs/tags/4.7.0.zip \
    && /bin/bash -c "cd /opt/OpenCV && unzip opencv.zip" \
    && /bin/bash -c "cd /opt/OpenCV && unzip opencv_contrib.zip" \
    && rm /opt/OpenCV/opencv.zip /opt/OpenCV/opencv_contrib.zip  \
    && /bin/bash -c "cd /opt/OpenCV/build && ./build_and_install.sh" \
    && rm -rf /opt/OpenCV/build
