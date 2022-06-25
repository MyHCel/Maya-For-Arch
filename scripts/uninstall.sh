#!/usr/bin/bash

source 2020.sh
source 2022.sh

# Uninstall Maya
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
