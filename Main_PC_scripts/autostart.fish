#!/usr/bin/env fish 


casual_display.fish
hdr-off
CRT-off
loginctl lock-session&
kdotool set_desktop 1
#plasma-apply-wallpaperimage (plocate /home/ray/Pictures/Wallpapers/ | grep -iE '(jpeg|jpg|png)' | shuf -n 1)

net #check for network

sh ~/Templates/auto_minimize.sh steam-native&
sh ~/Templates/run.sh qbittorrent&
sh ~/Templates/auto_minimize.sh element-desktop&
sh ~/Templates/auto_minimize.sh waterfox&
sh ~/Templates/auto_minimize.sh spotify&

set hour (date "+%H")
if test $hour -le 5;  or test $hour -ge 22
  night_light.fish&
else
  day_light.fish&
end

sleep 3
auto_minimize.sh vesktop&

update_dotfiles

exit 0
