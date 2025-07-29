function vim_cache --wraps='rm -rf ~/.cache/nvim/' --description 'alias vim_cache rm -rf ~/.cache/nvim/'
  rm -rf ~/.cache/nvim/ $argv
        
end
