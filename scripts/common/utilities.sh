#!/bin/bash

source env.sh

# ====== Install utilities ======

sudo -u $NONROOT yay -S alien_package_converter debtap

# ====== Update debtap ======

debtap -u
