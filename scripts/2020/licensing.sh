#!/bin/bash

VERSION=$(ls /opt/Autodesk/AdskLicensing)

/opt/Autodesk/AdskLicensing/$VERSION/helper/AdskLicensingInstHelper register -pk 657L1 -pv 2020.0.0.F -el EN_US -cf /var/opt/Autodesk/Adlm/Maya2020/MayaConfig.pit
/opt/Autodesk/Adlm/FLEXnet/bin/toolkitinstall.sh
/opt/Autodesk/Adlm/FLEXnet/bin/install_fnp.sh /opt/Autodesk/Adlm/FLEXnet/bin/FNPLicensingService
