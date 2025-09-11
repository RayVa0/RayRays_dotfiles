function wallpaper_swap --wraps="plasma-apply-wallpaperimage (plocate ~/Pictures/Wallpapers/ | grep -iE '(jpeg|jpg|png)')" --wraps="plasma-apply-wallpaperimage (plocate ~/Pictures/Wallpapers/ | grep -iE '(jpeg|jpg|png)' | shuf -n 1)" --description "alias wallpaper_swap plasma-apply-wallpaperimage (plocate ~/Pictures/Wallpapers/ | grep -iE '(jpeg|jpg|png)' | shuf -n 1)"
  plasma-apply-wallpaperimage (plocate ~/Pictures/Wallpapers/ | grep -iE '(jpeg|jpg|png)' | shuf -n 1) $argv
        
end
