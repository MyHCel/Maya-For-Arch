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
# Argument 2: Installer root dir
function installMtoA()
{
    cd $2/Maya/Packages
    python2 ./unix_installer.py $1 linux silent
}

# Remove the pkg directory
# Argument 1: Installer root dir
function rmPkg()
{
    echo -n "Remove converted packages? [Y/N]: "
    read INPUT

    cd $1

    case $INPUT in

    y | Y)
        rm -r pkg
        ;;
    esac
}

# Set the env file
# Argument 1: version
# Argument 2: user name
function setEnv()
{
    sudo -u $2 mkdir -p /home/$2/maya/$1

    sudo -u $2 echo -e "MAYA_OPENCL_IGNORE_DRIVER_VERSION=1\nMAYA_COLOR_MGT_NO_LOGGING=1\nTMPDIR=/tmp" \
    > /home/$2/maya/$1/Maya.env

    chown $2:$2 /home/$2/maya/$1/Maya.env
}

# Remove Autodesk directories
# Argument 1: version
# Argument 2: user name
function rmLeftDirs()
{
    echo -e "\nRemove Autodesk directories?"
    echo "(if you have more Autodesk software"
    echo "installed, perhaps you should not)"
    echo -n "[Y/N]: "
    read INPUT

    HOME_DIR=/home/$2

    case $INPUT in

    y | Y)
        if [ $1 == 2022 ]; then
            rm -r /opt/Autodesk
        fi

        rm -r /usr/autodesk
        rm -r $HOME_DIR/.local/share/Autodesk
        rm -r $HOME_DIR/.autodesk
        rm -r $HOME_DIR/.config/Autodesk
        ;;

    n | N)
        rm -r /usr/autodesk/maya$1
        rm -r /usr/autodesk/modules/maya
        ;;
    esac

    rm -r $HOME_DIR/maya
    rm -r $HOME_DIR/xgen
    rm -r $HOME_DIR/Adlm
}
