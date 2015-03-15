#!/bin/bash

# Default build settings
BUILD_TYPE="-DCMAKE_BUILD_TYPE=Release"
LIB_TYPE="-DLIB_TYPE=STATIC"
BUILD_EXAMPLES="-DBUILD_EXAMPLES=0"

# Update build settings
for argument in $@
do
  if [ "$argument" == "clean" ]; then
    rm -rf Build
    exit 0;
  fi
  if [ "$argument" == "debug" ]; then
    BUILD_TYPE="-DCMAKE_BUILD_TYPE=Debug"
  fi
  if [ "$argument" == "shared" ]; then
    LIB_TYPE="-DLIB_TYPE=SHARED"
  fi
  if [ "$argument" == "examples" ]; then
    BUILD_EXAMPLES="-DBUILD_EXAMPLES=1"
  fi
done

# build
echo "BUILD_TYPE=$BUILD_TYPE"
echo "LIB_TYPE=$LIB_TYPE"
echo "BUILD_EXAMPLES=$BUILD_EXAMPLES"
mkdir -p Build && cd Build && rm -rf && cmake $BUILD_TYPE $LIB_TYPE $BUILD_EXAMPLES .. && make && cd -

