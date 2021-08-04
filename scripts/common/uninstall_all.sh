#!/bin/bash

source env.sh

systemctl stop adsklicensing
systemctl disable adsklicensing

echo -e "\nSelect the version you want to uninstall\n"
echo -e " [1] Maya 2020\n [2] Maya 2022\n"

read MAYA_VERSION

case $MAYA_VERSION in

   1 | 2020)
      pacman -Rns --noconfirm $(pacman -Qm | grep adlmapps | awk '{print $1}')
      pacman -Rns --noconfirm $(pacman -Qm | grep adlmflexnetclient | awk '{print $1}')
      pacman -Rns --noconfirm $(pacman -Qm | grep adlmflexnetserver | awk '{print $1}')
      pacman -Rns --noconfirm $(pacman -Qm | grep adsklicensing | awk '{print $1}')
      pacman -Rns --noconfirm $(pacman -Qm | grep bifrost | awk '{print $1}')
      pacman -Rns --noconfirm $(pacman -Qm | grep maya2020 | awk '{print $1}')
      pacman -Rns --noconfirm $(pacman -Qm | grep substance | awk '{print $1}')
      ;;

   2 | 2022)
      pacman -Rns --noconfirm $(pacman -Qm | grep adlmapps | awk '{print $1}')
      pacman -Rns --noconfirm $(pacman -Qm | grep adlmflexnetclient | awk '{print $1}')
      pacman -Rns --noconfirm $(pacman -Qm | grep adlmflexnetserver | awk '{print $1}')
      pacman -Rns --noconfirm $(pacman -Qm | grep adsklicensing | awk '{print $1}')
      pacman -Rns --noconfirm $(pacman -Qm | grep bifrost | awk '{print $1}')
      pacman -Rns --noconfirm $(pacman -Qm | grep maya2022-64 | awk '{print $1}')
      pacman -Rns --noconfirm $(pacman -Qm | grep mayausd | awk '{print $1}')
      pacman -Rns --noconfirm $(pacman -Qm | grep pymel | awk '{print $1}')
      pacman -Rns --noconfirm $(pacman -Qm | grep rokoko | awk '{print $1}')
      pacman -Rns --noconfirm $(pacman -Qm | grep substance | awk '{print $1}')
      ;;
   *)
      echo "Bruh\n"
      ;;
esac

rm -r /usr/autodesk
rm -r $HOME_DIR/maya
rm -r $HOME_DIR/xgen
rm -r $HOME_DIR/Adlm
rm -r /var/opt/Autodesk
rm -r /opt/Autodesk
rm -r $HOME_DIR/.local/share/Autodesk
rm -r $HOME_DIR/.autodesk
rm -r $HOME_DIR/.config/Autodesk


