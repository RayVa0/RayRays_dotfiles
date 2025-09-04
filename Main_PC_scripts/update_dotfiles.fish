#!/usr/bin/env fish



set_color yellow; echo -Git pull-
set_color normal  
cd ~/Downloads/RayRays_dotfiles/
git pull

if test $status -ne 0
  set_color red; echo git pull failed not doing anything
  exit 1
end

set_color yellow; echo -dotfiles being copied-
set_color normal  
cp -r ~/.config/sway/ ~/.config/fastfetch/ ~/.config/nvim/ ~/.config/ray.knsv ~/.config/qBittorrent/ ~/.config/dolphinrc ~/.config/kitty/ ~/.config/unifetch/ ~/.config/fish ~/.config/hypr ~/.config/mpv -t ~/Downloads/RayRays_dotfiles/Main_PC_dotfiles/

set_color yellow; echo -scripts being copied-
set_color normal  
cp ~/Templates/* -t ~/Downloads/RayRays_dotfiles/Main_PC_scripts/

cp -r ~/Documents/useful_stuff/ -t ~/Downloads/RayRays_dotfiles/Misc/

cd ~/Downloads/RayRays_dotfiles/

set_color yellow; echo -package list text file-
set_color normal  
yay -Qe > ~/Downloads/RayRays_dotfiles/Main_PC_dotfiles/explicitly_installed_packages.txt
yay -Qe > ~/Downloads/RayRays_dotfiles/Main_PC_dotfiles/installed_packages.txt

set date (date)

set_color yellow; echo -finally pushing to git-
set_color normal  
git add *
git diff --cached --quiet 
if test $status -ne 0
    git commit -m "$date from Ada(script)"
    git push
end

if test $status -ne 0
  set_color red; echo git fail(commit or push)
  exit 1
else
  set_color 00ff00; echo OK
end

#this is a comment
