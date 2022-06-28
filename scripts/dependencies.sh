#!/usr/bin/bash

source $PWD/scripts/2020.sh
source $PWD/scripts/2022.sh
source $PWD/scripts/2023.sh

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

        2023)
            installDep2023 $2
        ;;
    esac
}
