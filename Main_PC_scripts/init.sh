#!/usr/bin/env bash


echo Checking pacman 
out_of_date=$(pacman -Qqu | wc -l)

echo Cheching internet connection
ping archlinux.org -c 1 >/dev/null 2>&1


if [ $? -gt 0 ]; then
  echo -e "\e[31mNo internet dumbass!!!\e[0m"
  sleep 3
fi

if [ $out_of_date -gt 32 ]; then 
  yay
  yay -Scc
fi

echo -e "\n\e[1;32mWelcome $USER\e[0m"

/usr/lib/plasma-dbus-run-session-if-needed /usr/bin/startplasma-wayland
