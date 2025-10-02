function vrr-off --wraps='kscreen-doctor output.2.vrrpolicy.never' --wraps='kscreen-doctor output.2.vrrpolicy.never 2&>/dev/null' --wraps='kscreen-doctor output.DP-2.vrrpolicy.never' --description 'alias vrr-off kscreen-doctor output.DP-2.vrrpolicy.never'
    kscreen-doctor output.DP-2.vrrpolicy.never $argv
end
