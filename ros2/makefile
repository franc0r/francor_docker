image_version=galactic

ros2-base:
	docker build -t franc0r/ros2-base:$(image_version) base

ros2-gui: ros2-base
	docker build -t franc0r/ros2-gui:$(image_version) gui

ros2-francor: ros2-base
	docker build -t franc0r/ros2-francor:$(image_version) francor

ros2-francor-gui: ros2-gui
	docker build -t franc0r/ros2-francor-gui:$(image_version) francor_gui

all: ros2-francor-gui ros2-francor
