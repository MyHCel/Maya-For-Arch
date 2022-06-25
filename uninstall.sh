#!/usr/bin/bash

source $PWD/scripts/uninstall.sh

echo "Select the version you want to uninstall"
echo "[1] Maya 2020"
echo "[2] Maya 2022"
echo -n "version: "
read VERSION

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

systemctl stop adsklicensing
systemctl disable adsklicensing
uninstall $VERSION

rm -r /usr/autodesk/maya$VERSION
rm -r /usr/autodesk/modules/maya
rm -r $HOME_DIR/maya
rm -r $HOME_DIR/xgen
rm -r $HOME_DIR/Adlm
rm -r /var/opt/Autodesk/Adlm
rm -r /var/opt/Autodesk/AdskLicensingService
#rm -r /opt/Autodesk
#rm -r $HOME_DIR/.local/share/Autodesk
#rm -r $HOME_DIR/.autodesk
#rm -r $HOME_DIR/.config/Autodesk, 
