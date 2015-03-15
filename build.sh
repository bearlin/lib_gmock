#!/bin/bash

LIB_TYPE=STATIC

# Remove Build/ for a clean build
for argument in $@
do
  if [ "$argument" == "clean" ]; then
    rm -rf Build
    exit 0;
  fi
  if [ "$argument" == "shared" ]; then
    LIB_TYPE=SHARED
  fi
done

# build
#mkdir -p Build && cd Build && rm -rf && cmake .. && make && cd -
#mkdir -p Build && cd Build && rm -rf && cmake -DLIB_TYPE="$LIB_TYPE" .. && make && cd -
mkdir -p Build && cd Build && rm -rf && cmake -DLIB_TYPE="$LIB_TYPE" -DCMAKE_BUILD_TYPE=Debug .. && make && cd -
