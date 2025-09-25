function soft_kdekill --wraps='loginctl terminate-seat seat0' --description 'alias soft_kdekill loginctl terminate-seat seat0'
  loginctl terminate-seat seat0 $argv
        
end
