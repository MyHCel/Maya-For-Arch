#!/usr/bin/bash

source 2020.sh
source 2022.sh

# Convert packages
# Argument 1: version
# Argument 2: dest dir
function convertPkg()
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
