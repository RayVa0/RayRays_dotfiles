cp -r ~/.config/nvim/ ~/.config/Thunar/ ~/.config/kitty/ ~/.config/unifetch/ ~/.config/fish ~/.config/hypr ~/.config/mpv -t ~/Downloads/RayRays_dotfiles/Main_PC_dotfiles/
cp ~/Templates/* -t ~/Downloads/RayRays_dotfiles/Main_PC_scripts/

cd ~/Downloads/RayRays_dotfiles/Main_PC_dotfiles/
konsave --save ray --force 

if test $status -ne 0
  set_color red; echo konsave save fail 
  exit 1
end

cd ~/Downloads/RayRays_dotfiles/

cd ~/Downloads/RayRays_dotfiles/Main_PC_dotfiles/
rm *.knsv
konsave -e ray

if test $status -ne 0
  set_color red; echo konsave export fail
  exit 1
end

cd ~/Downloads/RayRays_dotfiles/

git add *
git diff --cached --quiet
if test $status -ne 0
    git commit -m "scripted push"
    git push
end

if test $status -ne 0
  set_color red; echo git fail 
  exit 1
end
