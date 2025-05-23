function runl --wraps='hyprctl dispatch exec $argv > /dev/null' --description 'alias runl hyprctl dispatch exec $argv > /dev/null'
  hyprctl dispatch exec $argv > /dev/null $argv
        
end
