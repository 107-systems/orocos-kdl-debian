FROM ros:noetic-ros-core-focal

WORKDIR /usr/app

USER root

RUN apt-get -y update
RUN apt-get -y install gcc-aarch64-linux-gnu g++-aarch64-linux-gnu
RUN apt-get -y install git 
RUN apt-get -y install build-essential libeigen3-dev

