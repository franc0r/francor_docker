ros2-base:
	cd ros2 && $(MAKE) -f makefile ros2-base && cd ..

ros2-gui:
	cd ros2 && $(MAKE) -f makefile ros2-gui && cd ..

ros2-francor:
	cd ros2 && $(MAKE) -f makefile ros2-francor && cd ..

ros2-francor-gui:
	cd ros2 && $(MAKE) -f makefile ros2-francor-gui && cd ..

slam:
	cd slam && $(MAKE) -f makefile ros2-slam && cd ..

all: slam ros2-francor-gui ros2-gui
