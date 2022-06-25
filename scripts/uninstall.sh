#!/usr/bin/bash

source $PWD/scripts/2020.sh
source $PWD/scripts/2022.sh

# Uninstall packages
# Argument 1: version
function uninstall()
{
    case $1 in
        2020)
            uninstall2020
            ;;

        2022)
            uninstall2022
            ;;
    esac
}
