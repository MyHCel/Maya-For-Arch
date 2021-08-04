#!/bin/bash

# ====== Delete DEB packages ======

cd pkg

rm -r $(ls | grep adlmapps | grep .deb)
rm -r $(ls | grep adlmflexnetclient | grep .deb)
rm -r $(ls | grep adlmflexnetserver | grep .deb)
rm -r $(ls | grep adsklicensing | grep .deb)
rm -r $(ls | grep bifrost | grep .deb)
rm -r $(ls | grep maya2020 | grep .deb)
rm -r $(ls | grep substance | grep .deb)

cd ..

# ====== Delete Maya folder ======

rm -r Maya
