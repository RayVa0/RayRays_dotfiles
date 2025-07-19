function touchpad --wraps='hyprctl keyword "device[apple-spi-touchpad]:enabled"' --description 'alias touchpad hyprctl keyword "device[apple-spi-touchpad]:enabled"'
  hyprctl keyword "device[apple-spi-touchpad]:enabled" $argv
        
end
