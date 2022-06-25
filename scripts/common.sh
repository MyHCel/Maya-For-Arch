#!/usr/bin/bash

# Enable adks licensing
function adskLic()
{
    getent group adsklic &>/dev/null || sudo groupadd adsklic
    id -u adsklic &>/dev/null || sudo useradd -M -r -g adsklic adsklic -d / -s /usr/bin/nologin
    systemctl enable adsklicensing --quiet
    systemctl start adsklicensing
}

# Install Arnold for Maya
# from the current directory
# Argument 1: version
function installMtoA()
{
    cd Maya/Packages
    python2 ./unix_installer.py $1 linux silent
}

# Remove the pkg directory
# Argument 1: Installer root dir
function rmPkg()
{
    echo -e "\n Remove converted packages? [Y/N]"
    read INPUT

    cd $1

    case $INPUT in

    y | Y)
       rm -r pkg
       ;;

    *)
       echo " "
       ;;
esac
}

# Set the env file
# Argument 1: version
# Argument 2: user name
function setEnv()
{
    sudo -u $2 mkdir /home/$2/maya
    sudo -u $2 mkdir /home/$2/maya/$1

    sudo -u $2 \
    echo -e "MAYA_OPENCL_IGNORE_DRIVER_VERSION=1\n
    MAYA_CM_DISABLE_ERROR_POPUPS=1\n
    MAYA_COLOR_MGT_NO_LOGGING=1\n
    TMPDIR=/tmp" \
    >> /home/$2/maya/$1/Maya.env
}
