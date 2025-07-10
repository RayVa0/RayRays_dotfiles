# Set up Aliases
alias hyprconf 'nvim ~/.config/hypr/hyprland.conf'
alias yay-clean 'yay --answerdiff None --answerclean All'


function fish_greeting

    set y (random 0 1 100) 

    if test $y -lt 50 #50% chance for a message
        textfetch
    else #50% it is an image
        mediafetch
    end 
    
end

if status is-login
      sh ~/Templates/init.sh
end 

function mediafetch
    set z (random 0 1 100)
        if test $z -gt 75 #1% it is from the repo 
            set g (random 0 1 125000) #g for gooning
            if test $g -eq 1 #1 in a million agpfetch
                set_color brred; echo -n 'Warning ' 
                command sleep 1
                set_color brred; echo -n 'Warning ' 
                command sleep 1
                set_color brred; echo Warning 
                command sleep 1
                sh ~/Templates/imagefetch.sh /mnt/SATA_SSD/Photos/Homework/Vanilla 3
                set_color brmagenta; echo There is a one in a million chance of the shell initiating with a pornographic image such as this one!
            else
                set_color brmagenta; echo --- Todays peculiar Repo delight: --- 
                sh ~/Templates/imagefetch.sh /mnt/SATA_SSD/Photos/The_Repo/ 3 
            end
        else if test $z -gt 50 #50/50 from video games or media
            set_color 20dfdf; echo --- A nice media image: ---
            sh ~/Templates/imagefetch.sh /mnt/SATA_SSD/Screen\ Captures/Media\ Captures 1 
        else if test $z -gt 25
            set_color green; echo --- A nice Video Game image: ---
            sh ~/Templates/imagefetch.sh /mnt/SATA_SSD/Screen\ Captures/Game\ Captures 1
        else
            set_color 7057ff; echo --- A nice piece of art: ---
            sh ~/Templates/imagefetch.sh /mnt/SATA_SSD/Photos/Art 3
        end
end

function textfetch
 set x (random choice (cat ~/.config/fish/greet_text.txt))

    set z (random 0 1 100)
    if test $z -le 90
        set_color f5f5dc; echo -n Quote of the instance: \n\"$x\" \n
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
