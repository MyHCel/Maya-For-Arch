#!/bin/bash

source env.sh

echo -e "\n Select the version you want to install"
echo -e "\n [1] Maya 2020\n [2] Maya 2022\n"

read MAYA_VERSION

case $MAYA_VERSION in

   1 | 2020)
      sudo -u $NONROOT ./scripts/2020/dependencies.sh
      ./scripts/common/utilities.sh
      sudo -u $NONROOT ./scripts/common/extract.sh
      ./scripts/2020/convert.sh
      ./scripts/2020/install_pkg.sh
      ./scripts/2020/libs.sh
      ./scripts/common/adsk_licensing.sh
      ./scripts/2020/licensing.sh
      ./scripts/2020/mtoa.sh
      sudo -u $NONROOT maya
      sudo -u $NONROOT ./scripts/2020/fix.sh
      ./scripts/2020/clear.sh
      ;;

   2 | 2022)
      sudo -u $NONROOT ./scripts/2022/dependencies.sh
      ./scripts/common/utilities.sh
      sudo -u $NONROOT ./scripts/common/extract.sh
      ./scripts/2022/convert.sh
      ./scripts/2022/install_pkg.sh
      ./scripts/2022/libs.sh
      ./scripts/common/adsk_licensing.sh
      ./scripts/2022/licensing.sh
      ./scripts/2022/mtoa.sh
      sudo -u $NONROOT maya
      sudo -u $NONROOT ./scripts/2022/fix.sh
      ./scripts/2022/clear.sh
      ;;
   *)
      echo "Bruh\n"
      ;;
esac

./scripts/common/clear_pkg.sh

exit

echo "Done C;"
