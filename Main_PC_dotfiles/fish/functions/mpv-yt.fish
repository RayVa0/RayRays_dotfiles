function mpv-yt --wraps='mpv --cache-secs=256' --wraps='mpv --cache-secs=1000' --description 'alias mpv-yt mpv --cache-secs=1000'
  mpv --cache-secs=1000 $argv
        
end
