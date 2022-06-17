#!/bin/bash

git clone https://github.com/orocos/orocos_kinematics_dynamics.git
cd orocos_kinematics_dynamics
git checkout $1
rm -r build 
rm -r install
mkdir build
mkdir install
cd build
cmake .. -D CMAKE_INSTALL_PREFIX=../install -D CMAKE_C_COMPILER=$1-gcc -D CMAKE_CXX_COMPILER=$1-g++
make -j$(nproc) install
cd ../install
mkdir kdl-107-$1
cd kdl-107-$1
mkdir usr
cp -r ../include usr/
cp -r ../lib usr/
cp -r ../share usr/
mkdir DEBIAN
cd DEBIAN
echo "Package: kdl-107-$1
Version: 0.3.13
Architecture: all
Maintainer: John Doe<your-email@gmail.com>
Depengs:
Homepage: https://github.com/shinokada/tera
Description: 107-Systems kdl cross pkg." &> control
cd ../../
sudo chown root:root -R kdl-107-$1
dpkg-deb --build kdl-107-$1
cd ../../../
cp orocos_kinematics_dynamics/orocos_kdl/install/*.deb .
