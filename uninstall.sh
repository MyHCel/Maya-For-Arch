#!/usr/bin/bash

source $PWD/scripts/uninstall.sh
source $PWD/scripts/common.sh

echo -e "\nSelect the version you want to uninstall"
echo "[1] Maya 2020"
echo "[2] Maya 2022"
echo -n "version: "
read VERSION

echo -n "Uninstall Autodesk Licensing Service? [Y/N]: "
read ADSK

echo -n "Enter your username: "
read NONROOT

HOME_DIR=/home/$NONROOT

case $VERSION in
    1 | 2020)
        VERSION=2020
        ;;

    2 | 2022)
        VERSION=2022
        ;;
esac

uninstallMaya $VERSION
rmMayaDirs $VERSION $NONROOT

if [[ $ADSK == y ]] || [[ $ADSK == Y ]]; then
    systemctl stop adsklicensing
    systemctl disable adsklicensing
    uninstallAdsk
    rmAdskDirs $NONROOT
fi

rmAutodeskDirs $NONROOT

