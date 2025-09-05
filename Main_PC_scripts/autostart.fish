#!/usr/bin/env fish 



loginctl lock-session
kdotool set_desktop 1

plasma-apply-wallpaperimage (find /home/ray/Pictures/Wallpapers/ | shuf -n 1)
sh ~/Templates/auto_minimize.sh steam-native&
sh ~/Templates/run.sh qbittorrent&
sh ~/Templates/auto_minimize.sh element-desktop&
sh ~/Templates/auto_minimize.sh waterfox&
sh ~/Templates/auto_minimize.sh spotify&

pinging && update_dotfiles

exit 0
