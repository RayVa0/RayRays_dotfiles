function CRT-on --wraps='kscreen-doctor output.HDMI-A-1.disable' --wraps='kscreen-doctor output.HDMI-A-1.enable' --description 'alias CRT-on kscreen-doctor output.HDMI-A-1.enable'
  kscreen-doctor output.HDMI-A-1.enable $argv
        
end
