function disk_analyze --wraps='sudo qdirstat' --description 'alias disk_analyze sudo qdirstat'
  sudo qdirstat $argv
        
end
