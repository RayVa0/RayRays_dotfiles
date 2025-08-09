cd ~/Downloads/RayRays_dotfiles/
git pull

if test $status -ne 0
  set_color red; echo Git Pull error, not doing anything
  exit 1
end

rm ~/Downloads/RayRays_dotfiles/Macbook_dotfiles/* -rf
cp -r ~/.config/nvim/ ~/.config/Thunar/ ~/.config/kitty/ ~/.config/unifetch/ ~/.config/fish ~/.config/hypr ~/.config/mpv -t ~/Downloads/RayRays_dotfiles/Macbook_dotfiles/
rm ~/Downloads/RayRays_dotfiles/Macbook_scripts/* -rf
cp ~/Templates/* -t ~/Downloads/RayRays_dotfiles/Macbook_scripts/

yay -Qe > ~/Downloads/RayRays_dotfiles/Macbook_dotfiles/MacBook_explicit_packages

cd ~/Downloads/RayRays_dotfiles/Macbook_dotfiles/
konsave --save raymac --force 

if test $status -ne 0
  set_color red; echo konsave save fail 
  exit 1
end

cd ~/Downloads/RayRays_dotfiles/Macbook_dotfiles/
konsave -e raymac

if test $status -ne 0
  set_color red; echo konsave export fail
  exit 1
end

cd ~/Downloads/RayRays_dotfiles/

set date (date "+%s")

git add *
git diff --cached --quiet
if test $status -ne 0
    git commit -m "scripted push at UNIX epoch time $date from MacBook Pro"
    git push
end

if test $status -ne 0
  set_color red; echo git fail 
  exit 1
end
