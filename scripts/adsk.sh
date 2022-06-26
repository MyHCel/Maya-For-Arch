#!/usr/bin/bash

# Convert all rpm packages
# from the Adsk directory
function rpmToDebAdsk()
{
    alien -d -c -v Adsk/$(ls Maya/Packages/ | grep adlmapps | grep .rpm)
    alien -d -c -v Adsk/$(ls Maya/Packages/ | grep adlmflexnetclient | grep .rpm)
    alien -d -c -v Adsk/$(ls Maya/Packages/ | grep adlmflexnetserver | grep .rpm)
    alien -d -c -v Adsk/$(ls Maya/Packages/ | grep adsklicensing | grep .rpm)
}

# Move all deb packages from
# the current directory
# Argument 1: dest dir
function mvDebPkgAdsk()
{
    mv $(ls | grep adlmapps | grep .deb) $1
    mv $(ls | grep adlmflexnetclient | grep .deb) $1
    mv $(ls | grep adlmflexnetserver | grep .deb) $1
    mv $(ls | grep adsklicensing | grep .deb) $1
}

# Convert all deb packages
# from the current directory
function debToZstAdsk()
{
    debtap -Q $(ls | grep adlmapps | grep .deb)
    debtap -Q $(ls | grep adlmflexnetclient | grep .deb)
    debtap -Q $(ls | grep adlmflexnetserver | grep .deb)
    debtap -Q $(ls | grep adsklicensing | grep .deb)
}

# Install all packages from
# the current directory
function installPkgAdsk()
{
    pacman -U --noconfirm $(ls | grep adlmapps | grep .zst)
    pacman -U --noconfirm $(ls | grep adlmflexnetclient | grep .zst)
    pacman -U --noconfirm $(ls | grep adlmflexnetserver | grep .zst)
    pacman -U --noconfirm $(ls | grep adsklicensing | grep .zst)
}

# Delete all deb packages
# from the current directory
function rmDebPkgAdsk()
{
    rm -r $(ls | grep adlmapps | grep .deb)
    rm -r $(ls | grep adlmflexnetclient | grep .deb)
    rm -r $(ls | grep adlmflexnetserver | grep .deb)
    rm -r $(ls | grep adsklicensing | grep .deb)
}

# Uninstall packages
function uninstallPkgAdsk()
{
    pacman -Rns --noconfirm $(pacman -Qm | grep adlmapps | awk '{print $1}')
    pacman -Rns --noconfirm $(pacman -Qm | grep adlmflexnetclient | awk '{print $1}')
    pacman -Rns --noconfirm $(pacman -Qm | grep adlmflexnetserver | awk '{print $1}')
    pacman -Rns --noconfirm $(pacman -Qm | grep adsklicensing | awk '{print $1}')
}
