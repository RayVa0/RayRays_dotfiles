function vrr-on --wraps='kscreen-doctor output.2.vrrpolicy.automatic' --wraps='kscreen-doctor output.2.vrrpolicy.automatic 2&>/dev/null' --wraps='kscreen-doctor output.DP-2.vrrpolicy.automatic' --description 'alias vrr-on kscreen-doctor output.DP-2.vrrpolicy.automatic'
    kscreen-doctor output.DP-2.vrrpolicy.automatic $argv
end
