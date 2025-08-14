FROM fedora:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV PLASMA_ADDONS_SOURCE_CODE_URL=https://github.com/SwiftOS-Linux/kdeplasma-addons.git

# Update system and install essential development tools
RUN dnf update -y && \
    dnf upgrade -y && \
    dnf install -y \
    git \
    cmake \
    make \
    gcc \
    gcc-c++ \
    clang clang-devel \
    ninja-build \
    sudo \
    curl \
    wget \
    python3 \
    python3-pip \
    python3-devel \
    pkgconf \
    qt5-qtbase-devel \
    qt5-qtdeclarative-devel \
    qt5-qtquickcontrols2-devel \
    qt5-qtsvg-devel \
    qt5-qttools-devel \
    qt5-qtx11extras-devel \
    qtchooser \
    extra-cmake-modules \
    kf5-kconfig-devel \
    kf5-kcoreaddons-devel \
    kf5-kdbusaddons-devel \
    kf5-kglobalaccel-devel \
    kf5-ki18n-devel \
    kf5-kio-devel \
    kf5-knotifications-devel \
    kf5-kservice-devel \
    kf5-kxmlgui-devel \
    kf5-kwidgetsaddons-devel \
    kf5-kwindowsystem-devel \
    kf5-plasma-devel \
    xcb-util-devel \
    xcb-util-keysyms-devel \
    libX11-devel \
    wayland-devel \
    qt5* qt6* \
    autoconf automake \
    fig2dev \
    texinfo \
    wayland-protocols-devel && \
    dnf clean all

RUN dnf update -y

RUN dnf install -y --skip-unavailable \
    kf6-kconfig-devel \
    kf6-kcoreaddons-devel \
    kf6-kdbusaddons-devel \
    kf6-kglobalaccel-devel \
    kf6-ki18n-devel \
    kf6-kio-devel \
    kf6-knotifications-devel \
    kf6-kservice-devel \
    kf6-kxmlgui-devel \
    kf6-kwidgetsaddons-devel \
    kf6-kwindowsystem-devel \
    kf6-plasma-devel \
    kf6-screen-devel \
    kf5-kconfig-devel \
    kf5-kcoreaddons-devel \
    kf5-kdbusaddons-devel \
    kf5-kglobalaccel-devel \
    kf5-ki18n-devel \
    kf5-kio-devel \
    kf5-knotifications-devel \
    kf5-kservice-devel \
    kf5-kxmlgui-devel \
    kf5-kwidgetsaddons-devel \
    kf5-kwindowsystem-devel \
    kf5-plasma-devel \
    kf6-screen-devel

RUN dnf install -y kf6-kauth-devel
RUN dnf install -y kf6-kcrash-devel
RUN dnf install -y kf6-kconfig-devel
RUN dnf install -y kf6-ki18n-devel
RUN dnf install -y kf6-kcmutils-devel
RUN dnf install -y kf6-knewstuff-devel
RUN dnf install -y kf6-kio-devel
RUN dnf install -y kf6-knotifications-devel
RUN dnf install -y kf6-knotifyconfig-devel
RUN dnf install -y kf6-attica-devel
RUN dnf install -y kf6-krunner-devel
RUN dnf install -y kf6-kglobalaccel-devel
RUN dnf install -y kf6-kcoreaddons-devel
RUN dnf install -y kf6-kguiaddons-devel
RUN dnf install -y kf6-kdbusaddons-devel
RUN dnf install -y kf6-kwidgetsaddons-devel
RUN dnf install -y kf6-kcodecs-devel
RUN dnf install -y kf6-sonnet-devel
RUN dnf install -y kf6-kpackage-devel
RUN dnf install -y kf6-kiconthemes-devel
RUN dnf install -y kf6-kxmlgui-devel
RUN dnf install -y kf6-ksvg-devel
RUN dnf install -y plasma* --skip-broken --allowerasing
RUN dnf install -y libwacom-devel*
RUN dnf install -y libzstd-devel*
RUN dnf install -y libxslt-devel
RUN pip3 install    build
RUN dnf install -y libgcrypt-devel
RUN dnf install -y gpgmepp-devel
RUN dnf install -y qca-qt6-devel
RUN dnf install -y libsecret-devel
RUN dnf install -y qrencode qrencode-devel
RUN dnf install -y kwayland-devel wayland-devel
RUN dnf install -y layer-shell-qt-devel
RUN dnf install -y \
    kf6-networkmanager-qt-devel \
    kf6-kquickcharts-devel \
    kf6-kuserfeedback-devel \
    kf6-baloo-devel \
    kwin-devel \
    libqalculate-devel \
    --skip-unavailable
