function greetedit --wraps='nvim .config/fish/greet_text.txt' --wraps='nvim ~/.config/fish/greet_text.txt' --description 'alias greetedit nvim ~/.config/fish/greet_text.txt'
  nvim ~/.config/fish/greet_text.txt $argv
        
end
