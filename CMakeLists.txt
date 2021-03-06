cmake_minimum_required(VERSION 2.8)

project(lib_gmock)
  message(STATUS "*** PROJECT_NAME = ${PROJECT_NAME}")

## -fPIC: http://stackoverflow.com/questions/5311515/gcc-fpic-option
## -m32: http://stackoverflow.com/questions/2426478/when-should-m32-option-of-gcc-be-used

# Build x86 binary 
set(CMAKE_CXX_FLAGS "-Wall -Werror -m32 -fPIC") 
set(CMAKE_C_FLAGS "-Wall -Werror -m32 -fPIC") 
set(CMAKE_LIBRARY_PATH ${CMAKE_LIBRARY_PATH} /usr/lib/i386-linux-gnu) # This is important to tell CMAKE to find those 32-bits libraries.

# Build x64 binary 
#set(CMAKE_CXX_FLAGS "-Wall -Werror -m64 -fPIC") 
#set(CMAKE_C_FLAGS "-Wall -Werror -m64 -fPIC") 
#set(CMAKE_LIBRARY_PATH ${CMAKE_LIBRARY_PATH} /usr/lib/x86_64-linux-gnu) # This is important to tell CMAKE to find those 64-bits libraries.

set(lib_gmock_ROOT ${CMAKE_CURRENT_LIST_DIR} CACHE STRING "lib_gmock_ROOT directory")
  message(STATUS "*** lib_gmock_ROOT = ${lib_gmock_ROOT}")
 
set(CMAKE_INCLUDE_CURRENT_DIR ON)

# libgmock 
add_subdirectory(
  ${CMAKE_CURRENT_SOURCE_DIR}/libgmock
  ${CMAKE_CURRENT_BINARY_DIR}/libgmock)

# examples 
if (BUILD_EXAMPLES EQUAL 1) 
  message(STATUS "*** BUILD_EXAMPLES=${BUILD_EXAMPLES}")
  add_subdirectory(
    ${CMAKE_CURRENT_SOURCE_DIR}/examples
    ${CMAKE_CURRENT_BINARY_DIR}/examples)
endif ()

