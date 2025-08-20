#!/usr/bin/env bash

#ping archlinux.org -c 2 >/dev/null 2>&1


#if [ $? -gt 0 ]; then
#  echo -e "\e[31mNo internet dumbass!!!\e[0m"
#  sleep 3
#fi

#echo -e "\e[1;32mWelcome $USER\e[0m"

if [ $innit -ne 1 ]; then 
  /usr/lib/plasma-dbus-run-session-if-needed /usr/bin/startplasma-wayland
  export innit=1
fi
