project(gmock)
  #message(STATUS "*** PROJECT_NAME = ${PROJECT_NAME}")

set(libgmock_ROOT ${CMAKE_CURRENT_LIST_DIR} CACHE STRING "libgmock_ROOT directory")
  #message(STATUS "*** libgmock_ROOT = ${libgmock_ROOT}")

# Definition of the googlemock/googletest include files
set(GOOGLETEST_INCLUDES
  ${CMAKE_CURRENT_LIST_DIR}/Interface
  CACHE STRING "googletest API INCLUDES path")

set(GOOGLEMOCK_INCLUDES
  ${CMAKE_CURRENT_LIST_DIR}/Interface
  CACHE STRING "googlemock API INCLUDES path")

# This is special case because googletest will include .h and .cc files together to a single .cc file
set(GOOGLETEST_INCLUDES_SRC
  ${CMAKE_CURRENT_LIST_DIR}/Implementation/gtest
  CACHE STRING "googletest API INCLUDES path")

# This is special case because googlemock will include .h and .cc files together to a single .cc file
set(GOOGLEMOCK_INCLUDES_SRC
  ${CMAKE_CURRENT_LIST_DIR}/Implementation/gmock
  CACHE STRING "googlemock API INCLUDES path")

set(libgtest_API_INCLUDES
  ${GOOGLETEST_INCLUDES}
  ${GOOGLETEST_INCLUDES_SRC}
  CACHE STRING "libgtest_API_INCLUDES path")

set(libgmock_API_INCLUDES
  ${GOOGLEMOCK_INCLUDES}
  ${GOOGLEMOCK_INCLUDES_SRC}
  CACHE STRING "libgmock_API_INCLUDES path")

#Include path
include_directories(
  ${libgtest_API_INCLUDES}
  ${libgmock_API_INCLUDES}
  )

# gtest Source files
file(GLOB GOOGLEMOCK_GTEST_ALL_CPP_FILE ${CMAKE_CURRENT_LIST_DIR}/Implementation/gtest/src/gtest-all.cc)
file(GLOB GOOGLEMOCK_GTEST_MAIN_CPP_FILE ${CMAKE_CURRENT_LIST_DIR}/Implementation/gtest/src/gtest_main.cc)

# gmock Source files
file(GLOB GOOGLEMOCK_GMOCK_ALL_CPP_FILE ${CMAKE_CURRENT_LIST_DIR}/Implementation/gmock/src/gmock-all.cc)
file(GLOB GOOGLEMOCK_GMOCK_MAIN_CPP_FILE ${CMAKE_CURRENT_LIST_DIR}/Implementation/gmock/src/gmock_main.cc)

# On platforms where the pthread library is available, Google Test and Google Mock uses it in order to be thread-safe, more details see gtest-1.7.0/README and gmock-1.7.0/README.
find_library(PTHREAD_LIB pthread)
if (${PTHREAD_LIB} STREQUAL "PTHREAD_LIB-NOTFOUND")
  message(STATUS "*** Not found variable 'PTHREAD_LIB', libgtest and libgmock won't be thread-safe.")
else()
  message(STATUS "*** using variable 'PTHREAD_LIB'=${PTHREAD_LIB}")
endif()

# Determine LIB_TYPE
  message(STATUS "*** ori LIB_TYPE=${LIB_TYPE}")
if (LIB_TYPE) 
  if((NOT ${LIB_TYPE} STREQUAL "STATIC") AND (NOT ${LIB_TYPE} STREQUAL "SHARED"))
    set(LIB_TYPE "STATIC")
  endif()
else()
  set(LIB_TYPE "STATIC")
endif()
  message(STATUS "*** LIB_TYPE=${LIB_TYPE}")

# Create gtest libraries
add_library(gtest ${LIB_TYPE} ${GOOGLEMOCK_GTEST_ALL_CPP_FILE})
target_link_libraries(gtest ${PTHREAD_LIB})
add_library(gtest_main ${LIB_TYPE} ${GOOGLEMOCK_GTEST_MAIN_CPP_FILE})
target_link_libraries(gtest_main gtest)

# Create gmock libraries
add_library(${PROJECT_NAME} ${LIB_TYPE} ${GOOGLEMOCK_GMOCK_ALL_CPP_FILE})
target_link_libraries(${PROJECT_NAME} ${PTHREAD_LIB} gtest)
add_library(${PROJECT_NAME}_main ${LIB_TYPE} ${GOOGLEMOCK_GMOCK_MAIN_CPP_FILE})
target_link_libraries(${PROJECT_NAME}_main ${PROJECT_NAME})

