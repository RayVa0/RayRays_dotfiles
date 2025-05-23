cd ~/.config
cp -r fish/ fastfetch/ hypr/ KDE/ mpv/ -t ~/Downloads/RayRays_dotfiles/

cd ~/Templates/ 
cp -r * ~/Downloads/RayRays_dotfiles/Main_PC_scripts/ 

cd ~/Downloads/RayRays_dotfiles/
git add *
git commit -m 'Generic dotfiles update from main PC'
git push
