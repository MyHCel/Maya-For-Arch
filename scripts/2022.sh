#!/usr/bin/bash

# Install dependencies
# Argument 1: user name
function installDep2022()
{
    sudo -u $1 yay -Syu --noconfirm --needed \
    openssl libjpeg \
    lib32-libjpeg libjpeg6 audiofile \
    xorg-fonts-misc libxp python2 \
    python2-backports ld-lsb lsb-release \
    cpio xorg-fonts-100dpi xorg-fonts-75dpi \
    xorg-fonts gsfonts \
    adobe-source-code-pro-fonts xorg-xlsfonts \
    xorg-fonts-type1 libpng15 \
    ncurses5-compat-libs \
    lib32-ncurses5-compat-libs libffi6
}

# Convert all rpm packages
# from the current directory
function rpmToDeb2022()
{
    alien -d -c -v Maya/Packages/$(ls Maya/Packages/ | grep Bifrost | grep .rpm)
    alien -d -c -v Maya/Packages/$(ls Maya/Packages/ | grep Maya2022_64 | grep .rpm)
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
    mv $(ls | grep maya2022-64 | grep .deb) $1
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
    debtap -Q $(ls | grep maya2022-64 | grep .deb)
    debtap -Q $(ls | grep mayausd | grep .deb)
    debtap -Q $(ls | grep pymel | grep .deb)
    debtap -Q $(ls | grep rokoko | grep .deb)
    debtap -Q $(ls | grep substance | grep .deb)
}

# Install all packages from
# the current directory
function installPkg2022()
{
    pacman -U --noconfirm $(ls | grep maya2022-64 | grep .zst)
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

    # Link libraries to Maya's lib folder
    ln -s /usr/lib/libcrypto.so.1.1 /usr/autodesk/maya2022/lib/libcrypto.so.10
    ln -s /usr/lib/libssl.so.1.1 /usr/autodesk/maya2022/lib/libssl.so.10
    ln -s /usr/lib/libcrypt.so.2.0.0 /usr/autodesk/maya2022/lib/libcrypt.so.1
    #ln -s /usr/lib/libGL.so.1 /usr/autodesk/maya2022/lib/libGL.so

    # Create libmd.so into lib folder
    touch /usr/autodesk/maya2022/lib/libmd.so
}

# Delete all deb packages
# from the current directory
function rmDebPkg2022()
{
    rm -r $(ls | grep bifrost | grep .deb)
    rm -r $(ls | grep maya2022-64 | grep .deb)
    rm -r $(ls | grep mayausd | grep .deb)
    rm -r $(ls | grep pymel | grep .deb)
    rm -r $(ls | grep rokoko | grep .deb)
    rm -r $(ls | grep substance | grep .deb)
}

# Uninstall packages
function uninstallPkg2022()
{
    pacman -Rns --noconfirm $(pacman -Qm | grep bifrost | awk '{print $1}')
    pacman -Rns --noconfirm $(pacman -Qm | grep pymel | awk '{print $1}')
    pacman -Rns --noconfirm $(pacman -Qm | grep rokoko | awk '{print $1}')
    pacman -Rns --noconfirm $(pacman -Qm | grep substance | awk '{print $1}')
    pacman -Rns --noconfirm $(pacman -Qm | grep mayausd | awk '{print $1}')
    pacman -Rns --noconfirm $(pacman -Qm | grep maya2022-64 | awk '{print $1}')
}
