#!/bin/bash

/opt/Autodesk/AdskLicensing/Current/helper/AdskLicensingInstHelper register -pk 657N1 -pv 2022.0.0.F -el en_us -cf /var/opt/Autodesk/Adlm/Maya2022/MayaConfig.pit
/opt/Autodesk/Adlm/FLEXnet/bin/toolkitinstall.sh
/opt/Autodesk/Adlm/FLEXnet/bin/install_fnp.sh /opt/Autodesk/Adlm/FLEXnet/bin/FNPLicensingService
