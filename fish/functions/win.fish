function win
  while true 
    read -l -P 'Are you sure you want to reboot into windows 11?' ans

    switch $ans
      case Y y
        sudo grub-reboot 2
        reboot
      case '' N n
        echo Aborting
        break
    end
  end
end
