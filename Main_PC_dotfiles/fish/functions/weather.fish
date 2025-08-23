function weather --wraps='curl wttr.in/?0?q?T' --wraps='curl wttr.in' --description 'alias weather curl wttr.in/?0?q?T'
  curl wttr.in/?0?q?T $argv
        
end
