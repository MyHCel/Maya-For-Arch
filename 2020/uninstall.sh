#!/bin/bash

sudo systemctl stop adsklicensing
sudo systemctl disable adsklicensing

sudo pacman -Rns --noconfirm $(pacman -Qm | grep adlmapps | awk '{print $1}')
sudo pacman -Rns --noconfirm $(pacman -Qm | grep adlmflexnetclient | awk '{print $1}')
sudo pacman -Rns --noconfirm $(pacman -Qm | grep adlmflexnetserver | awk '{print $1}')
sudo pacman -Rns --noconfirm $(pacman -Qm | grep adsklicensing | awk '{print $1}')
sudo pacman -Rns --noconfirm $(pacman -Qm | grep bifrost | awk '{print $1}')
sudo pacman -Rns --noconfirm $(pacman -Qm | grep maya2020 | awk '{print $1}')
sudo pacman -Rns --noconfirm $(pacman -Qm | grep substance | awk '{print $1}')
sudo rm -r /usr/autodesk
sudo rm -r $HOME/maya
sudo rm -r $HOME/xgen
