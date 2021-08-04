#!/bin/bash

echo -e "\n====== Maya For Arch by MyHCel ======\n"

echo "NONROOT=$USER" > env.sh
chmod +x env.sh

sudo ./scripts/common/install_all.sh
