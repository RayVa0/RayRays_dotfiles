function clear --wraps='command clear && fish_greeting' --description 'alias clear command clear && fish_greeting'
  command clear && fish_greeting $argv
        
end
