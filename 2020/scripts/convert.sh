# Convert rpm to deb

mkdir pkg

sudo alien -d -c -v Maya/Packages/$(ls Maya/Packages/ | grep adlmapps | grep .rpm)
sudo alien -d -c -v Maya/Packages/$(ls Maya/Packages/ | grep adlmflexnetclient | grep .rpm)
sudo alien -d -c -v Maya/Packages/$(ls Maya/Packages/ | grep adlmflexnetserver | grep .rpm)
sudo alien -d -c -v Maya/Packages/$(ls Maya/Packages/ | grep adsklicensing | grep .rpm)
sudo alien -d -c -v Maya/Packages/$(ls Maya/Packages/ | grep Bifrost | grep .rpm)
sudo alien -d -c -v Maya/Packages/$(ls Maya/Packages/ | grep Maya2020 | grep .rpm)
sudo alien -d -c -v Maya/Packages/$(ls Maya/Packages/ | grep Substance | grep .rpm)

# Move deb packages to "pkg" folder

mv $(ls | grep adlmapps | grep .deb) pkg
mv $(ls | grep dlmflexnetclient | grep .deb) pkg
mv $(ls | grep adlmflexnetserver | grep .deb) pkg
mv $(ls | grep adsklicensing | grep .deb) pkg
mv $(ls | grep bifrost | grep .deb) pkg
mv $(ls | grep maya2020 | grep .deb) pkg
mv $(ls | grep substance | grep .deb) pkg

# Convert deb packages to zst

cd pkg

sudo debtap -Q $(ls | grep adlmapps | grep .deb)
sudo debtap -Q $(ls | grep adlmflexnetclient | grep .deb)
sudo debtap -Q $(ls | grep adlmflexnetserver | grep .deb)
sudo debtap -Q $(ls | grep adsklicensing | grep .deb)
sudo debtap -Q $(ls | grep bifrost | grep .deb)
sudo debtap -Q $(ls | grep maya2020 | grep .deb)
sudo debtap -Q $(ls | grep substance | grep .deb)

cd ..
