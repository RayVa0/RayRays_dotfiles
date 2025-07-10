cp -r ~/.config/Thunar/ ~/.config/kitty/ ~/.config/unifetch/ ~/.config/fish ~/.config/hypr ~/.config/mpv -t ~/Downloads/RayRays_dotfiles/Main_PC_dotfiles/
cp ~/Templates/* -t ~/Downloads/RayRays_dotfiles/Main_PC_scripts/

cd ~/Downloads/RayRays_dotfiles/Main_PC_dotfiles/
konsave --save ray --force 

cd ~/Downloads/RayRays_dotfiles/

cd ~/Downloads/RayRays_dotfiles/Main_PC_dotfiles/
rm *.knsv
konsave -e ray 

cd ~/Downloads/RayRays_dotfiles/

git add *
git diff --cached --quiet
if test $status -ne 0
    git commit -m "scripted push"
    git push
end

if test $status -ne 0
  exit 1
end
