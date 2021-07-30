#!/bin/bash

sudo cp lib/libcrypto.so.1.0.2o /usr/autodesk/maya2020/lib/
sudo cp lib/libcrypto.so.10 /usr/autodesk/maya2020/lib/

sudo cp lib/libssl.so.1.0.2o /usr/autodesk/maya2020/lib/
sudo cp lib/libssl.so.10 /usr/autodesk/maya2020/lib/

sudo ln -s /usr/lib/libGL.so.1 /usr/autodesk/maya2020/lib/libGL.so
