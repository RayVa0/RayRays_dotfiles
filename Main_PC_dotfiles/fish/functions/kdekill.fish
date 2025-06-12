function kdekill --wraps='qdbus org.kde.Shutdown /Shutdown logout' --wraps='qdbus6 org.kde.Shutdown /Shutdown logout' --wraps='killall steam && killall vesktop && qdbus6 org.kde.Shutdown /Shutdown logout' --description 'alias kdekill killall steam && killall vesktop && qdbus6 org.kde.Shutdown /Shutdown logout'
  killall steam && killall vesktop && qdbus6 org.kde.Shutdown /Shutdown logout $argv
        
end
