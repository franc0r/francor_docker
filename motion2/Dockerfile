# Dockerfile for generating a docker image running
# ROS melodic with find 2d object package for hazmat detection

FROM ros:melodic-perception-bionic

MAINTAINER bausma

# Update & Upgrade
RUN apt-get -y update \
    && apt-get -y upgrade

# Install tools
RUN apt-get -y install \
    qt4-default \
    libzbar-dev

# Create location for repository
RUN mkdir /opt/ros/melodic/src

# Change work directory to ros
WORKDIR /opt/ros/melodic/src

# Clone git repo for hazmat detection
RUN git clone https://github.com/autonohm/ohm_rrl_perception.git

# Change workdir to folder
WORKDIR /opt/ros/melodic/src/ohm_rrl_perception

# Checkout branch
RUN git checkout 73ad7163fda8031ace3fab38305ac5344e8289b2

# Remove unused folders
RUN rm -r ohm_rrl_cdetection ohm_rrl_motiondetection ohm_rrl_perception_rqt ohm_rrl_qrdetection

# Change workdir to ROS
WORKDIR /opt/ros/melodic

# Set rosmaster
ENV ROS_MASTER=192.168.2.10
ENV ROS_MASTER_URI=http://192.168.2.10:11311/
ENV ROS_HOSTNAME=192.168.2.10
ENV ROS_IP=192.168.2.10

# Build hazmat node
RUN /bin/bash -c 'source setup.bash && catkin_make'

# Copy edited launchfile
COPY docs/motion2.launch /opt/ros/melodic/src/ohm_rrl_perception/ohm_rrl_motiondetection2/launch

# Launch node
CMD /bin/bash -c "source devel/setup.bash && roslaunch ohm_rrl_motiondetection2 motion2.launch"
