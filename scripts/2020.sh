#!/usr/bin/bash

# Install dependencies
# Argument 1: username
function installDep2020()
{
    sudo -u $1 yay -Syu --noconfirm --needed \
    libxp gamin audiofile e2fsprogs \
    xorg-fonts-75dpi xorg-fonts-100dpi ttf-liberation \
    libjpeg6-turbo ncurses5-compat-libs
}

# Convert all rpm packages
# from the current directory
function rpmToDeb2020()
{
    alien -d -c -v Maya/Packages/$(ls Maya/Packages/ | grep Bifrost | grep .rpm)
    alien -d -c -v Maya/Packages/$(ls Maya/Packages/ | grep Maya2020 | grep .rpm)
    alien -d -c -v Maya/Packages/$(ls Maya/Packages/ | grep Substance | grep .rpm)
}

# Move all deb packages from
# the current directory
# Argument 1: dest dir
function mvDebPkg2020()
{
    mv $(ls | grep bifrost | grep .deb) $1
    mv $(ls | grep maya2020 | grep .deb) $1
    mv $(ls | grep substance | grep .deb) $1
}

# Convert all deb packages
# from the current directory
function debToZst2020()
{
    debtap -Q $(ls | grep bifrost | grep .deb)
    debtap -Q $(ls | grep maya2020 | grep .deb)
    debtap -Q $(ls | grep substance | grep .deb)
}

# Install all packages from
# the current directory
function installPkg2020()
{
    pacman -U --noconfirm $(ls | grep maya2020 | grep .zst)
    pacman -U --noconfirm $(ls | grep bifrost | grep .zst)
    pacman -U --noconfirm $(ls | grep substance | grep .zst)
}

# Install libraries from
# the current directory
# Argument 1: Installer root dir
function installLib2020()
{
    # Create Maya's lib folder
    mkdir -p /usr/autodesk/maya2020/lib

    # Copy libraries to Maya's lib folder
    cp -r $1/lib/libtiff/4.4.0-1/* /usr/autodesk/maya2020/lib/
    cp -r $1/lib/libjbig/2.1-23/* /usr/autodesk/maya2020/lib/
    cp -r $1/lib/openssl/10-1.0.2o-3/* /usr/autodesk/maya2020/lib/
    cp -r $1/lib/libffi/3.1-3.1-32/* /usr/autodesk/maya2020/lib/
    mv /usr/autodesk/maya2020/lib/libffi.so.6 /usr/autodesk/maya2020/lib/libffi.so.8

    # Create libmd.so into lib folder
    touch /usr/autodesk/maya2020/lib/libmd.so
}

# Delete all deb packages
# from the current directory
function rmDebPkg2020()
{
    rm -f $(ls | grep bifrost | grep .deb)
    rm -f $(ls | grep maya2020 | grep .deb)
    rm -f $(ls | grep substance | grep .deb)
}

# Uninstall packages
function uninstallPkg2020()
{
    pacman -Rns --noconfirm $(pacman -Qm | grep bifrost | awk '{print $1}')
    pacman -Rns --noconfirm $(pacman -Qm | grep substance | awk '{print $1}')
    pacman -Rns --noconfirm $(pacman -Qm | grep maya2020 | awk '{print $1}')
}
