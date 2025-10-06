function ping_aur --wraps='ping aur.archlinux.org -c 1' --description 'alias ping_aur ping aur.archlinux.org -c 1'
    ping aur.archlinux.org -c 1 $argv
end
