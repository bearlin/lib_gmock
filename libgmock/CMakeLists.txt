project(gmock)
  message(STATUS "*** PROJECT_NAME = ${PROJECT_NAME}")

set(libgmock_ROOT ${CMAKE_CURRENT_LIST_DIR} CACHE STRING "libgmock_ROOT directory")
  #message(STATUS "*** libgmock_ROOT = ${libgmock_ROOT}")

# Definition of the googlemock/googletest include files
set(GOOGLETEST_INCLUDES
	${CMAKE_CURRENT_LIST_DIR}/Interface
	CACHE STRING "googletest API INCLUDES path")
  #message(STATUS "*** using variable 'GOOGLETEST_INCLUDES'=${GOOGLETEST_INCLUDES}")
  
set(GOOGLEMOCK_INCLUDES
	${CMAKE_CURRENT_LIST_DIR}/Interface
	CACHE STRING "googlemock API INCLUDES path")
  #message(STATUS "*** using variable 'GOOGLEMOCK_INCLUDES'=${GOOGLEMOCK_INCLUDES}")

# This is special case because googletest will include .h and .cc files together to a single .cc file
set(GOOGLETEST_INCLUDES_SRC
  ${CMAKE_CURRENT_LIST_DIR}/Implementation/gtest
	CACHE STRING "googletest API INCLUDES path")
  #message(STATUS "*** using variable 'GOOGLETEST_INCLUDES_SRC'=${GOOGLETEST_INCLUDES_SRC}")
  
# This is special case because googlemock will include .h and .cc files together to a single .cc file
set(GOOGLEMOCK_INCLUDES_SRC
	${CMAKE_CURRENT_LIST_DIR}/Implementation/gmock
	CACHE STRING "googlemock API INCLUDES path")
  #message(STATUS "*** using variable 'GOOGLEMOCK_INCLUDES_SRC'=${GOOGLEMOCK_INCLUDES_SRC}")

set(libgtest_API_INCLUDES
    ${GOOGLETEST_INCLUDES}
    ${GOOGLETEST_INCLUDES_SRC}
    CACHE STRING "libgtest_API_INCLUDES path")
  #message(STATUS "*** using variable 'libgtest_API_INCLUDES'=${libgtest_API_INCLUDES}")

set(libgmock_API_INCLUDES
    ${GOOGLEMOCK_INCLUDES}
    ${GOOGLEMOCK_INCLUDES_SRC}
    CACHE STRING "libgmock_API_INCLUDES path")
  #message(STATUS "*** using variable 'libgmock_API_INCLUDES'=${libgmock_API_INCLUDES}")

#Include path
include_directories( 
  ${libgtest_API_INCLUDES} 
  ${libgmock_API_INCLUDES} 
  )

# gtest Source files
file(GLOB GOOGLEMOCK_GTEST_ALL_CPP_FILE ${CMAKE_CURRENT_LIST_DIR}/Implementation/gtest/src/gtest-all.cc)
  #message(STATUS "*** using variable 'GOOGLEMOCK_GTEST_ALL_CPP_FILE'=${GOOGLEMOCK_GTEST_ALL_CPP_FILE}")
file(GLOB GOOGLEMOCK_GTEST_MAIN_CPP_FILE ${CMAKE_CURRENT_LIST_DIR}/Implementation/gtest/src/gtest_main.cc)
  #message(STATUS "*** using variable 'GOOGLEMOCK_GTEST_MAIN_CPP_FILE'=${GOOGLEMOCK_GTEST_MAIN_CPP_FILE}")

# gmock Source files
file(GLOB GOOGLEMOCK_GMOCK_ALL_CPP_FILE ${CMAKE_CURRENT_LIST_DIR}/Implementation/gmock/src/gmock-all.cc)
  #message(STATUS "*** using variable 'GOOGLEMOCK_GMOCK_ALL_CPP_FILE'=${GOOGLEMOCK_GMOCK_ALL_CPP_FILE}")
file(GLOB GOOGLEMOCK_GMOCK_MAIN_CPP_FILE ${CMAKE_CURRENT_LIST_DIR}/Implementation/gmock/src/gmock_main.cc)
  #message(STATUS "*** using variable 'GOOGLEMOCK_GMOCK_MAIN_CPP_FILE'=${GOOGLEMOCK_GMOCK_MAIN_CPP_FILE}")

# On platforms where the pthread library is available, Google Test and Google Mock uses it in order to be thread-safe, more details see gtest-1.7.0/README and gmock-1.7.0/README.
find_library(PTHREAD_LIB pthread)
if (${PTHREAD_LIB} STREQUAL "PTHREAD_LIB-NOTFOUND")
  message(STATUS "*** Not found variable 'PTHREAD_LIB', libgtest and libgmock won't be thread-safe.")
else()
  message(STATUS "*** using variable 'PTHREAD_LIB'=${PTHREAD_LIB}")
endif()

#libgtest.a and libgtest_main.a
add_library(gtest STATIC ${GOOGLEMOCK_GTEST_ALL_CPP_FILE})
target_link_libraries(gtest ${PTHREAD_LIB})
add_library(gtest_main STATIC ${GOOGLEMOCK_GTEST_MAIN_CPP_FILE})
target_link_libraries(gtest_main gtest)

#libgmock.a and libgmock_main.a
add_library(${PROJECT_NAME} STATIC ${GOOGLEMOCK_GMOCK_ALL_CPP_FILE})
target_link_libraries(${PROJECT_NAME} ${PTHREAD_LIB} gtest)
add_library(${PROJECT_NAME}_main STATIC ${GOOGLEMOCK_GMOCK_MAIN_CPP_FILE})
target_link_libraries(${PROJECT_NAME}_main ${PROJECT_NAME})

