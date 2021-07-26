#!/bin/bash

# Install all packages

cd pkg

sudo pacman -U --noconfirm $(ls | grep adlmapps | grep .zst)
sudo pacman -U --noconfirm $(ls | grep adlmflexnetclient | grep .zst)
sudo pacman -U --noconfirm $(ls | grep adlmflexnetserver | grep .zst)
sudo pacman -U --noconfirm $(ls | grep adsklicensing | grep .zst)
sudo pacman -U --noconfirm $(ls | grep bifrost | grep .zst)
sudo pacman -U --noconfirm $(ls | grep maya2020 | grep .zst)
sudo pacman -U --noconfirm $(ls | grep substance | grep .zst)

cd ..
