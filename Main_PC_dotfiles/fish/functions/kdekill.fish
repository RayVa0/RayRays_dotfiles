function kdekill --wraps='loginctl terminate-user ray' --description 'alias kdekill loginctl terminate-user ray'
  loginctl terminate-user ray $argv
        
end
