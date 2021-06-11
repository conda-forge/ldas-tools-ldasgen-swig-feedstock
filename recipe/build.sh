#!/bin/bash

mkdir -p build
pushd build

# configure
cmake \
	${SRC_DIR} \
	${CMAKE_ARGS} \
	-DENABLE_SWIG_PYTHON2=no \
	-DENABLE_SWIG_PYTHON3=no \
;

# build
cmake --build . --parallel ${CPU_COUNT}

# check
ctest --parallel ${CPU_COUNT} --verbose

# install
cmake --build . --target install
cmake --build . --parallel ${CPU_COUNT} --verbose
