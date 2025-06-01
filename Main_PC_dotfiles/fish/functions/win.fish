function win
  while true 
    read -l -P 'Are you sure you want to reboot into windows 11[Y/n]?' ans

    switch $ans
      case Y y ''
        sudo grub-reboot 2
        kdereboot
      case N n
        echo Aborting, we live to dance in the GNU light another day
        break 

    end
  end
end
