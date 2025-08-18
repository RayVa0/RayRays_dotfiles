#!/usr/bin/env bash 



loginctl lock-session
kdotool set_desktop 1

sh ~/Templates/auto_minimize.sh steam-native&
sleep 0.1
sh ~/Templates/run.sh qbittorrent&
sleep 0.1
sh ~/Templates/auto_minimize.sh element-desktop
sh ~/Templates/auto_minimize.sh waterfox
sh ~/Templates/auto_minimize.sh spotify


exit 0

