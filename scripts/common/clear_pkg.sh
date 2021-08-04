#!/bin/bash

echo -e "\n Clear converted packages? [Y/N]"

read INPUT

case $INPUT in

   y | Y)
      rm -r pkg
      ;;

   *)
      echo " "
      ;;
esac
