function test_network --wraps='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -' --description 'alias test_network curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'
  curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python - $argv
        
end
