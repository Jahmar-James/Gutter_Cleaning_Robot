# Use the official base image for Ubuntu from Microsoft's dev containers repository
FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Update the package list and install necessary system dependencies
# These include Python3, pip, Git, wget, cmake, ninja-build, ccache, libffi-dev, libssl-dev, dfu-util, libusb-1.0-0, python3-virtualenv, and python3-dev
# Each tool is required for building and flashing firmware for the ESP32 using ESP-IDF and Micro-ROS

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    git \
    wget \
    cmake \
    ninja-build \
    ccache \
    libffi-dev \
    libssl-dev \
    dfu-util \
    libusb-1.0-0 \
    python3-virtualenv \
    python3-dev \
    pip && \
    rm -rf /var/lib/apt/lists/*

# Clone the ESP-IDF repository and install it
RUN git clone --recursive https://github.com/espressif/esp-idf.git /opt/esp-idf && \
    cd /opt/esp-idf && \
    ./install.sh

# Set the IDF_PATH environment variable to the ESP-IDF installation path
ENV IDF_PATH=/opt/esp-idf

# Add ESP-IDF tools to the PATH
ENV PATH="$IDF_PATH/tools:$PATH"

# Install Micro-ROS dependencies and setup workspace
# Micro-ROS provides ROS 2 functionalities to microcontrollers
RUN pip3 install catkin_pkg lark-parser empy colcon-common-extensions && \
    wget https://raw.githubusercontent.com/micro-ROS/micro_ros_setup/foxy/micro_ros_setup/config/uros-esp32.repos && \
    mkdir -p ~/uros_ws/src && \
    vcs import ~/uros_ws/src < uros-esp32.repos && \
    source /opt/ros/foxy/setup.sh && \
    colcon build
