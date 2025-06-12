# Set up Aliases
alias unifetch 'unifetch --chafa ~/.config/hypr/zero_square.png'
alias hyprconf 'nvim ~/.config/hypr/hyprland.conf'
alias yay-clean 'yay --answerdiff None --answerclean All'
#alias ai 'tgpt --provider deepseek'
alias silence 'killall -9'


function fish_greeting
    
    set x (random choice { 'こんにちは', '死', 'ようこそ', 'Welcome to the Arch Linux command line interface', 'Hello, Dave', '"I am not a huge fan of incest I just think it is cool." -Mr Longingly', 'Fishing in just to fish out', 'Betcha you cant stick it', 'Variable refresh rate is necessary for even frame pacing in most scenarios' \
                    ,'Krill yourself?', 'Ladies, Gentletheys and Others', 'Warning the driver for your liver will crash in 8.93 seconds', 'Welcome back to Bottom Gear', 'Welcome back to the Grand Trip', 'Metal Gear?', '本当に素晴らしい', 'Is life not beatiful?', 'Look! freznel.' \
                    ,'おはよう', 'Welcome!', 'Good girl!', 'Good boy!', 'Good they!', 'Hey girl, I mean they..', 'Done gooning?', 'What is man but a miserable pile of Secrets', 'Welcome to the GNU/Linux shell or as I like to call it GNU plus Linux', 'Save Linux desktop Valve-san', 'ようこそ', 'いらっしゃいませ' \
                    ,'Valve 助けてください!', 'There is yet another dependency conflict', 'Windows, Hello?', 'Nina from Girls Band Cry is literally me you guys!', 'Thorfin from Vinland Saga is literally meeeee!', 'God, created in man\'s image!', 'Throughout heaven and earth, I alone am the honored one' \
                    ,'I am not a huge fan of female pov I just think it\'s cool, just like incest', 'The \'restart\' command will restart an application via SIGKILL', 'Plex must be launced by invoking the \'plex\' command', 'You can use \'yay-clean\' to reinstall a package from scratch' \ 
                    ,'If you wish you can invoke the \'win\' command to immediatly boot into the Windows 11 operating system', 'You can use the \'hyprconf\' command to open the hyprland configuration file', 'You can use the \'fisconf\' command to open the fish configuration file', 'Bloat + Bloat', 'GNU + Bloat', 'Bloat + Linux', 'Domain Expansion: Infinite void', 'Domain Expansion: Self-Embodiment of perfection' \ 
                    ,'Domain Expansion: Malevolent shrine', 'Gege what the fuck is Yuji\'s domain even called?', 'Rest In Peace my loving husband: Gojo Satoru, 1989-2018', 'てんじょうてんがゆいがどくそん', 'Sex, what?', 'Game\'s over!', 'We\'re done here!', 'Memes Jack, the DNA of the soul!', 'Just like the good old days after 9/11!', 'You think I made the market for Ganyu Jack? It\'s just human nature and I just market it to sexy children' \
                    ,'I hate children I am the like the opposite of a pedophile', 'Hype moments and aura', 'Hype aura and moments', 'Invoking the \'food\' command will print to the terminal the food which you desire the most!', 'Friendship ended with hyperland now KDE is my best friend', 'Other languages don\'t even have parallelization', '/minecraft /run kill long man --for-sure' })
    set y (random 1 2)

    if test $y -eq 1
      echo $x
    else 
      echo $x | lolcat
    end
end

if status is-login
      rm -rf ~/.local/state/nvim/swap/ 
      KDE    
end 


