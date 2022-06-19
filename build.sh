#!/bin/bash
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 [arm-linux-gnueabihf | aarch64-linux-gnu] [orocos_kdl branch]" >&2
  exit 1
fi

##
# Download lib with right version
##
git clone https://github.com/orocos/orocos_kinematics_dynamics.git
cd orocos_kinematics_dynamics
git checkout $2
cd orocos_kdl

##
# Cleanup
##
rm -r build 
rm -r install
mkdir build
mkdir install
cd build

##
# Build
##
cmake .. -D CMAKE_INSTALL_PREFIX=../install -D CMAKE_C_COMPILER=$1-gcc -D CMAKE_CXX_COMPILER=$1-g++
make -j$(nproc) install
cd ../install

##
# Create package
##
ARCHITECTURE='armhf'
if [[ "$1" == *"aarch64"* ]]; then
  ARCHITECTURE='arm64'
fi
NAME=liborocos-kdl-dev-$2-$(date '+%Y-%m-%d')-$ARCHITECTURE
mkdir $NAME 
cd $NAME
mkdir usr
cp -r ../include usr/
cp -r ../lib usr/
cp -r ../share usr/
mkdir DEBIAN
cd DEBIAN
echo "Package: $NAME
Version: ${2:1} 
Architecture: $ARCHITECTURE
Maintainer: Jonas Wühr 
Depends: libeigen3-dev 
Homepage: https://github.com/107-systems 
Description: 107-Systems kdl cross pkg." &> control
cd ../../
sudo chown root:root -R $NAME 
dpkg-deb --build $NAME
cd ../../../
cp orocos_kinematics_dynamics/orocos_kdl/install/*.deb .
