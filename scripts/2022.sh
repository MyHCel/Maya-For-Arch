#!/usr/bin/bash

# Install dependencies
# Argument 1: user name
function installDep2022()
{
    sudo -u $1 yay -Syu --noconfirm --needed \
    libxp gamin audiofile e2fsprogs libmng \
    flite speech-dispatcher cups libpng15 \
    xorg-fonts-75dpi xorg-fonts-100dpi ttf-liberation \
    libjpeg6-turbo ncurses5-compat-libs
}

# Convert all rpm packages
# from the current directory
function rpmToDeb2022()
{
    alien -d -c -v Maya/Packages/$(ls Maya/Packages/ | grep Bifrost | grep .rpm)
    alien -d -c -v Maya/Packages/$(ls Maya/Packages/ | grep Maya2022 | grep .rpm)
    alien -d -c -v Maya/Packages/$(ls Maya/Packages/ | grep MayaUSD | grep .rpm)
    alien -d -c -v Maya/Packages/$(ls Maya/Packages/ | grep Pymel | grep .rpm)
    alien -d -c -v Maya/Packages/$(ls Maya/Packages/ | grep Rokoko | grep .rpm)
    alien -d -c -v Maya/Packages/$(ls Maya/Packages/ | grep Substance | grep .rpm)
}

# Move all deb packages from
# the current directory
# Argument 1: dest dir
function mvDebPkg2022()
{
    mv $(ls | grep bifrost | grep .deb) $1
    mv $(ls | grep maya2022 | grep .deb) $1
    mv $(ls | grep mayausd | grep .deb) $1
    mv $(ls | grep pymel | grep .deb) $1
    mv $(ls | grep rokoko | grep .deb) $1
    mv $(ls | grep substance | grep .deb) $1
}

# Convert all deb packages
# from the current directory
function debToZst2022()
{
    debtap -Q $(ls | grep bifrost | grep .deb)
    debtap -Q $(ls | grep maya2022 | grep .deb)
    debtap -Q $(ls | grep mayausd | grep .deb)
    debtap -Q $(ls | grep pymel | grep .deb)
    debtap -Q $(ls | grep rokoko | grep .deb)
    debtap -Q $(ls | grep substance | grep .deb)
}

# Install all packages from
# the current directory
function installPkg2022()
{
    pacman -U --noconfirm $(ls | grep maya2022 | grep .zst)
    pacman -U --noconfirm $(ls | grep mayausd | grep .zst)
    pacman -U --noconfirm $(ls | grep bifrost | grep .zst)
    pacman -U --noconfirm $(ls | grep pymel | grep .zst)
    pacman -U --noconfirm $(ls | grep rokoko | grep .zst)
    pacman -U --noconfirm $(ls | grep substance | grep .zst)
}

# Install libraries from
# the current directory
# Argument 1: Installer root dir
function installLib2022()
{
    # Create Maya's lib folder
    mkdir -p /usr/autodesk/maya2022/lib

    # Copy libraries to Maya's lib folder
    cp -r $1/lib/libtiff/4.4.0-1/* /usr/autodesk/maya2022/lib/
    cp -r $1/lib/libjbig/2.1-23/* /usr/autodesk/maya2022/lib/
    cp -r $1/lib/libpng12/1.2.57-15/* /usr/autodesk/maya2022/lib/
    cp -r $1/lib/libffi/3.1-3.1-32/* /usr/autodesk/maya2022/lib/
    mv /usr/autodesk/maya2022/lib/libffi.so.6 /usr/autodesk/maya2022/lib/libffi.so.8

    # Link libraries to Maya's lib folder
    ln -s /usr/lib/libcrypto.so.1.1 /usr/autodesk/maya2022/lib/libcrypto.so.10
    ln -s /usr/lib/libssl.so.1.1 /usr/autodesk/maya2022/lib/libssl.so.10
    ln -s /usr/lib/libcrypt.so.2.0.0 /usr/autodesk/maya2022/lib/libcrypt.so.1

    # Create libmd.so into lib folder
    touch /usr/autodesk/maya2022/lib/libmd.so
}

# Delete all deb packages
# from the current directory
function rmDebPkg2022()
{
    rm -fv $(ls | grep bifrost | grep .deb)
    rm -fv $(ls | grep maya2022 | grep .deb)
    rm -fv $(ls | grep mayausd | grep .deb)
    rm -fv $(ls | grep pymel | grep .deb)
    rm -fv $(ls | grep rokoko | grep .deb)
    rm -fv $(ls | grep substance | grep .deb)
}

# Uninstall packages
function uninstallPkg2022()
{
    pacman -Rns --noconfirm $(pacman -Qm | grep bifrost | awk '{print $1}')
    pacman -Rns --noconfirm $(pacman -Qm | grep pymel | awk '{print $1}')
    pacman -Rns --noconfirm $(pacman -Qm | grep rokoko | awk '{print $1}')
    pacman -Rns --noconfirm $(pacman -Qm | grep substance | awk '{print $1}')
    pacman -Rns --noconfirm $(pacman -Qm | grep mayausd | awk '{print $1}')
    pacman -Rns --noconfirm $(pacman -Qm | grep maya2022 | awk '{print $1}')
}
