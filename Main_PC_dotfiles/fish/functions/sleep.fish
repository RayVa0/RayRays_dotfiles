function sleep --wraps='systemctl suspend' --description 'alias sleep systemctl suspend'
  systemctl suspend $argv
  
        
end
