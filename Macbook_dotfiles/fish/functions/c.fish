function c --wraps=clear --wraps='clear && fish_greeting' --wraps='clear && fish_greeting && fastfetch' --description 'alias c clear && fish_greeting'
  clear && fish_greeting $argv
        
end
