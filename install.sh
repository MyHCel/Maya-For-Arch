#!/bin/bash

source scripts/dependencies.sh
source scripts/convert.sh
source scripts/install.sh
source scripts/clean.sh

ROOT_DIR=$PWD
PKG=$ROOT_DIR/pkg

echo -e "\n====== Maya For Arch by MyHCel ======\n"

echo -e "\n Select the version you want to install"
echo -e "\n [1] Maya 2020\n [2] Maya 2022\n"
read VERSION

echo -e "\nIntroduce your user name\n"
read NONROOT

installDep $VERSION $NONROOT

# extract the compressed file
sudo -u $NONROOT mkdir Maya
tar zxvf $(ls | grep Maya | grep .tgz) -C Maya

sudo -u $NONROOT mkdir $PKG
convertPkg $VERSION $PKG
installMaya $VERSION $NONROOT $PKG $ROOT_DIR
clean $VERSION $PKG $ROOT_DIR