RUN dnf install -y kf6-kholidays-devel
RUN dnf install -y kscreenlocker-devel powerdevil*
RUN dnf install -y phonon-qt6-devel
RUN dnf install -y xdotool
RUN dnf install -y kglobalacceld-devel kf6-kglobalaccel
RUN dnf install -y ksystemstats plasma-systemmonitor libksysguard-devel
RUN dnf install -y libcanberra-devel
RUN dnf install -y qt6-qtbase-devel qt6-qttools-devel polkit-devel
RUN dnf install -y xkeyboard-config-devel
RUN dnf install -y libinput-devel xorg-x11-drv-libinput-devel
RUN dnf install -y xorg-x11-server-devel xorg --skip-unavailable
RUN dnf install -y libxkbfile-devel
RUN dnf install -y kaccounts-integration-devel PackageKit-qt6-devel noto-emoji-fonts --skip-unavailable
RUN dnf install -y qcoro-qt6-devel
RUN sudo dnf install --skip-unavailable \
    kdeplasma-addons \
    baloo-widgets \
    dolphin-plugins \
    ffmpegthumbs \
    kde-inotify-survey \
    kdeconnect-kde \
    kdegraphics-thumbnailers \
    kdenetwork-filesharing \
    kdepim-addons \
    kimageformats \
    kio-admin \
    kio-extras \
    kio-fuse \
    kio-gdrive || echo Skipped

RUN passwd -d root
RUN echo "startplasma-x11" > ~/.xsession
RUN dnf install -y xorg-x11-server-Xorg xorg-x11-xinit xorg-x11-utils xorg-x11-fonts-Type1 --skip-unavailable
RUN dnf install -y xrdp

# Set working directory
WORKDIR /root/SwiftOS-Desktop

# Copy project files
COPY . .

# Get KDE version from CMakeLists.txt
ENV KDE_VERSION=6.15

# Expose the /build directory
VOLUME ["/root/SwiftOS-Desktop"]

# Install Package By Source Code
RUN cd /tmp
# Before install dependencies, for compile KDE Depdencies
RUN wget https://download.kde.org/stable/frameworks/${KDE_VERSION}/syntax-highlighting-${KDE_VERSION}.0.tar.xz
RUN git clone https://github.com/gpg/libgcrypt.git && \
    cd libgcrypt && \
    ./autogen.sh && \
    ./configure --disable-doc && \
    make -j$(nproc) && \
    make install

