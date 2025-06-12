function kdereboot --wraps='qdbus6 org.kde.Shutdown /Shutdown logoutAndReboot' --wraps='killall steam -9 && qdbus6 org.kde.Shutdown /Shutdown logoutAndReboot' --wraps='killall steam && killall vesktop && qdbus6 org.kde.Shutdown /Shutdown logoutAndReboot' --description 'alias kdereboot killall steam && killall vesktop && qdbus6 org.kde.Shutdown /Shutdown logoutAndReboot'
  killall steam && killall vesktop && qdbus6 org.kde.Shutdown /Shutdown logoutAndReboot $argv
        
end
