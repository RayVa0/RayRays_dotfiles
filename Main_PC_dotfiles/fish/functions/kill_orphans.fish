function kill_orphans --wraps='yay -R (yay -Qdtq)' --description 'alias kill_orphans yay -R (yay -Qdtq)'
  yay -R (yay -Qdtq) $argv
        
end
