function yt-dlp-sub --wraps='yt-dlp --embed-subs --sub-langs "en.*" --merge-output-format mkv' --description 'alias yt-dlp-sub yt-dlp --embed-subs --sub-langs "en.*" --merge-output-format mkv'
  yt-dlp --embed-subs --sub-langs "en.*" --merge-output-format mkv $argv
        
end
