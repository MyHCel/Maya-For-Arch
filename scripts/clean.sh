#!/usr/bin/bash

source 2020.sh
source 2022.sh
source common.sh

# Remove unnecessary files
# Argument 1: version
# Argument 2: pkg dir
# Argument 3: Installer root dir
function clean()
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

    rmPkg $3
    rm -r Maya
}
