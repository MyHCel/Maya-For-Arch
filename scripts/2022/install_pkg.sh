#!/bin/bash

# ====== Install all packages ======

cd pkg

pacman -U --noconfirm $(ls | grep adlmapps | grep .zst)
pacman -U --noconfirm $(ls | grep adlmflexnetclient | grep .zst)
pacman -U --noconfirm $(ls | grep adlmflexnetserver | grep .zst)
pacman -U --noconfirm $(ls | grep adsklicensing | grep .zst)
pacman -U --noconfirm $(ls | grep bifrost | grep .zst)
pacman -U --noconfirm $(ls | grep maya2022-64 | grep .zst)
pacman -U --noconfirm $(ls | grep mayausd | grep .zst)
pacman -U --noconfirm $(ls | grep pymel | grep .zst)
pacman -U --noconfirm $(ls | grep rokoko | grep .zst)
pacman -U --noconfirm $(ls | grep substance | grep .zst)

cd ..