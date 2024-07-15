# Start with the micro-ROS base image
FROM microros/base:jazzy

# Update the package list and install necessary system dependencies
# These include Python3, pip, Git, wget, cmake, ninja-build, ccache, libffi-dev, libssl-dev, dfu-util, libusb-1.0-0, python3-virtualenv, and python3-dev
# Each tool is required for building and flashing firmware for the ESP32 using ESP-IDF and Micro-ROS

RUN apt-get update && apt-get install -y \
    python3 \
    git \
    wget \
    python3-dev \
    python3-setuptools \
    python3-venv \
    python3-pip \
    python3-virtualenv \
    curl \
    python3-rosdep\
    cmake \
    flex \
    bison \
    ccache \
    gperf \
    ninja-build \
    dfu-util \
    libffi-dev \
    libssl-dev \
    libusb-1.0-0 \
    tmux \
    gdb \
    valgrind \
    libcurl4-openssl-dev \
    libasio-dev\
    && rm -rf /var/lib/apt/lists/* 

COPY requirements.txt .
# Virtual Python environment to avoid conflicts with system packages
RUN python3 -m venv /opt/venv \
    && . /opt/venv/bin/activate \
    && pip install --upgrade pip \
    pip install -r requirements.txt
ENV PATH="/opt/venv/bin:$PATH"
    
# Install ESP-IDF
ENV IDF_PATH="/opt/esp-idf"
RUN mkdir -p ${IDF_PATH}
ENV IDF_TOOLS_PATH="/opt/esp"
ENV PATH="$IDF_PATH/tools:$PATH"

# Ensure the aliases are sourced in all shell sessions
COPY embedded_dev_shortcuts.sh /etc/profile.d/embedded_dev_shortcuts.sh
RUN echo 'source /etc/profile.d/embedded_dev_shortcuts.sh' >> ~/.bashrc

