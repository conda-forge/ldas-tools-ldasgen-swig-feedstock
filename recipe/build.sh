#!/bin/bash

mkdir -p build
pushd build

# configure
cmake ${SRC_DIR} \
	-DCMAKE_INSTALL_PREFIX=${PREFIX} \
	-DCMAKE_BUILD_TYPE=RelWithDebInfo \
	-DENABLE_SWIG_PYTHON2=no \
	-DENABLE_SWIG_PYTHON3=no

# build
cmake --build . --parallel ${CPU_COUNT}

# check
ctest -VV

# install
cmake --build . --target install
