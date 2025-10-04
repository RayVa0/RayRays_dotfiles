function hdr-off --wraps='kscreen-doctor output.DP-2.hdr.disable && echo "Do not forget the color space adjustment!"' --description 'alias hdr-off kscreen-doctor output.DP-2.hdr.disable && echo "Do not forget the color space adjustment!"'
    kscreen-doctor output.DP-2.hdr.disable && echo "Do not forget the color space adjustment!" $argv
end
