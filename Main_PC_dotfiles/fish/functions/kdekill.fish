function kdekill --wraps='killall steam && qdbus6 org.kde.Shutdown /Shutdown logout' --wraps='qdbus6 org.kde.Shutdown /Shutdown logout' --description 'alias kdekill qdbus6 org.kde.Shutdown /Shutdown logout'
  qdbus6 org.kde.Shutdown /Shutdown logout $argv
        
end
