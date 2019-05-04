# Dockerfile for Hazmat Detection

This dockerfile generates a container usable for hazmat detection
The detection is based on the find_object_2d package of ros kinetic.
The hazmat detection is realized via [Autnohm RRL Perception](https://github.com/autonohm/ohm_rrl_perception)

## Setup

Please change the environment variables in the dockerfile to your rosmaster:

```Docker
# Set rosmaster
ENV ROS_MASTER=192.168.2.10
ENV ROS_MASTER_URI=http://192.168.2.10:11311/
```

Take care that you subscriber a correct topic you can change it via the launchfile in docs:

```XML
<node pkg="image_transport" type="republish" name="uncompress" args="compressed in:=/astra/image_raw raw out:=$(arg perception_topic)" /> 

in:=/astra/image_raw <- Replace with your topic
```

After changing the rosmaster and the topic you can build the dockerfile by running:

```
./build_docker_hazmat.sh
``` 

## Usage

Start the docker container via:

``` 
./launch_docker_hazmat.sh
``` 