RUN tar -xf syntax-highlighting-${KDE_VERSION}.0.tar.xz
RUN cd syntax-highlighting-${KDE_VERSION}.0 && cmake -B build && cd build && make -j$(nproc) && make install
RUN cd /tmp/ && rm -rf /tmp/*

# Skip archive package as it's not available
RUN wget https://download.kde.org/stable/frameworks/${KDE_VERSION}/prison-${KDE_VERSION}.0.tar.xz || true
RUN wget https://download.kde.org/stable/frameworks/${KDE_VERSION}/kwallet-${KDE_VERSION}.0.tar.xz || true
RUN wget https://download.kde.org/stable/frameworks/${KDE_VERSION}/kdoctools-${KDE_VERSION}.0.tar.xz
RUN wget https://download.kde.org/stable/frameworks/${KDE_VERSION}/kunitconversion-${KDE_VERSION}.0.tar.xz
RUN wget https://download.kde.org/stable/frameworks/${KDE_VERSION}/kstatusnotifieritem-${KDE_VERSION}.0.tar.xz
RUN wget https://download.kde.org/stable/frameworks/${KDE_VERSION}/ktexteditor-${KDE_VERSION}.0.tar.xz
RUN git clone --branch v6.3.90 https://invent.kde.org/plasma/libkscreen.git
RUN git clone https://invent.kde.org/plasma/knighttime.git
RUN git clone https://invent.kde.org/plasma/layer-shell-qt.git && \
    cd layer-shell-qt && \
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_EXAMPLES=OFF \
        -DQT_MAJOR_VERSION=6 && \
    cd build && \
    make -j$(nproc) && \
    make install

RUN git clone https://invent.kde.org/libraries/polkit-qt-1.git && \
    cd polkit-qt-1 && \
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_EXAMPLES=OFF \
        -DQT_MAJOR_VERSION=6 && \
    cd build && \
    make -j$(nproc) && \
    make install

RUN cd /tmp

# Build all missing KF6 components BEFORE plasma-workspace
RUN wget https://download.kde.org/stable/frameworks/${KDE_VERSION}/karchive-${KDE_VERSION}.0.tar.xz && \
    tar -xf karchive-${KDE_VERSION}.0.tar.xz && \
    cd karchive-${KDE_VERSION}.0 && \
    cmake -B build && \
    cd build && \
    make -j$(nproc) && \
    make install

RUN wget https://download.kde.org/stable/frameworks/${KDE_VERSION}/kdeclarative-${KDE_VERSION}.0.tar.xz && \
    tar -xf kdeclarative-${KDE_VERSION}.0.tar.xz && \
    cd kdeclarative-${KDE_VERSION}.0 && \
    cmake -B build && \
    cd build && \
    make -j$(nproc) && \
    make install

RUN wget https://download.kde.org/stable/frameworks/${KDE_VERSION}/kitemmodels-${KDE_VERSION}.0.tar.xz && \
    tar -xf kitemmodels-${KDE_VERSION}.0.tar.xz && \
    cd kitemmodels-${KDE_VERSION}.0 && \
    cmake -B build && \
    cd build && \
    make -j$(nproc) && \
    make install

RUN wget https://download.kde.org/stable/frameworks/${KDE_VERSION}/kparts-${KDE_VERSION}.0.tar.xz && \
    tar -xf kparts-${KDE_VERSION}.0.tar.xz && \
    cd kparts-${KDE_VERSION}.0 && \
    cmake -B build && \
    cd build && \
    make -j$(nproc) && \
    make install

RUN wget https://download.kde.org/stable/frameworks/${KDE_VERSION}/ktextwidgets-${KDE_VERSION}.0.tar.xz && \
    tar -xf ktextwidgets-${KDE_VERSION}.0.tar.xz && \
    cd ktextwidgets-${KDE_VERSION}.0 && \
    cmake -B build && \
    cd build && \
    make -j$(nproc) && \
    make install

RUN wget https://download.kde.org/stable/frameworks/${KDE_VERSION}/kunitconversion-${KDE_VERSION}.0.tar.xz && \
    tar -xf kunitconversion-${KDE_VERSION}.0.tar.xz && \
    cd kunitconversion-${KDE_VERSION}.0 && \
    cmake -B build && \
    cd build && \
    make -j$(nproc) && \
    make install

# Add remaining missing KF6 components
RUN wget https://download.kde.org/stable/frameworks/${KDE_VERSION}/kwallet-${KDE_VERSION}.0.tar.xz && \
    tar -xf kwallet-${KDE_VERSION}.0.tar.xz && \
    cd kwallet-${KDE_VERSION}.0 && \
    cmake -B build && \
    cd build && \
    make -j$(nproc) && \
    make install

RUN wget https://download.kde.org/stable/frameworks/${KDE_VERSION}/kstatusnotifieritem-${KDE_VERSION}.0.tar.xz && \
    tar -xf kstatusnotifieritem-${KDE_VERSION}.0.tar.xz && \
    cd kstatusnotifieritem-${KDE_VERSION}.0 && \
    cmake -B build && \
    cd build && \
    make -j$(nproc) && \
    make install

RUN wget https://download.kde.org/stable/frameworks/${KDE_VERSION}/kidletime-${KDE_VERSION}.0.tar.xz && \
    tar -xf kidletime-${KDE_VERSION}.0.tar.xz && \
    cd kidletime-${KDE_VERSION}.0 && \
    cmake -B build && \
    cd build && \
    make -j$(nproc) && \
    make install

RUN wget https://download.kde.org/stable/frameworks/${KDE_VERSION}/kded-${KDE_VERSION}.0.tar.xz && \
    tar -xf kded-${KDE_VERSION}.0.tar.xz && \
    cd kded-${KDE_VERSION}.0 && \
    cmake -B build && \
    cd build && \
    make -j$(nproc) && \
    make install

RUN wget https://download.kde.org/stable/frameworks/${KDE_VERSION}/prison-${KDE_VERSION}.0.tar.xz && \
    tar -xf prison-${KDE_VERSION}.0.tar.xz && \
    cd prison-${KDE_VERSION}.0 && \
    cmake -B build && \
    cd build && \
    make -j$(nproc) && \
    make install

RUN wget https://download.kde.org/stable/frameworks/${KDE_VERSION}/ktexteditor-${KDE_VERSION}.0.tar.xz && \
    tar -xf ktexteditor-${KDE_VERSION}.0.tar.xz && \
    cd ktexteditor-${KDE_VERSION}.0 && \
    cmake -B build && \
    cd build && \
    make -j$(nproc) && \
    make install

# Build libkscreen (KF6Screen)
RUN cd libkscreen && \
    cmake -B build && \
    cd build && \
    make -j$(nproc) && \
    make install

# Install missing X11 and XCB components before plasma-workspace
RUN dnf install -y libICE-devel libSM-devel xcb-util-cursor-devel xcb-util-image-devel --skip-unavailable

# Build KNightTime before plasma-workspace
RUN cd knighttime && \
    cmake -B build && \
    cd build && \
    make -j$(nproc) && \
    make install

# Now build plasma-workspace with all dependencies available
RUN git clone https://github.com/SwiftOS-Linux/plasma-workspace.git && \
    cd plasma-workspace && \
    mkdir build && \
    cd build && \
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -Dkglobalacceld_PATH=/usr/libexec/ -DCMAKE_BUILD_TYPE=Release && \
    make -j$(nproc) && \
    make install

RUN cd /root/
RUN git clone ${PLASMA_ADDONS_SOURCE_CODE_URL} && \
    cd kdeplasma-addons && \
    mkdir build && \
    cd build && \
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release && \
    make -j$(nproc) && \
    make install

RUN cd /root/SwiftOS-Desktop

# Install additional build dependencies
RUN dnf install -y kf6-kdoctools-devel accounts-qt6-devel kaccounts-integration-devel --skip-unavailable

# Install missing X11 and XCB components
RUN dnf install -y libICE-devel libSM-devel xcb-util-cursor-devel xcb-util-image-devel --skip-unavailable
RUN sudo sed -i 's/port=3389/port=3390/g' /etc/xrdp/xrdp.ini
RUN sudo echo "startplasma-x11" >> /etc/xrdp/startwm.sh
RUN sudo dnf -y install x11vnc
RUN sudo xrdp

RUN cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release || true

EXPOSE 3390

# Start bash by default
CMD ["/bin/bash"]