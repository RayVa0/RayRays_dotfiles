function kdeshutdown --wraps='killall steam && killall Discord && qdbus6 org.kde.Shutdown /Shutdown logoutAndShutdown' --wraps='killall steam && killall vesktop && qdbus6 org.kde.Shutdown /Shutdown logoutAndShutdown' --description 'alias kdeshutdown killall steam && killall vesktop && qdbus6 org.kde.Shutdown /Shutdown logoutAndShutdown'
  killall steam && killall vesktop && qdbus6 org.kde.Shutdown /Shutdown logoutAndShutdown $argv
        
end
