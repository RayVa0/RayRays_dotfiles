function kdekill --wraps='qdbus6 org.kde.Shutdown /Shutdown logout' --wraps='loginctl terminate-user (whoami)' --description 'alias kdekill loginctl terminate-user (whoami)'
  loginctl terminate-user (whoami) $argv
        
end
