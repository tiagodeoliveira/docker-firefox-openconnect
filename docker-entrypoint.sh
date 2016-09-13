#!/bin/bash

set -e

if [ "$1" != "bash" ]; then
  echo 'Starting OpenConnect'
  config_file="${HOME}/openconnect.conf"

  if [ -f "$config_file" ]; then
    username=`grep "user" "$config_file" | cut -d'=' -f2`
    address=`grep "address" "$config_file" | cut -d'=' -f2`
  else
    read -p "Address: " address
    read -p "Username: " username
    echo "address=$address" > "$config_file"
    echo "user=$username" >> "$config_file"
  fi

  # read -p "Password: " -s main_password
  # echo ""
  # read -p "2fa password: " -s second_password
  #
  # LOG_PATH=${HOME}/vpn.log
  # rm -f $LOG_PATH

  openconnect -u $username -b $address
  echo 'Started OpenConnect!'

  /usr/bin/firefox
else
  exec $@
fi
