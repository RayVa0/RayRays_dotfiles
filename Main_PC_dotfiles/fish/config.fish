# Set up Aliases
alias unifetch 'unifetch --chafa ~/.config/hypr/zero_square.png'
alias hyprconf 'nvim ~/.config/hypr/hyprland.conf'
alias yay-clean 'yay --answerdiff None --answerclean All'
alias silence 'killall -9'


function fish_greeting

    set y (random 0 1 100) 

    if test $y -lt 50 #50% chance for a message

        set x (random choice (cat ~/.config/fish/greet_text.txt))

        set z (random 0 1 100)
        if test $z -le 90
            set_color f5f5dc; echo -n Quote of the instance: \n\"$x\" \n
        else 
            echo -n Quote of the instance:\n\"$x\" \n | lolcat
        end
    else #50% it is an image
        set z (random 0 1 100)
        if test $z -gt 99 #1% it is from the repo 
            set g (random 0 1 10000) #g for gooning
            if test $g -eq 1 #1 in a million agpfetch
                sh ~/Templates/goonfetch.sh
                set_color brmagenta; echo -n \nThere is a one in a million chance of the terminal initiating with a pornographic image such as this one!
            else
                set_color brmagenta; echo --- Todays peculiar Repo delight: --- 
                sh ~/Templates/imagefetch.sh /mnt/SATA_SSD/Photos/The_Repo/ 1  
            end
        else if test $z -gt 66 #50/50 from video games or media
            set_color 20dfdf; echo --- A nice image: ---
            sh ~/Templates/imagefetch.sh /mnt/SATA_SSD/Screen\ Captures/Media\ Captures 1 
        else if test $z -gt 33
            set_color green; echo --- A nice Video Game image: ---
            sh ~/Templates/imagefetch.sh /mnt/SATA_SSD/Screen\ Captures/Game\ Captures 1
        else
            set_color 7057ff; echo --- A nice piece of art: ---
            sh ~/Templates/imagefetch.sh /mnt/SATA_SSD/Photos/Art 3
        end
    end 
    
end

if status is-login
      sh ~/Templates/init.sh
end 


