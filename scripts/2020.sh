#!/usr/bin/bash

# Install dependencies
# Argument 1: username
function installDep2020()
{
    sudo -u $1 yay -Syu --noconfirm --needed libjpeg lib32-libjpeg \
    libjpeg6 audiofile xorg-fonts-misc \
    libxp python2 python2-backports \
    ld-lsb lsb-release cpio \
    xorg-fonts-100dpi xorg-fonts-75dpi \
    xorg-fonts gsfonts \
    adobe-source-code-pro-fonts \
    xorg-xlsfonts xorg-fonts-type1 \
    libtiff libpng15 ncurses5-compat-libs \
    lib32-ncurses5-compat-libs libffi6 \
    alien_package_converter debtap

    # Update debtap
    debtap -u
}

# Convert all rpm packages
# from the current directory
function rpmToDeb2020()
{
    alien -d -c -v Maya/Packages/$(ls Maya/Packages/ | grep adlmapps | grep .rpm)
    alien -d -c -v Maya/Packages/$(ls Maya/Packages/ | grep adlmflexnetclient | grep .rpm)
    alien -d -c -v Maya/Packages/$(ls Maya/Packages/ | grep adlmflexnetserver | grep .rpm)
    alien -d -c -v Maya/Packages/$(ls Maya/Packages/ | grep adsklicensing | grep .rpm)
    alien -d -c -v Maya/Packages/$(ls Maya/Packages/ | grep Bifrost | grep .rpm)
    alien -d -c -v Maya/Packages/$(ls Maya/Packages/ | grep Maya2020 | grep .rpm)
    alien -d -c -v Maya/Packages/$(ls Maya/Packages/ | grep Substance | grep .rpm)
}

# Move all deb packages from
# the current directory
# Argument 1: dest dir
function mvDebPkg2020()
{
    mv $(ls | grep adlmapps | grep .deb) $1
    mv $(ls | grep adlmflexnetclient | grep .deb) $1
    mv $(ls | grep adlmflexnetserver | grep .deb) $1
    mv $(ls | grep adsklicensing | grep .deb) $1
    mv $(ls | grep bifrost | grep .deb) $1
    mv $(ls | grep maya2020 | grep .deb) $1
    mv $(ls | grep substance | grep .deb) $1
}

# Convert all deb packages
# from the current directory
function debToZst2020()
{
    debtap -Q $(ls | grep adlmapps | grep .deb)
    debtap -Q $(ls | grep adlmflexnetclient | grep .deb)
    debtap -Q $(ls | grep adlmflexnetserver | grep .deb)
    debtap -Q $(ls | grep adsklicensing | grep .deb)
    debtap -Q $(ls | grep bifrost | grep .deb)
    debtap -Q $(ls | grep maya2020 | grep .deb)
    debtap -Q $(ls | grep substance | grep .deb)
}

# Install all packages from
# the current directory
function installPkg2020()
{
    pacman -U --noconfirm $(ls | grep adlmapps | grep .zst)
    pacman -U --noconfirm $(ls | grep adlmflexnetclient | grep .zst)
    pacman -U --noconfirm $(ls | grep adlmflexnetserver | grep .zst)
    pacman -U --noconfirm $(ls | grep adsklicensing | grep .zst)
    pacman -U --noconfirm $(ls | grep bifrost | grep .zst)
    pacman -U --noconfirm $(ls | grep maya2020 | grep .zst)
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
    cp -r $1/lib/2020/* /usr/autodesk/maya2020/lib/

    # Link libraries to Maya's lib folder
    ln -s /usr/lib/libGL.so.1 /usr/autodesk/maya2020/lib/libGL.so

    # Create libmd.so into lib folder
    touch /usr/autodesk/maya2020/lib/libmd.so
}

# Install license
function license2020()
{
    VERSION=$(ls /opt/Autodesk/AdskLicensing)

    /opt/Autodesk/AdskLicensing/$VERSION/helper/AdskLicensingInstHelper \
    register -pk 657L1 -pv 2020.0.0.F -el EN_US -cf \
    /var/opt/Autodesk/Adlm/Maya2020/MayaConfig.pit

    /opt/Autodesk/Adlm/FLEXnet/bin/toolkitinstall.sh

    /opt/Autodesk/Adlm/FLEXnet/bin/install_fnp.sh \
    /opt/Autodesk/Adlm/FLEXnet/bin/FNPLicensingService
}

# Delete all deb packages
# from the current directory
function rmDebPkg2020()
{
    rm -r $(ls | grep adlmapps | grep .deb)
    rm -r $(ls | grep adlmflexnetclient | grep .deb)
    rm -r $(ls | grep adlmflexnetserver | grep .deb)
    rm -r $(ls | grep adsklicensing | grep .deb)
    rm -r $(ls | grep bifrost | grep .deb)
    rm -r $(ls | grep maya2020 | grep .deb)
    rm -r $(ls | grep substance | grep .deb)
}

# Uninstall packages
function uninstall2020()
{
    pacman -Rns --noconfirm $(pacman -Qm | grep adlmapps | awk '{print $1}')
    pacman -Rns --noconfirm $(pacman -Qm | grep adlmflexnetclient | awk '{print $1}')
    pacman -Rns --noconfirm $(pacman -Qm | grep adlmflexnetserver | awk '{print $1}')
    pacman -Rns --noconfirm $(pacman -Qm | grep adsklicensing | awk '{print $1}')
    pacman -Rns --noconfirm $(pacman -Qm | grep bifrost | awk '{print $1}')
    pacman -Rns --noconfirm $(pacman -Qm | grep maya2020 | awk '{print $1}')
    pacman -Rns --noconfirm $(pacman -Qm | grep substance | awk '{print $1}')
}
