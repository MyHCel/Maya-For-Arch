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

echo -e "\n"
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

installDep $VERSION $NONROOT

# extract the compressed file
sudo -u $NONROOT mkdir Maya
tar zxvf $(ls | grep Maya | grep .tgz) -C Maya

sudo -u $NONROOT mkdir $PKG
convertPkg $VERSION $PKG
installMaya $VERSION $NONROOT $PKG $ROOT_DIR
clean $VERSION $PKG $ROOT_DIR

echo "Done C:"
