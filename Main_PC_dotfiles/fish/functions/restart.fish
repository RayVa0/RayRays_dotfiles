function restart 
  silence $argv
  #hyprctl dispatch exec $argv > /dev/null
  kitty -e $argv&
  exit
end
