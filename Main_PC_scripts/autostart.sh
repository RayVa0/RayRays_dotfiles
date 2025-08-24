#!/usr/bin/env bash 



loginctl lock-session
kdotool set_desktop 1

sh ~/Templates/auto_minimize.sh steam-native&
sleep 0.1
sh ~/Templates/run.sh qbittorrent&
sleep 0.1
sh ~/Templates/auto_minimize.sh element-desktop&
sleep 0.1
sh ~/Templates/auto_minimize.sh waterfox&
sleep 0.1
sh ~/Templates/auto_minimize.sh spotify&
sleep 0.1
sh ~/Templates/auto_minimize.sh easyeffects




exit 0

