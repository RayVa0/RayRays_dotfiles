function overclock --wraps='nvidia_oc set --index 0 --freq-offset 150 --mem-offset 0' --description 'alias overclock nvidia_oc set --index 0 --freq-offset 150 --mem-offset 0'
    nvidia_oc set --index 0 --freq-offset 150 --mem-offset 0 $argv
end
