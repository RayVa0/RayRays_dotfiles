if status is-interactive
    # Commands to run in interactive sessions can go here

end

function fish_greeting
      textfetch
end

if status is-login
      kde
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
