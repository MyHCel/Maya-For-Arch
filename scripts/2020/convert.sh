#!/bin/bash

source env.sh

# ====== Convert rpm to deb ======

sudo -u $NONROOT mkdir pkg

alien -d -c -v Maya/Packages/$(ls Maya/Packages/ | grep adlmapps | grep .rpm)
alien -d -c -v Maya/Packages/$(ls Maya/Packages/ | grep adlmflexnetclient | grep .rpm)
alien -d -c -v Maya/Packages/$(ls Maya/Packages/ | grep adlmflexnetserver | grep .rpm)
alien -d -c -v Maya/Packages/$(ls Maya/Packages/ | grep adsklicensing | grep .rpm)
alien -d -c -v Maya/Packages/$(ls Maya/Packages/ | grep Bifrost | grep .rpm)
alien -d -c -v Maya/Packages/$(ls Maya/Packages/ | grep Maya2020 | grep .rpm)
alien -d -c -v Maya/Packages/$(ls Maya/Packages/ | grep Substance | grep .rpm)

# ====== Move deb packages to "pkg" folder ======

mv $(ls | grep adlmapps | grep .deb) pkg
mv $(ls | grep adlmflexnetclient | grep .deb) pkg
mv $(ls | grep adlmflexnetserver | grep .deb) pkg
mv $(ls | grep adsklicensing | grep .deb) pkg
mv $(ls | grep bifrost | grep .deb) pkg
mv $(ls | grep maya2020 | grep .deb) pkg
mv $(ls | grep substance | grep .deb) pkg

# ====== Convert deb packages to zst ======

cd pkg

debtap -Q $(ls | grep adlmapps | grep .deb)
debtap -Q $(ls | grep adlmflexnetclient | grep .deb)
debtap -Q $(ls | grep adlmflexnetserver | grep .deb)
debtap -Q $(ls | grep adsklicensing | grep .deb)
debtap -Q $(ls | grep bifrost | grep .deb)
debtap -Q $(ls | grep maya2020 | grep .deb)
debtap -Q $(ls | grep substance | grep .deb)

cd ..