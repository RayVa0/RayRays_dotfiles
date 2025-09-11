function kill_orphans --wraps='yay -R (yay -Qdtq)' --wraps='yay -Rddns (yay -Qdtq)' --description 'alias kill_orphans yay -Rddns (yay -Qdtq)'
  yay -Rddns (yay -Qdtq) $argv
        
end
