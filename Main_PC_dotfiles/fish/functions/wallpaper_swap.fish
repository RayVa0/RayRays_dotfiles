function wallpaper_swap --wraps="wallp.py 1 (plocate ~/Pictures/Wallpapers/ | grep -iE '(jpeg|jpg|png)' | shuf -n 1)" --description "alias wallpaper_swap wallp.py 1 (plocate ~/Pictures/Wallpapers/ | grep -iE '(jpeg|jpg|png)' | shuf -n 1)"
  wallp.py 1 (plocate ~/Pictures/Wallpapers/ | grep -iE '(jpeg|jpg|png)' | shuf -n 1) $argv
        
end
