function kdereboot --wraps='qdbus6 org.kde.Shutdown /Shutdown logoutAndReboot' --wraps='killall steam -9 && qdbus6 org.kde.Shutdown /Shutdown logoutAndReboot' --description 'alias kdereboot killall steam -9 && qdbus6 org.kde.Shutdown /Shutdown logoutAndReboot'
  killall steam -9 && qdbus6 org.kde.Shutdown /Shutdown logoutAndReboot $argv
        
end
