#!/usr/bin/bash

source $PWD/scripts/2020.sh
source $PWD/scripts/2022.sh
source $PWD/scripts/adsk.sh

# Convert Maya packages
# Argument 1: version
# Argument 2: dest dir
function convertMaya()
{
    case $1 in
        2020)
            rpmToDeb2020
            mvDebPkg2020 $2
            cd $2
            debToZst2020
            ;;

        2022)
            rpmToDeb2022
            mvDebPkg2022 $2
            cd $2
            debToZst2022
            ;;
    esac
}

# Convert Adsk packages
# Argument 1: dest dir
function convertAdsk()
{
    rpmToDebAdsk
    mvDebPkgAdsk $1
    cd $1
    debToZstAdsk
}
