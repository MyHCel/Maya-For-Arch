#!/bin/bash

getent group adsklic &>/dev/null || sudo groupadd adsklic
id -u adsklic &>/dev/null || sudo useradd -M -r -g adsklic adsklic -d / -s /usr/bin/nologin
systemctl enable adsklicensing --quiet
systemctl start adsklicensing
