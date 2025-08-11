#!/usr/bin/env bash 


sh ~/Templates/auto_minimize.sh element-desktop&
sh ~/Templates/auto_minimize.sh steam-native&
sh ~/Templates/auto_minimize.sh waterfox& 
sh ~/Templates/auto_minimize.sh spotify&
sh ~/Templates/run.sh qbittorrent&
sh ~/Templates/auto_minimize.sh viber&
sleep 2
sh ~/Templates/auto_minimize.sh vesktop&

loginctl lock-session

exit 0
