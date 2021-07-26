#!/bin/bash

VERSION=$(ls /opt/Autodesk/AdskLicensing)

sudo /opt/Autodesk/AdskLicensing/$VERSION/helper/AdskLicensingInstHelper register -pk 657L1 -pv 2020.0.0.F -el EN_US -cf /var/opt/Autodesk/Adlm/Maya2020/MayaConfig.pit
sudo /opt/Autodesk/Adlm/FLEXnet/bin/toolkitinstall.sh
sudo /opt/Autodesk/Adlm/FLEXnet/bin/install_fnp.sh /opt/Autodesk/Adlm/FLEXnet/bin/FNPLicensingService
