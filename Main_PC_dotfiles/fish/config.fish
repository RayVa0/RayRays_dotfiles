# Set up Aliases
alias hyprconf 'nvim ~/.config/hypr/hyprland.conf'
alias yay-clean 'yay --answerdiff None --answerclean All'


function fish_greeting
    if test -z $COLORTERM 
        fastfetch 
        return 0
    end
    set y (random 0 1 100) 
    
    if test $y -lt 90 #90% chance for a message
        textfetch
    else #10% it is an image 
        mediafetch_terminal
    end  
end

if status is-login
    if test (cat /proc/uptime | gawk '{printf "%.0f", $1}') -lt 45
        /usr/lib/plasma-dbus-run-session-if-needed /usr/bin/startplasma-wayland
    end
end 

function mediafetch_terminal
    sleep 0.1
    set allow_xxx 1
    set z (random 0 1 100)
    if test $allow_xxx -eq 0
        set z (random 0 1 66)
    end 

    if test $z -gt 100 #deprecated 
        set g (random 0 1 125000) #g for gooning
        set 4chan (random 0 1 9)

        if test $g -eq 1 #1 in a million agpfetch
            set_color brred; echo -n 'Warning ' 
            command sleep 1
            set_color brred; echo -n 'Warning ' 
            command sleep 1
            set_color brred; echo Warning 
            command sleep 1
            sh ~/Templates/imagefetch.sh /mnt/SATA_SSD/Photos/Homework/Vanilla 3
            set_color brmagenta; echo There is a one in a million chance of the shell initiating with a pornographic image such as this one!
        else if test $4chan -ne 0 #1 in 10
            sh ~/Templates/imagefetch.sh /mnt/SATA_SSD/Photos/The_Repo/ 3
            set_color brmagenta; echo --- Todays peculiar Repo delight: --- 
        else 
            set_color 00ff00;
            sh ~/Templates/imagefetch.sh /mnt/SATA_SSD/Photos/TTTT_Repo/ 3
            echo --- An oddity from 4chan: ---
        end
    else if test $z -gt 66 #33% media
        set_color 00ffff;
        sh ~/Templates/imagefetch.sh /mnt/SATA_SSD/Screen\ Captures/Media\ Captures 1 
    else if test $z -gt 33 #33% games 
        set_color 228b22;
        sh ~/Templates/imagefetch.sh /mnt/SATA_SSD/Screen\ Captures/Game\ Captures 1
    else #33% from art 
        set_color 7057ff;
        sh ~/Templates/imagefetch.sh /mnt/SATA_SSD/Photos/Art/ 3
        echo --- A nice piece of art: ---
    end 
  end

function textfetch
 set x (random choice (cat ~/.config/fish/greet_text.txt))
 set color (pastel random | pastel saturate 1 | pastel format hex | head -n 1)

    set z (random 0 1 100)
    if test $z -le 90
        set_color $color; echo -n Quote of the terminal: \n\"$x\" \n
    else 
        echo -n Quote of the instance:\n\"$x\" \n | lolcat
    end
end

function bind_bang
    switch (commandline -t)[-1]
        case "!"
            commandline -t -- $history[1]
            commandline -f repaint
        case "*"
            commandline -i !
    end
end

function bind_dollar
    switch (commandline -t)[-1]
        case "!"
            commandline -f backward-delete-char history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

function fish_user_key_bindings
    bind ! bind_bang
    bind '$' bind_dollar
end

function find_edit --wraps nvim --description 'Searches for a file and opens it in nvim'
    sudo nvim $(whereis $argv | gawk '{ print $2 };' )
end

function update_dotfiles 
    if test "$argv" = "-q"
        echo "---Quiet---"
        fish ~/Templates/update_dotfiles.fish >/dev/null 2>&1
        if test $status -eq 0
            set_color 00ff00; echo All ok
        else 
            set_color ff0000; echo script went exited with an error
        end
    else 
        fish ~/Templates/update_dotfiles.fish 
    end

end

function sysu
    ping furaffinity.net -c 1 > /dev/null 2>&1
    if test $status -ne 0
        echo No net
        return 1
    end

    set packages (yay -Q | wc -l)
    set threshold 32

    yay -Sy > /dev/null 2>&1

    if test $status -ne 0
        echo "yay failed(prob aur agian)"
        return 3
    end

    set out_of_date (yay -Qu | wc -l)

    if test $out_of_date -ge $threshold
        yay
        return 0
    else 
        set_color ff0000; echo System doesnt need an update yet
    end

    if yay -Qu | grep nvidia-utils > /dev/null
        set_color 00ff00; echo Wait, new Nvidia driver maybe check it out?
    end

    return 2
end

function dirsize_helper 
    for i in (ls -a)
        du -sh $i
    end
end

function dirsize
    dirsize_helper | sort -hr
end

function yay 
    if test (count $argv) -eq 0
        sysu
    else
        command yay $argv
    end
end 

