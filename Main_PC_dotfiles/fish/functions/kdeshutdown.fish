function kdeshutdown --wraps='qdbus6 org.kde.Shutdown /Shutdown logoutAndShutdown' --wraps='killall steam -9 && qdbus6 org.kde.Shutdown /Shutdown logoutAndShutdown' --description 'alias kdeshutdown killall steam -9 && qdbus6 org.kde.Shutdown /Shutdown logoutAndShutdown'
  killall steam -9 && qdbus6 org.kde.Shutdown /Shutdown logoutAndShutdown $argv
        
end
