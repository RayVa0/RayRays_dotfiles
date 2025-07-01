function kdeshutdown --wraps='qdbus6 org.kde.Shutdown /Shutdown logoutAndShutdown' --description 'alias kdeshutdown qdbus6 org.kde.Shutdown /Shutdown logoutAndShutdown'
  qdbus6 org.kde.Shutdown /Shutdown logoutAndShutdown $argv
        
end
