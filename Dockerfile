FROM ubuntu:25.04

ENV DEBIAN_FRONTEND=noninteractive

# Update and install essential tools
RUN apt update && \
    apt upgrade -y && \
    apt install -y \
    build-essential \
    cmake \
    git \
    ninja-build \
    pkg-config \
    sudo \
    curl \
    wget \
    software-properties-common \
    python3 \
    python3-pip \
    qtbase5-dev \
    qtdeclarative5-dev \
    qtquickcontrols2-5-dev \
    qttools5-dev-tools \
    qt5-qmake \
    qtchooser \
    qtbase5-dev-tools \
    libqt5svg5-dev \
    libqt5x11extras5-dev \
    extra-cmake-modules \
    libkf5coreaddons-dev \
    libkf5i18n-dev \
    libkf5config-dev \
    libkf5kio-dev \
    libkf5plasma-dev \
    libkf5widgetsaddons-dev \
    libkf5windowsystem-dev \
    libkf5service-dev \
    libkf5notifications-dev \
    libkf5globalaccel-dev \
    libkf5xmlgui-dev \
    libkf5dbusaddons-dev \
    libxcb1-dev \
    libxcb-xfixes0-dev \
    libxcb-util-dev \
    libxcb-keysyms1-dev \
    libx11-xcb-dev && \
    apt clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /root/SwiftOS-Desktop

# Expose the /build directory to mount files if needed
VOLUME ["/root/SwiftOS-Desktop"]

# Start bash when container runs
CMD ["/bin/bash"]
