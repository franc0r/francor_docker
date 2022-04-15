FROM osrf/ros2:nightly

# Create workspace
RUN mkdir -p /opt/ros2_ws/src \
    && mkdir -p /opt/francor/

# Install dependencies
RUN apt update \
    && apt install -q -y --no-install-recommends \
    libflann-dev \
    can-utils \
    nano \
    && rm -rf /var/lib/apt/lists/*

# Install francor library
RUN git clone --branch feat/rmd_x8_drives https://github.com/franc0r/libfrancor.git /opt/francor/libfrancor \
    && mkdir -p /opt/francor/libfrancor/build \
    && (cd /opt/francor/libfrancor/build && cmake -D BUILD_OPENCV_COMPONENTS=Off -D BUILD_EXAMPLES=Off .. && make && make install) \
    && rm -r /opt/francor/libfrancor/build

WORKDIR /opt/ros2_ws/

