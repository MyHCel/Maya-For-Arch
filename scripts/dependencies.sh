#!/usr/bin/bash

source 2020.sh
source 2022.sh

# Install dependencies
# Argument 1: version
# Argument 2: user name
function installDep()
{
    case $1 in
        2020)
            installDep2020 $2
            ;;

        2022)
            installDep2022 $2
            ;;
    esac
}
