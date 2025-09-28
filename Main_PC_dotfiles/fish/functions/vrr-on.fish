function vrr-on --wraps='kscreen-doctor output.2.vrrpolicy.automatic' --wraps='kscreen-doctor output.2.vrrpolicy.automatic 2&>/dev/null' --description 'alias vrr-on kscreen-doctor output.2.vrrpolicy.automatic 2&>/dev/null'
  kscreen-doctor output.2.vrrpolicy.automatic 2&>/dev/null $argv
        
end
