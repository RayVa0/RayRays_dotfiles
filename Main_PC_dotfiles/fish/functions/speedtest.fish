function speedtest --wraps=speedtest-cli --description 'alias speedtest speedtest --bytes --simple'
 command speedtest --bytes --simple $argv
        
end
