FROM fedora:latest

ENV DEBIAN_FRONTEND=noninteractive

# Update system and install essential development tools
RUN dnf update -y && \
    dnf upgrade -y && \
    dnf install -y \
    git \
    cmake \
    make \
    gcc \
    gcc-c++ \
    ninja-build \
    sudo \
    curl \
    wget \
    python3 \
    python3-pip \
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
    wayland-protocols-devel && \
    dnf clean all

RUN dnf install 'dnf-command(config-manager)'
RUN dnf config-manager --add-repo https://download.copr.fedorainfracloud.org/results/heiko/KDE-SIG-Frameworks-6.0-stable/fedora-40-x86_64/heiko-KDE-SIG-Frameworks-6.0-stable.repo
RUN dnf update
RUN dnf install -y \
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
    kf6-plasma-devel

RUN dnf5 install -y kf6-kauth-devel || echo "kf6-kauth-devel not found"
RUN dnf5 install -y kf6-kcrash-devel || echo "kf6-kcrash-devel not found"
RUN dnf5 install -y kf6-kconfig-devel || echo "kf6-kconfig-devel not found"
RUN dnf5 install -y kf6-ki18n-devel || echo "kf6-ki18n-devel not found"
RUN dnf5 install -y kf6-kcmutils-devel || echo "kf6-kcmutils-devel not found"
RUN dnf5 install -y kf6-knewstuff-devel || echo "kf6-knewstuff-devel not found"
RUN dnf5 install -y kf6-kio-devel || echo "kf6-kio-devel not found"
RUN dnf5 install -y kf6-knotifications-devel || echo "kf6-knotifications-devel not found"
RUN dnf5 install -y kf6-knotifyconfig-devel || echo "kf6-knotifyconfig-devel not found"
RUN dnf5 install -y kf6-attica-devel || echo "kf6-attica-devel not found"
RUN dnf5 install -y kf6-krunner-devel || echo "kf6-krunner-devel not found"
RUN dnf5 install -y kf6-kglobalaccel-devel || echo "kf6-kglobalaccel-devel not found"
RUN dnf5 install -y kf6-kcoreaddons-devel || echo "kf6-kcoreaddons-devel not found"
RUN dnf5 install -y kf6-kguiaddons-devel || echo "kf6-kguiaddons-devel not found"
RUN dnf5 install -y kf6-kdbusaddons-devel || echo "kf6-kdbusaddons-devel not found"
RUN dnf5 install -y kf6-kwidgetsaddons-devel || echo "kf6-kwidgetsaddons-devel not found"
RUN dnf5 install -y kf6-kcodecs-devel || echo "kf6-kcodecs-devel not found"
RUN dnf5 install -y kf6-sonnet-devel || echo "kf6-sonnet-devel not found"
RUN dnf5 install -y kf6-kpackage-devel || echo "kf6-kpackage-devel not found"
RUN dnf5 install -y kf6-kiconthemes-devel || echo "kf6-kiconthemes-devel not found"
RUN dnf5 install -y kf6-kxmlgui-devel || echo "kf6-kxmlgui-devel not found"
RUN dnf5 install -y kf6-ksvg-devel || echo "kf6-ksvg-devel not found"
# Optional: Build and install latest ECM (not needed if already installed above)
# RUN git clone https://invent.kde.org/frameworks/extra-cmake-modules.git /tmp/ecm
# RUN cmake -B /tmp/ecm/build -S /tmp/ecm && cmake --build /tmp/ecm/build && cmake --install /tmp/ecm/build

# Set working directory
WORKDIR /root/SwiftOS-Desktop

# Expose the /build directory to mount files if needed
VOLUME ["/root/SwiftOS-Desktop"]

# Start bash by default
CMD ["/bin/bash"]
