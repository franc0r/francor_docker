FROM franc0r/ros2-francor-gui:galactic

RUN apt-get update \
    && apt-get install -y \
    unzip wget build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev \
    python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev \
    && apt-get clean

RUN (cd /root/ && wget -q https://github.com/opencv/opencv/archive/refs/tags/4.2.0.tar.gz && tar -xvf 4.2.0.tar.gz && rm 4.2.0.tar.gz) \
    && (cd /root/ && wget -q https://github.com/opencv/opencv_contrib/archive/4.2.0.tar.gz && tar -xvf 4.2.0.tar.gz && rm 4.2.0.tar.gz)

RUN mkdir -p /root/opencv-4.2.0/build
WORKDIR /root/opencv-4.2.0/build    

RUN cmake \
    -DOPENCV_ENABLE_NONFREE:BOOL=ON \
    -D WITH_VTK=Off \
    -DBUILD_SHARED_LIBS=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr/local \
    -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-4.2.0/modules ..
RUN make -j 12 
