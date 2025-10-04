function hdr-on --wraps='kscreen-doctor output.DP-2.hdr.enable' --wraps='kscreen-doctor output.DP-2.hdr.enable && echo "Do not foget the color space adjustment!"' --description 'alias hdr-on kscreen-doctor output.DP-2.hdr.enable && echo "Do not foget the color space adjustment!"'
    kscreen-doctor output.DP-2.hdr.enable && echo "Do not foget the color space adjustment!" $argv
end
