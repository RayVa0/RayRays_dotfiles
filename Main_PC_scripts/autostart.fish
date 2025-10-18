#!/usr/bin/env fish 



loginctl lock-session 
casual_display.fish
CRT-off
kdotool set_desktop 1 
#plasma-apply-wallpaperimage (plocate /home/ray/Pictures/Wallpapers/ | grep -iE '(jpeg|jpg|png)' | shuf -n 1)

net #check for network

auto_minimize.sh steam-native&
run.sh qbittorrent&
auto_minimize.sh element-desktop&
auto_minimize.sh waterfox&
auto_minimize.sh spotify&
auto_minimize.sh vesktop&

set hour (date "+%H")
if test $hour -le 5;  or test $hour -ge 22
  night_light.fish
else
  day_light.fish
end


#update_dotfiles -q

exit 0
