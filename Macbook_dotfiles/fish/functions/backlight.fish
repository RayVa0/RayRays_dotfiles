function backlight --wraps='xbacklight -set' --wraps='sudo xbacklight -set' --description 'alias backlight sudo xbacklight -set'
  sudo xbacklight -set $argv
        
end
