#!/usr/bin/bash

# Install utilities
# Argument 1: username
function installUtil()
{
    sudo -u $1 yay -Syu --noconfirm --needed \
    alien_package_converter debtap

    # Update debtap
    debtap -u
}

# Register Maya
# Argument 1: version
function registerMaya()
{
    VERSION=Current

    case $1 in
        2020)
            NUMBER=657L1
        ;;

        2022)
            NUMBER=657N1
        ;;
    esac

    # Check if Maya has been registered already
    REG=$(/opt/Autodesk/AdskLicensing/$VERSION/helper/AdskLicensingInstHelper list | grep $NUMBER)

    if [[ $REG == "" ]]; then
        /opt/Autodesk/AdskLicensing/$VERSION/helper/AdskLicensingInstHelper \
        register -pk $NUMBER -pv $1.0.0.F -el EN_US -cf \
        /var/opt/Autodesk/Adlm/Maya$1/MayaConfig.pit
    fi

    /opt/Autodesk/AdskLicensing/$VERSION/helper/AdskLicensingInstHelper list
}

# Install Arnold for Maya
# Argument 1: version
# Argument 2: Installer root dir
function installMtoA()
{
    cd $2/Maya/Packages
    python2 ./unix_installer.py $1 linux silent
}

# Set the env file
# Argument 1: version
# Argument 2: user name
function setEnv()
{
    sudo -u $2 mkdir -p /home/$2/maya/$1

    echo "MAYA_OPENCL_IGNORE_DRIVER_VERSION=1" > /home/$2/maya/$1/Maya.env
    echo "MAYA_COLOR_MGT_NO_LOGGING=1" >> /home/$2/maya/$1/Maya.env
    echo "MAYA_DISABLE_CIP=1" >> /home/$2/maya/$1/Maya.env
    echo "TMPDIR=/tmp" >> /home/$2/maya/$1/Maya.env

    if [[ $1 > 2020 ]]; then
        echo "MAYA_NO_HOME=1" >> /home/$2/maya/$1/Maya.env
    fi

    chown $2:$2 /home/$2/maya/$1/Maya.env
}

# Move converted packages to cache
# Argument 1: user name
# Argument 2: pkg dir
# Argument 3: cache dir
function cachePkg()
{
    sudo -u $1 mv $2/* $3/
}

# Remove Maya directories
# Argument 1: version
# Argument 2: user name
function rmMayaDirs()
{
    HOME_DIR=/home/$2

    rm -r /usr/autodesk/maya$1
    rm -r /usr/autodesk/modules/maya
    rm -r /opt/Autodesk/Synergy
    rm -r /opt/Allegorithmic/Substance_in_Maya
    rm -r /opt/rokoko_motion_library/maya
    rm -r $HOME_DIR/maya
    rm -r $HOME_DIR/xgen
    rm -r $HOME_DIR/.cache/Autodesk/Maya-$1
    rm -r $HOME_DIR/.config/Autodesk/Maya-$1.conf
}

# Remove Adsk directories
# Argument 1: user name
function rmAdskDirs()
{
    HOME_DIR=/home/$1

    rm -r /var/opt/Autodesk/Adlm
    rm -r /var/opt/Autodesk/AdskLicensingService
    rm -r $HOME_DIR/Adlm
    rm -r $HOME_DIR/.config/Autodesk/'Autodesk Licensing Manager.conf'
    rm -r $HOME_DIR/.local/share/Autodesk/'Web Services'/*
}

# Remove Autodesk directories
# Argument 1: user name
function rmAutodeskDirs()
{
    echo -e "\nRemove Autodesk directories?"
    echo "(if you have more Autodesk software"
    echo "installed, perhaps you should not)"
    echo -n "[Y/N]: "
    read INPUT

    HOME_DIR=/home/$1

    if [[ $INPUT == y || $INPUT == Y ]]; then
        rm -r /usr/autodesk
        rm -r /opt/Autodesk
        rm -r /var/opt/Autodesk
        rm -r $HOME_DIR/.autodesk
        rm -r $HOME_DIR/.cache/Autodesk
        rm -r $HOME_DIR/.config/Autodesk
        rm -r $HOME_DIR/.local/share/Autodesk
    fi
}
