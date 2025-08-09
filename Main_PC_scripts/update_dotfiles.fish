#!/usr/bin/env fish


set_color yellow; echo -Network test-
set_color normal  
ping archlinux.org -c 1

if test $status -ne 0
  set_color red; echo No network not doing anything 
  exit 1
end 

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
rm -rf ~/Downloads/RayRays_dotfiles/Main_PC_dotfiles/*
cp -r ~/.config/nvim/ ~/.config/qBittorrent/ ~/.config/ghb/ ~/.config/dolphinrc ~/.config/kitty/ ~/.config/unifetch/ ~/.config/fish ~/.config/hypr ~/.config/mpv -t ~/Downloads/RayRays_dotfiles/Main_PC_dotfiles/

set_color yellow; echo -scripts being copied-
set_color normal  
rm -rf ~/Downloads/RayRays_dotfiles/Main_PC_scripts/*
cp ~/Templates/* -t ~/Downloads/RayRays_dotfiles/Main_PC_scripts/

set_color yellow; echo -konsave-
set_color normal  
cd ~/Downloads/RayRays_dotfiles/Main_PC_dotfiles/
konsave --save ray --force 

if test $status -ne 0
  set_color red; echo konsave save fail 
  exit 1
end

set_color yellow; echo -konsave export-
set_color normal  
cd ~/Downloads/RayRays_dotfiles/Main_PC_dotfiles/
konsave -e ray

if test $status -ne 0
  set_color red; echo konsave export fail
  exit 1
end

cd ~/Downloads/RayRays_dotfiles/

set_color yellow; echo -package list text file-
set_color normal  
yay -Qe > ~/Downloads/RayRays_dotfiles/Main_PC_dotfiles/explicitly_installed_packages.txt

set date (date "+%s")

set_color yellow; echo -finally pushing to git-
set_color normal  
git add *
git diff --cached --quiet 
if test $status -ne 0
    git commit -m "scripted push at UNIX epoch time: $date from Ada"
    git push
end

if test $status -ne 0
  set_color red; echo git fail(commit or push)
  exit 1
else
  set_color 00ff00; echo OK
end

#this is a comment
