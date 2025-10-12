function overclock --wraps='nvidia_oc set --index 0 --freq-offset 200 --mem-offset 100' --description 'alias overclock nvidia_oc set --index 0 --freq-offset 200 --mem-offset 100'
    nvidia_oc set --index 0 --freq-offset 200 --mem-offset 100 $argv
end
