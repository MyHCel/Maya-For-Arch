#!/usr/bin/bash

source $PWD/scripts/2020.sh
source $PWD/scripts/2022.sh
source $PWD/scripts/adsk.sh
source $PWD/scripts/common.sh

# Remove Maya deb files
# Argument 1: version
# Argument 2: pkg dir
# Argument 3: Installer root dir
function cleanMaya()
{
    cd $2
    case $1 in
        2020)
            rmDebPkg2020
        ;;

        2022)
            rmDebPkg2022
        ;;
    esac

    cd $3
    rm -r Maya
}

# Remove Adsk deb files
# Argument 1: pkg dir
# Argument 2: Installer root dir
function cleanAdsk()
{
    cd $1
    rmDebPkgAdsk
    cd $2
    rm -r adsklicensinginstaller
}
