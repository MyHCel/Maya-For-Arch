#!/bin/bash

source $PWD/scripts/dependencies.sh
source $PWD/scripts/convert.sh
source $PWD/scripts/install.sh
source $PWD/scripts/clean.sh

ROOT_DIR=$PWD
PKG=$ROOT_DIR/pkg

echo -e "\n====== Maya For Arch by MyHCel ======\n"

echo "Select the version you want to install"
echo "[1] Maya 2020"
echo "[2] Maya 2022"
echo -n "version: "
read VERSION

echo -n "Install Autodesk Licensing Service? [Y/N]: "
read ADSK

echo -n "Enter your username: "
read NONROOT

case $VERSION in
    1 | 2020)
        VERSION=2020
        ;;

    2 | 2022)
        VERSION=2022
        ;;
esac

VERSION2=$VERSION

installDep $VERSION $NONROOT
sudo -u $NONROOT mkdir $PKG

if [[ $ADSK == y || $ADSK == Y ]]; then
    # Extract Adsk files
    sudo -u $NONROOT tar zxvf $(ls | grep Adsk | grep .gz) -C .

    # Install Adsk
    convertAdsk $PKG
    installAdsk $PKG
    cleanAdsk $PKG $ROOT_DIR
fi

# Extract Maya files
cd $ROOT_DIR
sudo -u $NONROOT mkdir Maya
sudo -u $NONROOT tar zxvf $(ls | grep Maya | grep .tgz) -C Maya

# Install Maya
convertMaya $VERSION $PKG
installMaya $VERSION $NONROOT $PKG $ROOT_DIR
cleanMaya $VERSION2 $PKG $ROOT_DIR

rmPkg $ROOT_DIR

echo "Done C:"
