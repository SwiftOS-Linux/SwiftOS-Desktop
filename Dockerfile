FROM neon/kf5:latest

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
    python3-pip

# Install Qt5 development packages
RUN apt install -y \
    qtbase5-dev \
    qtdeclarative5-dev \
    qtquickcontrols2-5-dev \
    qttools5-dev-tools \
    qt5-qmake \
    qtchooser \
    qtbase5-dev-tools \
    libqt5svg5-dev \
    libqt5x11extras5-dev

# Install KDE Frameworks libraries
RUN apt install -y \
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
    libkf5dbusaddons-dev

# Install XCB/X11 dependencies
RUN apt install -y \
    libxcb1-dev \
    libxcb-xfixes0-dev \
    libxcb-util-dev \
    libxcb-keysyms1-dev \
    libx11-xcb-dev

# Clean up to reduce image size
RUN apt clean && rm -rf /var/lib/apt/lists/*
WORKDIR /build

CMD ["/bin/bash"]
