#!/usr/bin/env bash

echo -e "\n\e[1;32mWelcome $USER\e[0m"

out_of_date=$(pacman -Qqu | wc -l)

if [ $out_of_date -gt 32 ]; then 
  yay
  yay -Scc
fi

/usr/lib/plasma-dbus-run-session-if-needed /usr/bin/startplasma-wayland
