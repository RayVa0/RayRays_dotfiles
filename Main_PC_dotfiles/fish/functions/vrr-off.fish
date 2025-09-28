function vrr-off --wraps='kscreen-doctor output.2.vrrpolicy.never' --wraps='kscreen-doctor output.2.vrrpolicy.never 2&>/dev/null' --description 'alias vrr-off kscreen-doctor output.2.vrrpolicy.never 2&>/dev/null'
  kscreen-doctor output.2.vrrpolicy.never 2&>/dev/null $argv
        
end
