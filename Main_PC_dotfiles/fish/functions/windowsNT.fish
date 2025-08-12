function windowsNT 
    set_color 4169e1;
    echo Windows 11 | figlet
    read -l -P 'Are you sure you want to reboot into windows 11[Y/n]?' ans
    set_color normal;

    switch $ans
      case Y y 
        sudo grub-reboot 2
        kdereboot
        qdbus6 org.kde.Shutdown /Shutdown logoutAndReboot
        if test $status -ne 0
            echo Ooops you are not on kde rebooting traditionally
            command reboot
        end
      case N n '*'
        echo Aborting, we live to dance in the GNU light another day
    end
end
