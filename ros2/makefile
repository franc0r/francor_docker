image_version=galactic

ros2-base:
	docker build -t franc0r/ros2-base:$(image_version) base

ros2-gui: ros2-base
	docker build -t franc0r/ros2-gui:$(image_version) gui

ros2-francor: ros2-base
	docker build -t franc0r/ros2-francor:$(image_version) francor

ros2-francor-gui: ros2-gui
	docker build -t franc0r/ros2-francor-gui:$(image_version) francor_gui

ros2-francor-dev: ros2-base
	docker build -t franc0r/ros2-francor-dev:$(image_version) francor_dev

ros2-francor-opencv-gui: ros2-gui
	docker build -t franc0r/ros2-francor-opencv-gui:$(image_version) francor_opencv_gui

push: ros2-francor ros2-francor-gui ros2-francor-dev ros2-francor-opencv-gui
	docker push franc0r/ros2-base:$(image_version)
	docker push franc0r/ros2-gui:$(image_version)
	docker push franc0r/ros2-francor:$(image_version)
	docker push franc0r/ros2-francor-gui:$(image_version)
	docker push franc0r/ros2-francor-dev:$(image_version)
	docker push franc0r/ros2-francor-opencv-gui:$(image_version)

all: ros2-francor-dev ros2-francor-gui ros2-francor ros2-francor-opencv-gui
