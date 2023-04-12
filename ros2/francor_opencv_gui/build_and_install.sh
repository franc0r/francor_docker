#/bin/sh

cmake \
    -DOPENCV_ENABLE_NONFREE:BOOL=ON \
    -DOPENCV_EXTRA_MODULES_PATH=../opencv_contrib-4.7.0/modules \
    -DWITH_VTK=Off \
    -DBUILD_SHARED_LIBS=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DOPENCV_PYTHON3_INSTALL_PATH=$(python3 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") \
    -DPYTHON_EXECUTABLE=$(which python3) \
    ../opencv-4.7.0

make -j 12
make install