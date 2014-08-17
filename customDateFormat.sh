#!/bin/bash
echo -e "\n **********************************************"
echo -e   " *** Welcome to time format setting script. ***"
echo -e   " **********************************************\n"

# Check if is Ubuntu, if not prompt if want to continue, else terminate
IsUbuntu=`uname -a | grep Ubuntu | wc -l`
if [ "$IsUbuntu" -eq 0 ]; then
  while true; do
    read -p "This script is intended for Ubuntu operating system. Do you want to continue anyway? [y/N]" YN
    case $YN in
      [Yy]* ) echo "Continuing..."; break;;
      * ) echo "Exiting..."; exit;;
    esac
  done
fi

echo "Time format must be compatible with strftime."
echo "You can look it up here - http://www.cplusplus.com/reference/ctime/strftime/"

read -p "Specify date format: " Format

# TODO: Could check if format is valid

if [ "$Format" = "" ]; then
  Format="%a, %d/%m/%Y, %H:%M:%S"
  echo "Format not specified."
  echo "Using default format: $Format"
fi

echo "Setting time format type to custom..."
gsettings set com.canonical.indicator.datetime time-format "'custom'"

echo "Setting time format to $Format"
gsettings set com.canonical.indicator.datetime custom-time-format "'$Format'"

echo "Done."
