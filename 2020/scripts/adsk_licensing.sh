#!/bin/bash

sudo getent group adsklic &>/dev/null || sudo groupadd adsklic
sudo id -u adsklic &>/dev/null || sudo useradd -M -r -g adsklic adsklic -d / -s /usr/bin/nologin
sudo systemctl enable adsklicensing --quiet
sudo systemctl start adsklicensing
