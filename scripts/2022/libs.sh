#!/bin/bash

# ====== Link libraries to Maya's lib folder ======

ln -s /usr/lib/libcrypto.so.1.1 /usr/autodesk/maya2022/lib/libcrypto.so.10
ln -s /usr/lib/libssl.so.1.1 /usr/autodesk/maya2022/lib/libssl.so.10
ln -s /usr/lib/libGL.so.1 /usr/autodesk/maya2022/lib/libGL.so

# ====== Create libmd.so into lib folder ======

touch /usr/autodesk/maya2022/lib/libmd.so
