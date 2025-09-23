#!/usr/bin/env fish 



loginctl lock-session
kdotool set_desktop 1
#plasma-apply-wallpaperimage (plocate /home/ray/Pictures/Wallpapers/ | grep -iE '(jpeg|jpg|png)' | shuf -n 1)

net #check for network

sh ~/Templates/auto_minimize.sh steam-native&
sh ~/Templates/run.sh qbittorrent&
sh ~/Templates/auto_minimize.sh element-desktop&
sh ~/Templates/auto_minimize.sh waterfox&
sh ~/Templates/auto_minimize.sh spotify&
auto_minimize.sh vesktop

update_dotfiles

exit 0
