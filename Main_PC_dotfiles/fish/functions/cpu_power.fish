function cpu_power --wraps='sudo turbostat --Summary --quiet --show Busy%,Avg_MHz,PkgTmp,PkgWatt --interval 1' --wraps='sudo turbostat --Summary --quiet --show Busy%,PkgWatt --interval 1' --description 'alias cpu_power sudo turbostat --Summary --quiet --show Busy%,PkgWatt --interval 1'
  sudo turbostat --Summary --quiet --show Busy%,PkgWatt --interval 1 $argv
        
end
