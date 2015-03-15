# lib_gmock 
This project will build the googletest/googlemock unit test framework from source code,  
libgmock and libgtest will be created, you can link them to your C/C++  projects  

#Environment setup
The develop environment is Ubuntu 14.04 64bit  
Before build please install cmake, gcc, g++, gcc-multilib and g++-multilib  
pthread is for googletest/googlemock working threadsafe  

#Build
USAGE: ./build.sh [shared] [clean]  
Examples:  
```sh
./build.sh                (build static libraries to Build/ folder)
./build.sh shared         (build shared libraries to Build/ folder)
./build.sh clean          (clean Build/ folder)
```

#Run the demo
```sh
TODO.
```

#Other Infomation
  https://code.google.com/p/googletest/  
  https://code.google.com/p/googlemock/  

