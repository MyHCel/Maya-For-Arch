#!/bin/bash

# ====== Move libraries to Maya's lib folder ======

cp lib/libcrypto.so.1.0.2o /usr/autodesk/maya2020/lib/
cp lib/libcrypto.so.10 /usr/autodesk/maya2020/lib/
cp lib/libssl.so.1.0.2o /usr/autodesk/maya2020/lib/
cp lib/libssl.so.10 /usr/autodesk/maya2020/lib/

# ====== Link libGL to Maya's lib folder ======

ln -s /usr/lib/libGL.so.1 /usr/autodesk/maya2020/lib/libGL.so
