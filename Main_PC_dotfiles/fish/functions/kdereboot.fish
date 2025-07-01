function kdereboot --wraps='qdbus6 org.kde.Shutdown /Shutdown logoutAndReboot' --description 'alias kdereboot qdbus6 org.kde.Shutdown /Shutdown logoutAndReboot'
  qdbus6 org.kde.Shutdown /Shutdown logoutAndReboot $argv
        
end
