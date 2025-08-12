#!/usr/bin/env bash 

loginctl lock-session

sh ~/Templates/auto_minimize.sh steam-native&
sh ~/Templates/auto_minimize.sh waterfox& 
sh ~/Templates/auto_minimize.sh spotify&
sh ~/Templates/run.sh qbittorrent&
sh ~/Templates/auto_minimize.sh viber&
sleep 1
sh ~/Templates/auto_minimize.sh element-desktop&
sh ~/Templates/auto_minimize.sh vesktop&

exit 0
