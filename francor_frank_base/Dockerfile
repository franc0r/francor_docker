FROM franc0r/ros2-base:galactic

RUN (cd src && git clone https://github.com/franc0r/francor_frank_base.git) \
    && /bin/bash -c "source /opt/ros/$ROS_DISTRO/setup.bash && colcon build"


CMD ["ros2 launch francor_frank_base frank.py"]