#!/usr/bin/bash

source $PWD/scripts/2020.sh
source $PWD/scripts/2022.sh
source $PWD/scripts/adsk.sh
source $PWD/scripts/common.sh

# Install Maya
# Argument 1: version
# Argument 2: user name
# Argument 3: pkg dir
# Argument 4: Installer root dir
function installMaya()
{
    cd $3
    case $1 in
        2020)
            installLib2020 $4
            installPkg2020
            ;;

        2022)
            installLib2022 $4
            installPkg2022
            ;;
    esac

    cd $4
    installMtoA $1 $4
    registerMaya $1
    setEnv $1 $2
}

# Install Adsk
# Argument 1: pkg dir
function installAdsk()
{
    cd $1
    installPkgAdsk

    getent group adsklic &>/dev/null || sudo groupadd adsklic
    id -u adsklic &>/dev/null || sudo useradd -M -r -g adsklic adsklic -d / -s /usr/bin/nologin 
    systemctl enable adsklicensing --quiet
    systemctl start adsklicensing

    systemctl status adsklicensing
}

