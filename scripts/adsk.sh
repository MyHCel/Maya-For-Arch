#!/usr/bin/bash

# Convert all rpm packages
# from the Adsk directory
function rpmToDebAdsk()
{
    DIR=adsklicensinginstaller
    alien -d -c -v $DIR/$(ls $DIR | grep adlmapps | grep .rpm)
    alien -d -c -v $DIR/$(ls $DIR | grep adskflexnetclient | grep .rpm)
    alien -d -c -v $DIR/$(ls $DIR | grep adskflexnetserver | grep .rpm)
    alien -d -c -v $DIR/$(ls $DIR | grep adsklicensing | grep .rpm)
}

# Move all deb packages from
# the current directory
# Argument 1: dest dir
function mvDebPkgAdsk()
{
    mv $(ls | grep adlmapps | grep .deb) $1
    mv $(ls | grep adskflexnetclient | grep .deb) $1
    mv $(ls | grep adskflexnetserver | grep .deb) $1
    mv $(ls | grep adsklicensing | grep .deb) $1
}

# Convert all deb packages
# from the current directory
function debToZstAdsk()
{
    debtap -Q $(ls | grep adlmapps | grep .deb)
    debtap -Q $(ls | grep adskflexnetclient | grep .deb)
    debtap -Q $(ls | grep adskflexnetserver | grep .deb)
    debtap -Q $(ls | grep adsklicensing | grep .deb)
}

# Install all packages from
# the current directory
function installPkgAdsk()
{
    pacman -U --noconfirm $(ls | grep adlmapps | grep .zst)
    pacman -U --noconfirm $(ls | grep adskflexnetclient | grep .zst)
    pacman -U --noconfirm $(ls | grep adskflexnetserver | grep .zst)
    pacman -U --noconfirm $(ls | grep adsklicensing | grep .zst)
}

# Delete all deb packages
# from the current directory
function rmDebPkgAdsk()
{
    rm -f $(ls | grep adlmapps | grep .deb)
    rm -f $(ls | grep adskflexnetclient | grep .deb)
    rm -f $(ls | grep adskflexnetserver | grep .deb)
    rm -f $(ls | grep adsklicensing | grep .deb)
}

# Uninstall packages
function uninstallPkgAdsk()
{
    pacman -Rns --noconfirm $(pacman -Qm | grep adlmapps | awk '{print $1}')
    pacman -Rns --noconfirm $(pacman -Qm | grep adskflexnetclient | awk '{print $1}')
    pacman -Rns --noconfirm $(pacman -Qm | grep adskflexnetserver | awk '{print $1}')
    pacman -Rns --noconfirm $(pacman -Qm | grep adsklicensing | awk '{print $1}')
}
