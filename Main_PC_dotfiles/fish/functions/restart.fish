function restart 
  silence $argv
  hyprctl dispatch exec $argv > /dev/null
  exit
end
