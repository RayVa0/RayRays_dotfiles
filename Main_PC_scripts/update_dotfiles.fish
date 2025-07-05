cp -r ~/.config/Thunar/ ~/.config/kitty/ ~/.config/fastfetch/ ~/.config/fish ~/.config/hypr ~/.config/mpv -t ~/Downloads/RayRays_dotfiles/Main_PC_dotfiles/
cp ~/Templates/* -t ~/Downloads/RayRays_dotfiles/Main_PC_scripts/

cd ~/Downloads/RayRays_dotfiles/Main_PC_dotfiles/
konsave --save ray --force   

cd ~/Downloads/RayRays_dotfiles/

git add * 
git commit -m "script push"
git push
