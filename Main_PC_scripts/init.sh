#!/usr/bin/env bash

echo -e "\n\e[1;32mWelcome $USER\e[0m"

if [ $(date +"%A") = "Saturday" ]; then 
  yay
  yay -Scc
fi

/usr/lib/plasma-dbus-run-session-if-needed /usr/bin/startplasma-wayland
