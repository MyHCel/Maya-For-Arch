#!/bin/bash

# Update and Install dependencies

yay -Syu --noconfirm libjpeg lib32-libjpeg libjpeg6 openssl-1.0 openssl audiofile xorg-fonts-misc libxp python2 python2-backports ld-lsb lsb-release cpio xorg-fonts-100dpi xorg-fonts-75dpi xorg-fonts gsfonts adobe-source-code-pro-fonts xorg-xlsfonts xorg-fonts-type1 libtiff libpng15 ncurses5-compat-libs lib32-ncurses5-compat-libs libffi6

# Install utilities

yay -S --noconfirm alien_package_converter debtap

# Update debtap

sudo debtap -u
