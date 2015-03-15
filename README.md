# lib_gmock 
This project will build the googletest/googlemock unit test framework from source code,  
libgmock and libgtest will be created, you can link them to your C/C++  projects  

#Environment setup
The develop environment is Ubuntu 14.04 64bit  
Before build please install cmake, gcc, g++, gcc-multilib and g++-multilib  
pthread is for googletest/googlemock working threadsafe  

#Build
USAGE: ./build.sh [debug] [shared] [examples] [clean]  
Examples:  
```sh
./build.sh                (build static libraries to Build/ folder)
./build.sh debug          (build debug version)
./build.sh debug examples (build debug version with examples)
./build.sh shared         (build shared libraries to Build/ folder)
./build.sh clean          (clean Build/ folder)
```

#Run the demo
```sh
$ ./Build/examples/gtest/examples_gtest_sample1_unittest
Running main() from gtest_main.cc
[==========] Running 6 tests from 2 test cases.
[----------] Global test environment set-up.
[----------] 3 tests from FactorialTest
[ RUN      ] FactorialTest.Negative
[       OK ] FactorialTest.Negative (0 ms)
[ RUN      ] FactorialTest.Zero
[       OK ] FactorialTest.Zero (0 ms)
[ RUN      ] FactorialTest.Positive
[       OK ] FactorialTest.Positive (0 ms)
[----------] 3 tests from FactorialTest (0 ms total)

[----------] 3 tests from IsPrimeTest
[ RUN      ] IsPrimeTest.Negative
[       OK ] IsPrimeTest.Negative (0 ms)
[ RUN      ] IsPrimeTest.Trivial
[       OK ] IsPrimeTest.Trivial (0 ms)
[ RUN      ] IsPrimeTest.Positive
[       OK ] IsPrimeTest.Positive (0 ms)
[----------] 3 tests from IsPrimeTest (0 ms total)

[----------] Global test environment tear-down
[==========] 6 tests from 2 test cases ran. (0 ms total)
[  PASSED  ] 6 tests.
```

#Other Infomation
  https://code.google.com/p/googletest/  
  https://code.google.com/p/googlemock/  

