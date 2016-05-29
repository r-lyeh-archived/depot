#!/bin/bash 

ErrorHandler () {
    exit 1
}
trap ErrorHandler ERR

echo installing...
sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
sudo apt-get update -qq
sudo apt-get install -qq mesa-common-dev freeglut3 freeglut3-dev
sudo apt-get install -qq g++-5 gcc-5 clang-3.7 gcc-multilib

if [ "$CXX" = "g++" ]; then export CXX="g++-5" CC="gcc-5"; fi
if [ "$CXX" = "clang++" ]; then export CXX="clang++-3.7" CC="clang-3.7"; fi

echo building...
$CXX -v

for f in src/*.c;   do [ ! -e "$f" ] && echo || $CC  $f -I. -c                                  -DNDEBUG -O2                       -pthread -fopenmp ; done
for f in src/*.cpp; do [ ! -e "$f" ] && echo || $CXX $f -I. -c             -std=c++11           -DNDEBUG -O2                       -pthread -fopenmp ; done
for f in src/*.cc;  do [ ! -e "$f" ] && echo || $CXX $f -I. -o ${f%.*}.bin -std=c++11 $(ls *.o) -DNDEBUG -O2 -lX11 -lrt -lGL -lGLU -pthread -fopenmp ; done 
for f in src/*.cxx; do [ ! -e "$f" ] && echo || $CXX $f -I. -o ${f%.*}.bin -std=c++11 $(ls *.o) -DNDEBUG -O2 -lX11 -lrt -lGL -lGLU -pthread -fopenmp ; done 

for f in *.c;       do [ ! -e "$f" ] && echo || $CC  $f -I. -c                                  -DNDEBUG -O2                       -pthread -fopenmp ; done
for f in *.cpp;     do [ ! -e "$f" ] && echo || $CXX $f -I. -c             -std=c++11           -DNDEBUG -O2                       -pthread -fopenmp ; done
for f in *.cc;      do [ ! -e "$f" ] && echo || $CXX $f -I. -o ${f%.*}.bin -std=c++11 $(ls *.o) -DNDEBUG -O2 -lX11 -lrt -lGL -lGLU -pthread -fopenmp ; done 
for f in *.cxx;     do [ ! -e "$f" ] && echo || $CXX $f -I. -o ${f%.*}.bin -std=c++11 $(ls *.o) -DNDEBUG -O2 -lX11 -lrt -lGL -lGLU -pthread -fopenmp ; done 


echo building...
$CXX -v

for f in src/*.c;   do [ ! -e "$f" ] && echo || $CC  $f -I. -c                                  -DNDEBUG -O2                       -pthread -fopenmp ; done
for f in src/*.cpp; do [ ! -e "$f" ] && echo || $CXX $f -I. -c             -std=c++11           -DNDEBUG -O2                       -pthread -fopenmp ; done
for f in src/*.cc;  do [ ! -e "$f" ] && echo || $CXX $f -I. -o ${f%.*}.bin -std=c++11 $(ls *.o) -DNDEBUG -O2 -lX11 -lrt -lGL -lGLU -pthread -fopenmp ; done 
for f in src/*.cxx; do [ ! -e "$f" ] && echo || $CXX $f -I. -o ${f%.*}.bin -std=c++11 $(ls *.o) -DNDEBUG -O2 -lX11 -lrt -lGL -lGLU -pthread -fopenmp ; done 

for f in *.c;       do [ ! -e "$f" ] && echo || $CC  $f -I. -c                                  -DNDEBUG -O2                       -pthread -fopenmp ; done
for f in *.cpp;     do [ ! -e "$f" ] && echo || $CXX $f -I. -c             -std=c++11           -DNDEBUG -O2                       -pthread -fopenmp ; done
for f in *.cc;      do [ ! -e "$f" ] && echo || $CXX $f -I. -o ${f%.*}.bin -std=c++11 $(ls *.o) -DNDEBUG -O2 -lX11 -lrt -lGL -lGLU -pthread -fopenmp ; done 
for f in *.cxx;     do [ ! -e "$f" ] && echo || $CXX $f -I. -o ${f%.*}.bin -std=c++11 $(ls *.o) -DNDEBUG -O2 -lX11 -lrt -lGL -lGLU -pthread -fopenmp ; done 
