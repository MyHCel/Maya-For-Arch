#!/bin/bash

# ====== Add entries to Maya.env ======

echo -e "MAYA_OPENCL_IGNORE_DRIVER_VERSION=1\nMAYA_CM_DISABLE_ERROR_POPUPS=1\nMAYA_COLOR_MGT_NO_LOGGING=1\nTMPDIR=/tmp" >> $HOME/maya/2022/Maya.env